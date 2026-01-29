import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottom_nav.dart';

class KasirView extends StatefulWidget {
  const KasirView({super.key});

  @override
  State<KasirView> createState() => _KasirViewState();
}

class _KasirViewState extends State<KasirView> {
  // List produk tanpa field oldPrice
  final List<Map<String, dynamic>> products = [
    {
      "name": "Kemeja denim berpinggang",
      "price": "Rp 499.900",
      "image":
          "https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/zoom/eadda627382c8fec882747fe54f8b2b5e78327a1_xxl-1.jpg",
    },
    {
      "name": "Celana panjang campuran linen",
      "price": "Rp 499.900",
      "image":
          "https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/d3b8ce419ed0c58c32c8ef796075af992953231d_xxl-1.jpg",
    },
    {
      "name": "Kaos Katun",
      "price": "Rp 199.900",
      "image":
          "https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/2d470531d76204816d2400246be040457703c369_xxl-1.jpg",
    },
    {
      "name": "Celana katun lebar",
      "price": "Rp 699.900",
      "image":
          "https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/e790921b43eaf1120a2668984ffdad8ef1700be3_xxl-1.jpg",
    },
    {
      "name": "Jeans Ultra Tinggi Model Wide",
      "price": "Rp 599.900",
      "image": "https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/5cdc832d74c61a40ca04e4f0511df2f7e43c1ca3_xxl-1.jpg",
    },
    {
      "name": "Kaos Katun",
      "price": "Rp 199.900",
      "image": "https://d29c1z66frfv6c.cloudfront.net/pub/media/catalog/product/large/378dd63915504a38e76c462e3f393ad2d0b5884e_xxl-1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Header ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    "Product\nCatalog",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 38,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF3E2723),
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 50,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xFF556B2F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),

            // --- Search Bar ---
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search products...",
                  hintStyle: GoogleFonts.plusJakartaSans(
                    color: const Color(0xFF795548).withOpacity(0.5),
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Color(0xFF3E2723),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: const Color(0xFF795548).withOpacity(0.2),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF556B2F),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),

            // --- Section Label ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text(
                "AVAILABLE ITEMS",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF795548).withOpacity(0.6),
                  letterSpacing: 1.2,
                ),
              ),
            ),

            // --- Product Grid ---
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      0.75, // Disesuaikan kembali karena harga coret hilang
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(products[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(1),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF795548).withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFDFBF9),
                borderRadius: BorderRadius.circular(18),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  item['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.inventory_2_outlined,
                    size: 32,
                    color: Color(0xFF556B2F),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            item['name'],
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: const Color(0xFF3E2723),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // --- HANYA HARGA UTAMA ---
          Text(
            item['price'],
            style: GoogleFonts.plusJakartaSans(
              fontWeight: FontWeight.w800,
              fontSize: 15,
              color: const Color(0xFF556B2F),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.check_circle_outline_rounded,
                size: 14,
                color: Color(0xFF556B2F),
              ),
              const SizedBox(width: 4),
              Text(
                "In Stock",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF556B2F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
