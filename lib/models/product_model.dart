import '../services/url.dart' as url;

class TokoModel {
  int? id;
  String? namaBarang;
  String? deskripsi;
  int? stok;
  int? harga;
  String? image;

  TokoModel({
    required this.id,
    required this.namaBarang,
    this.deskripsi,
    this.stok,
    this.harga,
    required this.image,
  });

  TokoModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    namaBarang = parsedJson["nama_barang"];
    deskripsi = parsedJson["deskripsi"];
    stok = parsedJson["stok"];
    harga = parsedJson["harga"];

    // Gabungkan URL gambar dan hilangkan spasi agar link tidak mati
    String path = parsedJson["image"] ?? "";
    image = "${url.BaseUrlTanpaApi}/$path".replaceAll(' ', '%20');
  }
}
