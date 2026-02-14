import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:penugasan1/services/product_service.dart';
import '../widgets/bottom_nav.dart';
import '../models/product_model.dart';
import '../models/response_data_list.dart';

class KasirView extends StatefulWidget {
  const KasirView({super.key});

  @override
  State<KasirView> createState() => _KasirViewState();
}

class _KasirViewState extends State<KasirView> {
  // Variabel untuk menyimpan proses pengambilan data
  late Future<ResponseDataList> _productFuture;

  @override
  void initState() {
    super.initState();
    // Inisialisasi pengambilan data saat widget pertama kali dibuat
    _productFuture = ProductService.getProduct();
  }

  // Helper untuk format mata uang Rupiah
  String formatRupiah(int price) {
    return NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Expanded(
              child: FutureBuilder<ResponseDataList>(
                future: _productFuture,
                builder: (context, snapshot) {
                  // 1. SPINNER UTAMA: Muncul saat loading data dari API
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF556B2F),
                      ),
                    );
                  }

                  // 2. JIKA TERJADI ERROR
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "Gagal mengambil data produk",
                        style: GoogleFonts.plusJakartaSans(),
                      ),
                    );
                  }

                  // 3. JIKA DATA BERHASIL DIAMBIL
                  if (snapshot.hasData) {
                    final listProduk = snapshot.data?.data
                        ?.cast<ProductModel>();

                    if (listProduk == null || listProduk.isEmpty) {
                      return const Center(child: Text("Produk tidak tersedia"));
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      itemCount: listProduk.length,
                      itemBuilder: (context, index) {
                        return _buildProductCard(listProduk[index]);
                      },
                    );
                  }

                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }

  // Widget Header
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product List",
            style: GoogleFonts.plusJakartaSans(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF3E2723),
            ),
          ),
          const SizedBox(height: 8),
          Container(width: 40, height: 4, color: const Color(0xFF556B2F)),
        ],
      ),
    );
  }

  // Widget Card Produk dengan Spinner Gambar
  Widget _buildProductCard(ProductModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // BAGIAN GAMBAR
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                item.image ?? "",
                fit: BoxFit.cover,
                // SPINNER GAMBAR: Muncul saat gambar sedang di-download
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2, // Lebih tipis agar cantik
                        color: const Color(0xFF556B2F),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.inventory_2_outlined, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // BAGIAN INFORMASI TEKS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.namaBarang ?? "Tanpa Nama",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: const Color(0xFF3E2723),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Sisa Stok: ${item.stok ?? 0}",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: (item.stok ?? 0) < 5 ? Colors.red : Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  formatRupiah(item.harga ?? 0),
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                    color: const Color(0xFF556B2F),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
