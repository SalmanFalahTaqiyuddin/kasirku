# 🛒 Aplikasi Kasir - Implementasi Autentikasi API

Proyek ini adalah aplikasi Flutter yang mengimplementasikan sistem autentikasi (Login & Register) yang terintegrasi dengan REST API. Proyek ini merupakan pemenuhan Tugas Individu untuk mengelola sesi pengguna dan menampilkan data profil secara dinamis.

---

## 🎯 Tujuan Pembelajaran
* Membangun fitur **Login & Register** yang terintegrasi dengan REST API.
* Mengelola sesi pengguna (**Session Management**) menggunakan `shared_preferences`.
* Menampilkan data profil pengguna secara dinamis pada halaman Dashboard.
* Menerapkan validasi form dan feedback pengguna (Loading Spinner & Alert).

## ✨ Fitur Utama
* **Registrasi Pengguna**: Pendaftaran akun baru (Lanjutan Penugasan 1).
* **Login Autentikasi**: Validasi akun melalui endpoint API `/login`.
* **Session Management**: Menggunakan `shared_preferences` agar sesi login tetap tersimpan.
* **Dashboard Dinamis**: Menampilkan pesan "Selamat Datang, [Nama User]! Role Anda adalah [Role]".
* **Secure UX**: Fitur show/hide password dan validasi input field.
* **Loading State**: Menampilkan spinner saat proses autentikasi berlangsung.
* **Logout**: Menghapus data sesi di memori lokal dan kembali ke halaman Login.

## 🛠️ Langkah Instalasi & Menjalankan
1. **Clone Repositori**:
   ```bash
   git clone [https://github.com/SalmanFalahTaqiyuddin/kasirku.git](https://github.com/SalmanFalahTaqiyuddin/kasirku.git)
