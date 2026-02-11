import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // Tambahkan intl di pubspec.yaml untuk format rupiah
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
  ProductService productService = ProductService();
  List<ProductModel>? listProduk;

  // Logika UI: Mengambil data dari service
  getProduk() async {
    ResponseDataList response = await ProductService.getProduct();
    setState(() {
      // Mengonversi data ke List<TokoModel> agar aman
      listProduk = response.data?.cast<ProductModel>();
    });
  }

  @override
  void initState() {
    super.initState();
    getProduk();
  }

  // Helper untuk format Rupiah
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
              // Logika UI: Jika data null (loading), tampilkan CircularProgressIndicator
              child: listProduk == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF556B2F),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      itemCount: listProduk!.length,
                      itemBuilder: (context, index) {
                        return _buildProductCard(listProduk![index]);
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }

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

  // Desain Card Produk
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
          // Foto Produk (NetworkImage)
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
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.inventory_2_outlined, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Informasi Produk
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
                // Stok
                Text(
                  "Sisa Stok: ${item.stok ?? 0}",
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    color: (item.stok ?? 0) < 5 ? Colors.red : Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                // Harga
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
