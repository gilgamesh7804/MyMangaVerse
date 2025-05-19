document.addEventListener('DOMContentLoaded', function () {

    // Toggle Navigation (for mobile or responsive menu)
    const navToggle = document.querySelector('.nav-toggle');
    const navMenu = document.querySelector('.nav-menu');
    if (navToggle && navMenu) {
        navToggle.addEventListener('click', function () {
            navMenu.classList.toggle('active');
        });
    }

    // Manga Search Functionality
    const searchButton = document.getElementById('search-button');
    const searchInput = document.getElementById('search-input');
    const mangaItems = document.querySelectorAll('.manga-item');
    
    if (searchButton && searchInput) {
      searchButton.addEventListener('click', function () {
        const searchTerm = searchInput.value.toLowerCase();
        mangaItems.forEach(item => {
          const title = item.querySelector('h3').textContent.toLowerCase();
          item.style.display = title.includes(searchTerm) ? 'block' : 'none';
        });
      });
    }

    // Contact Form Validation (example, must exist in DOM)
    const contactForm = document.querySelector('#contact form');
    if (contactForm) {
        contactForm.addEventListener('submit', function (event) {
            event.preventDefault();
            const nameInput = contactForm.querySelector('#name');
            const emailInput = contactForm.querySelector('#email');
            const messageInput = contactForm.querySelector('#message');

            if (
                nameInput.value.trim() === '' ||
                emailInput.value.trim() === '' ||
                messageInput.value.trim() === ''
            ) {
                alert('Please fill in all fields.');
                return;
            }

            // Example: check if email is in valid format
            const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
            if (!emailInput.value.match(emailPattern)) {
                alert('Please enter a valid email address.');
                return;
            }

            // Log form data
            console.log('Name:', nameInput.value);
            console.log('Email:', emailInput.value);
            console.log('Message:', messageInput.value);

            contactForm.reset();
        });
    }

    // Smooth Scroll Debounce (optional scroll handling)
    let timeout;
    window.addEventListener('scroll', () => {
        clearTimeout(timeout);
        timeout = setTimeout(() => {
            // Add custom scroll logic if needed
        }, 10);
    });

    let lastScrollY = window.scrollY;
const header = document.getElementById('main-header');

window.addEventListener('scroll', () => {
    if (window.scrollY > lastScrollY) {
        header.style.top = "-100px";  // Hide
    } else {
        header.style.top = "0";       // Show
    }
    lastScrollY = window.scrollY;
});

function toggleChapters(element) {
  const chapterList = element.querySelector('.chapter-list');
  if (chapterList) {
    chapterList.style.display = chapterList.style.display === 'block' ? 'none' : 'block';
  }
}
function showMangaDetails(title, description, imageUrl, chapters) {
    // Fill in details
    document.getElementById('manga-title').textContent = title;
    document.getElementById('manga-description').textContent = description;
    document.getElementById('manga-image').src = imageUrl;

    // Build chapter list
    const ul = document.getElementById('manga-chapters');
    ul.innerHTML = '';
    chapters.forEach(ch => {
      const li = document.createElement('li');
      li.textContent = ch;
      ul.appendChild(li);
    });

    // Show the detail pane
    const details = document.getElementById('manga-details');
    details.style.display = 'block';
    details.scrollIntoView({ behavior: 'smooth' });
  }
});

// ===== Registration Form Handler =====
const registerForm = document.getElementById('registerForm');
const registerAlert = document.getElementById('alert');
if (registerForm) {
  registerForm.addEventListener('submit', async e => {
    e.preventDefault();
    const data = new FormData(registerForm);
    const resp = await fetch(registerForm.action, {
      method: 'POST',
      body: data
    });
    if (resp.ok) {
      registerForm.style.display = 'none';
      registerAlert.textContent = '🎉 Registration successful! Redirecting...';
      registerAlert.style.display = 'block';
      setTimeout(() => {
        window.location.href = registerForm.dataset.redirect || '/manga';
      }, 2000);
    } else {
      const json = await resp.json().catch(() => ({}));
      registerAlert.textContent = json.message || 'Registration failed';
      registerAlert.style.display = 'block';
    }
  });
}

// ===== Sign-In Form Handler =====
const signInForm = document.getElementById('signInForm');
const signInAlert = document.getElementById('alert');
if (signInForm) {
  signInForm.addEventListener('submit', async e => {
    e.preventDefault();
    const data = new FormData(signInForm);
    const resp = await fetch(signInForm.action, {
      method: 'POST',
      body: data
    });
    if (resp.ok) {
      signInForm.style.display = 'none';
      signInAlert.textContent = '✅ Sign-in successful! Redirecting…';
      signInAlert.style.display = 'block';
      setTimeout(() => {
        window.location.href = signInForm.dataset.redirect || '/manga';
      }, 1000);
    } else {
      const json = await resp.json().catch(() => ({}));
      signInAlert.textContent = json.message || 'Invalid credentials';
      signInAlert.style.display = 'block';
    }
  });
}
