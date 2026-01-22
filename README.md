# 🛒 Tugas Individu: Implementasi Autentikasi API pada Aplikasi Kasir

Aplikasi ini merupakan pengembangan dari **Penugasan 1**, yang kini telah terintegrasi dengan fitur Login, Session Management, dan Dashboard Dinamis sesuai dengan kurikulum pembelajaran Flutter.

---

## 📖 Deskripsi Tugas & Skenario
Setelah berhasil membuat fitur registrasi pada Penugasan 1, proyek ini mengaktifkan fitur Login. Aplikasi Kasir divalidasi dengan akun yang telah didaftarkan dan menyimpan data sesi tersebut agar pengguna tidak perlu login berulang kali saat aplikasi dibuka kembali.

### Tujuan Pembelajaran:
1. Siswa mampu membangun fitur **Login** yang terintegrasi dengan REST API.
2. Siswa mampu mengelola sesi pengguna (**Session Management**) menggunakan `shared_preferences`.
3. Siswa mampu menampilkan data profil pengguna dari memori lokal ke halaman Dashboard.
4. Siswa mampu menerapkan validasi form dan user feedback (loading & alert).

---

## ✨ Fitur & Implementasi
- **Kesinambungan Project**: Menggunakan codebase yang sama dengan fitur Register (Penugasan 1).
- **Fungsionalitas Login**: Berhasil login melalui endpoint `/login` dan data tersimpan otomatis di `SharedPreferences`.
- **Implementasi Model**: Menggunakan `UserLogin` pada `models/user_login.dart` untuk distribusi data ke UI.
- **UI & Validasi**: 
  - Inputan Email dan Password dengan validasi field kosong.
  - Fitur **Show/Hide Password** untuk meningkatkan UX.
  - **Loading Spinner** saat proses autentikasi berlangsung.
- **Dashboard Dinamis**: Menampilkan nama user dan role*.
- **Sistem Logout**: Menghapus session dari memori lokal dan kembali ke halaman Login.

---

## 📂 Struktur Project
Berdasarkan instruksi pengerjaan:
* `lib/models/user_login.dart` -> Class UserLogin & fungsi `prefs()`, `getUserLogin()`.
* `lib/services/user_service.dart` -> Fungsi `loginUser(data)` untuk endpoint API.
* `lib/views/login_view.dart` -> UI Login & Validasi.
* `lib/views/dashboard_view.dart` -> UI Dashboard & Logout.

---

## 🛠️ Langkah Instalasi & Pengumpulan

### Cara Menjalankan di Lokal:
```bash
# 1. Clone Repositori
git clone [https://github.com/SalmanFalahTaqiyuddin/kasirku.git](https://github.com/SalmanFalahTaqiyuddin/kasirku.git)

# 2. Masuk ke Folder Project
cd kasirku

# 3. Ambil Dependensi
flutter pub get

# 4. Jalankan Aplikasi
flutter run
