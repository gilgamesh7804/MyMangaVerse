import sqlite3

conn = sqlite3.connect('manga.db')
c = conn.cursor()

# Create manga table
c.execute('''
    CREATE TABLE IF NOT EXISTS manga (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        author TEXT,
        description TEXT,
        cover_image TEXT
    )
''')

# Create manga_chapters table
c.execute('''
    CREATE TABLE IF NOT EXISTS manga_chapters (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        manga_id INTEGER NOT NULL,
        chapter_number INTEGER NOT NULL,
        title TEXT NOT NULL,
        pdf_path TEXT NOT NULL,
        FOREIGN KEY (manga_id) REFERENCES manga(id) ON DELETE CASCADE
    )
''')

# Create users table
c.execute('''
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL
    )
''')

conn.commit()
conn.close()
print("Database 'manga.db' initialized successfully.")