import '../services/url.dart' as url;

class ProductModel {
  int? id;
  String? namaBarang;
  String? deskripsi;
  int? stok;
  int? harga;
  String? image;

  ProductModel({
    required this.id,
    required this.namaBarang,
    this.deskripsi,
    this.stok,
    this.harga,
    required this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson["id"];
    namaBarang = parsedJson["nama_barang"];
    deskripsi = parsedJson["deskripsi"];
    stok = parsedJson["stok"];
    harga = parsedJson["harga"];

    String path = parsedJson["image"] ?? "";
    image = "${url.BaseUrlTanpaApi}/$path".replaceAll(' ', '%20');
  }
}
