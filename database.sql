-- Database untuk Website Toko Tas S&L
CREATE DATABASE IF NOT EXISTS toko_tas_sl;
USE toko_tas_sl;

-- Tabel Admin
CREATE TABLE IF NOT EXISTS admin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nama VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert admin default (username: admin, password: admin123)
INSERT INTO admin (username, password, nama) VALUES 
('admin', 'admin123', 'Administrator');

-- Tabel Products
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(200) NOT NULL,
    deskripsi TEXT,
    harga DECIMAL(10,2) NOT NULL,
    gambar VARCHAR(255),
    stok INT DEFAULT 0,
    kategori VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample products
INSERT INTO products (nama_produk, deskripsi, harga, gambar, stok, kategori) VALUES
('Tas Ransel Casual', 'Tas ransel stylish untuk sehari-hari dengan banyak kompartemen', 250000, '', 15, 'Ransel'),
('Tas Selempang Kulit', 'Tas selempang premium dari kulit asli', 350000, '', 10, 'Selempang'),
('Tas Laptop Professional', 'Tas laptop dengan padding empuk dan desain profesional', 450000, '', 8, 'Laptop'),
('Tas Tote Kanvas', 'Tas tote dari bahan kanvas berkualitas tinggi', 180000, '', 20, 'Tote'),
('Tas Pinggang Travel', 'Tas pinggang praktis untuk traveling', 150000, '', 12, 'Pinggang'),
('Tas Backpack Outdoor', 'Tas backpack untuk aktivitas outdoor dan hiking', 550000, '', 6, 'Ransel');

-- Tabel Cart
CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    session_id VARCHAR(100) NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

-- Index untuk performa
CREATE INDEX idx_session ON cart(session_id);
CREATE INDEX idx_product ON cart(product_id);