# 🛒 Kasirku - Point of Sales System

**Kasirku** adalah aplikasi manajemen penjualan (POS) berbasis web yang dirancang untuk membantu pengelolaan toko secara digital. Dibangun dengan framework Laravel, aplikasi ini menawarkan kemudahan dalam manajemen stok, transaksi kasir, hingga pelaporan keuangan yang akurat.

---

## ✨ Fitur Utama
* **Manajemen Barang**: Kelola stok, harga beli, harga jual, dan kategori produk.
* **Transaksi Kasir**: Input penjualan cepat dengan perhitungan otomatis.
* **Manajemen Supplier**: Pendataan pemasok barang untuk mempermudah restock.
* **Laporan Penjualan**: Pantau histori transaksi dan laba rugi.
* **Multi-User**: Sistem login untuk Admin dan Petugas/Kasir.
* **Cetak Struk**: Fitur cetak nota penjualan.

## 🚀 Teknologi
* **Backend**: Laravel (PHP)
* **Frontend**: Blade Templates, Bootstrap, AdminLTE
* **Database**: MySQL

## 🛠️ Cara Instalasi
1.  **Clone Repositori**:
    `git clone https://github.com/SalmanFalahTaqiyuddin/kasirku.git`
2.  **Masuk ke Folder**:
    `cd kasirku`
3.  **Instal Dependensi**:
    `composer install`
    `npm install && npm run dev`
4.  **Setup Environment**:
    `cp .env.example .env` (Sesuaikan detail database di file .env)
5.  **Generate Key & Migrate**:
    `php artisan key:generate`
    `php artisan migrate --seed`
6.  **Jalankan Aplikasi**:
    `php artisan serve`

---

## 📸 Tampilan Aplikasi
*(Silakan tambahkan link screenshot aplikasi Anda di sini untuk tampilan yang lebih profesional)*

## 🤝 Kontribusi
Kontribusi terbuka untuk siapa saja. Silakan lakukan Fork, buat branch fitur, dan kirimkan Pull Request.

## 📄 Lisensi
Proyek ini dilisensikan di bawah [MIT License](https://opensource.org/licenses/MIT).

---
**Developed by [Salman Falah Taqiyuddin](https://github.com/SalmanFalahTaqiyuddin)**
