// Konfirmasi sebelum menghapus
function confirmDelete(productName) {
    return confirm('Apakah Anda yakin ingin menghapus produk "' + productName + '"?');
}

// Validasi form kontak
function validateContactForm() {
    const name = document.getElementById('name').value.trim();
    const email = document.getElementById('email').value.trim();
    const message = document.getElementById('message').value.trim();
    
    if (name === '' || email === '' || message === '') {
        alert('Semua field harus diisi!');
        return false;
    }
    
    // Validasi email sederhana
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        alert('Format email tidak valid!');
        return false;
    }
    
    return true;
}

// Update quantity di cart
function updateQuantity(cartId, quantity) {
    if (quantity < 1) {
        alert('Jumlah minimal adalah 1');
        return;
    }
    
    window.location.href = 'update_cart.php?id=' + cartId + '&quantity=' + quantity;
}

// Smooth scroll untuk anchor links
document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href !== '#') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            }
        });
    });
});

// Auto-hide alerts
window.addEventListener('load', function() {
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(() => {
            alert.style.transition = 'opacity 0.5s';
            alert.style.opacity = '0';
            setTimeout(() => alert.remove(), 500);
        }, 5000);
    });
});