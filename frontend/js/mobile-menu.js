/**
 * Mobile Menu Toggle Script
 * Handles the opening/closing of the navigation menu on mobile devices.
 */
document.addEventListener('DOMContentLoaded', () => {
    const hamburger = document.querySelector('.nav__toggle');
    const navMenu = document.querySelector('.navbar'); // Using .navbar as the container

    // We need to target the specific ul lists to toggle visibility or a wrapper
    // Based on existing HTML, we have .nav-left and .nav-right

    if (hamburger) {
        hamburger.addEventListener('click', () => {
            navMenu.classList.toggle('mobile-open');
            hamburger.textContent = navMenu.classList.contains('mobile-open') ? '✕' : '☰';
        });
    }

    // Close menu when clicking outside
    document.addEventListener('click', (e) => {
        if (navMenu && navMenu.classList.contains('mobile-open')) {
            if (!navMenu.contains(e.target) && !hamburger.contains(e.target)) {
                navMenu.classList.remove('mobile-open');
                hamburger.textContent = '☰';
            }
        }
    });
});
