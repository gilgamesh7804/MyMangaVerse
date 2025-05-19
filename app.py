from flask import Flask, flash, request, jsonify, render_template, redirect, url_for, g, session
import mysql.connector
from mysql.connector import Error
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import secure_filename
from pdf2image import convert_from_path
import os

UPLOAD_FOLDER = 'static/manga_pdfs'
ALLOWED_EXTENSIONS = {'pdf'}

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.secret_key = 'supersecretkey'

# ---------- Helpers ----------
def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# ---------- Database ----------
def get_db():
    if 'db' not in g:
        g.db = mysql.connector.connect(
            host='localhost',
            user='root',
            password='root',
            database='mangadb'
        )
    return g.db

@app.teardown_appcontext
def close_db(exception):
    db = g.pop('db', None)
    if db is not None:
        db.close()

# ---------- Routes ----------
@app.route('/')
def welcome():
    return render_template('welcome.html')

@app.route('/manga')
def manga():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM manga WHERE category = 'latest'")
    latest = cursor.fetchall()

    cursor.execute("SELECT * FROM manga WHERE category = 'popular'")
    popular = cursor.fetchall()

    cursor.execute("SELECT * FROM manga WHERE category = 'trending'")
    trending = cursor.fetchall()

    return render_template('manga.html', latest=latest, popular=popular, trending=trending)

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    return render_template('register.html')

@app.route('/search')
def search():
    query = request.args.get('q', '').strip()

    if not query:
        return redirect(url_for('manga'))

    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM manga WHERE name LIKE %s", (f"%{query}%",))
    result = cursor.fetchone()

    if result:
        return redirect(url_for('show_manga', manga_id=result['id']))
    else:
        return render_template('not_found.html', query=query)

@app.route('/upload', methods=['GET', 'POST'])
def upload_chapter():
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    if request.method == 'POST':
        chapter_number = request.form.get('chapter')
        manga_id = request.form.get('manga_id')
        pdf_file = request.files.get('pdf')

        if pdf_file and allowed_file(pdf_file.filename):
            filename = secure_filename(pdf_file.filename)
            relative_path = f"manga_pdfs/{filename}"
            full_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            pdf_file.save(full_path)

            cursor.execute('''
                INSERT INTO chapters (manga_id, chapter_number, pdf_path)
                VALUES (%s, %s, %s)
            ''', (manga_id, chapter_number, relative_path))
            conn.commit()
            return redirect(url_for('manga'))
        else:
            return "Invalid or missing PDF file", 400

    cursor.execute("SELECT id, name FROM manga")
    manga_list = cursor.fetchall()
    return render_template('upload.html', manga_list=manga_list)

@app.route('/delete_chapter/<int:chapter_id>', methods=['POST'])
def delete_chapter(chapter_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    # Get the PDF path from the database
    cursor.execute("SELECT pdf_path FROM chapters WHERE id = %s", (chapter_id,))
    chapter = cursor.fetchone()

    if chapter:
        # Delete PDF file from disk
        pdf_full_path = os.path.join('static', chapter['pdf_path'])
        if os.path.exists(pdf_full_path):
            os.remove(pdf_full_path)

        # Delete the chapter from the database
        cursor.execute("DELETE FROM chapters WHERE id = %s", (chapter_id,))
        conn.commit()
        flash("Chapter deleted successfully.")
    else:
        flash("Chapter not found.")

    return redirect(url_for('manga'))

@app.route('/manga/<int:manga_id>')
def show_manga(manga_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM manga WHERE id = %s", (manga_id,))
    manga = cursor.fetchone()

    if not manga:
        return "Manga not found", 404

    cursor.execute("SELECT * FROM chapters WHERE manga_id = %s", (manga_id,))
    chapters = cursor.fetchall()

    return render_template("manga_chapters.html", manga=manga, chapters=chapters)

@app.route('/read/<int:chapter_id>')
def read_chapter(chapter_id):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)

    cursor.execute("SELECT * FROM chapters WHERE id = %s", (chapter_id,))
    chapter = cursor.fetchone()

    if not chapter:
        return "Chapter not found", 404

    cursor.execute("SELECT * FROM manga WHERE id = %s", (chapter['manga_id'],))
    manga = cursor.fetchone()

    if not manga:
        return "Manga not found", 404

    pdf_url = url_for('static', filename=chapter['pdf_path'])

    return render_template(
        'read_chapter.html',
        chapter=chapter,
        manga_title=manga['name'],
        manga_description=manga['description'],
        manga_image_url=url_for('static', filename=manga['cover_image']),
        pdf_url=pdf_url
    )

# ---------- User Registration ----------
@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = generate_password_hash(request.form['password'])

        conn = get_db()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO users (username, email, password_hash) VALUES (%s, %s, %s)",
                       (username, email, password))
        conn.commit()
        conn.close()
        flash("Registration successful. You can now sign in.")
        return redirect(url_for('signin'))

    return render_template('register.html')

@app.route('/signin', methods=['GET', 'POST'])
def signin():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        conn = get_db()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        user = cursor.fetchone()
        conn.close()

        if user and check_password_hash(user['password_hash'], password):
            session['user_id'] = user['id']
            session['username'] = user['username']
            return redirect(url_for('manga'))
        else:
            flash("Invalid credentials")

    return render_template('signin.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('welcome'))

# ---------- Init DB ----------
def init_db():
    conn = get_db()
    cursor = conn.cursor()

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS users (
            id INT AUTO_INCREMENT PRIMARY KEY,
            username VARCHAR(50) NOT NULL,
            email VARCHAR(100) NOT NULL UNIQUE,
            password_hash VARCHAR(255) NOT NULL,
            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ''')

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS manga (
            id INT AUTO_INCREMENT PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            description TEXT,
            cover_image VARCHAR(255)
        )
    ''')

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS chapters (
            id INT AUTO_INCREMENT PRIMARY KEY,
            manga_id INT NOT NULL,
            chapter_number INT NOT NULL,
            title VARCHAR(255),
            pdf_path VARCHAR(255) NOT NULL,
            release_date DATETIME DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (manga_id) REFERENCES manga(id) ON DELETE CASCADE
        )
    ''')

    conn.commit()
    print("✅ MySQL tables initialized")

if __name__ == '__main__':
    with app.app_context():
        init_db()
    app.run(debug=True)
