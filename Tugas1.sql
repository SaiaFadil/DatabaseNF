CREATE DATABASE dbpos;

USE dbpos;

CREATE TABLE kartu (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(6) UNIQUE,
    nama VARCHAR(30) NOT NULL,
    diskon DOUBLE,
    iuran DOUBLE
);
CREATE TABLE pelanggan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    jk CHAR(1),
    tmp_lahir VARCHAR(30),
    tgl_lahir DATE,
    email VARCHAR(45),
    kartu_id INT NOT NULL,
    FOREIGN KEY (kartu_id) REFERENCES kartu(id)
);

CREATE TABLE pesanan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE,
    total DOUBLE,
    pelanggan_id INT NOT NULL,
    FOREIGN KEY (pelanggan_id) REFERENCES pelanggan(id)
);

CREATE TABLE pembayaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nokuitansi VARCHAR(10) UNIQUE,
    tanggal DATE,
    jumlah DOUBLE,
    ke INT,
    pesanan_id INT NOT NULL,
    FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
);

CREATE TABLE jenis_produk (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(45)
);

CREATE TABLE produk (
    id INT AUTO_INCREMENT PRIMARY KEY,
    kode VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    harga_beli DOUBLE,
    harga_jual DOUBLE,
    stok INT,
    min_stok INT,
    jenis_produk_id INT,
    FOREIGN KEY (jenis_produk_id) REFERENCES jenis_produk(id)
);

CREATE TABLE pesanan_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produk_id INT NOT NULL,
    pesanan_id INT NOT NULL,
    qty INT,
    harga DOUBLE,
    FOREIGN KEY (produk_id) REFERENCES produk(id),
    FOREIGN KEY (pesanan_id) REFERENCES pesanan(id)
);

CREATE TABLE vendor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nomor VARCHAR(10) UNIQUE,
    nama VARCHAR(45),
    kota VARCHAR(30),
    kontak VARCHAR(30)
);

CREATE TABLE pembelian (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tanggal VARCHAR(45),
    nomor VARCHAR(10),
    produk_id INT NOT NULL,
    jumlah INT,
    harga DOUBLE,
    vendor_id INT NOT NULL,
    FOREIGN KEY (produk_id) REFERENCES produk(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);
