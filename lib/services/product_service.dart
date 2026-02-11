import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/response_data_list.dart';
import '../models/toko_model.dart';
import '../models/user_login.dart';
import '../services/url.dart' as url;

class Tokoservice {
  Future<ResponseDataList> getToko() async {
    UserLogin userLogin = UserLogin();
    var user = await userLogin.getUserLogin();

    if (user.status == false) {
      return ResponseDataList(status: false, message: 'Anda belum login');
    }

    var uri = Uri.parse("${url.baseUrl}/admin/getbarang");
    Map<String, String> headers = {"Authorization": 'Bearer ${user.token}'};

    var response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data["status"] == true) {
        List listBarang = data["data"]
            .map((r) => TokoModel.fromJson(r))
            .toList();
        return ResponseDataList(
          status: true,
          message: 'Success',
          data: listBarang,
        );
      }
    }
    return ResponseDataList(status: false, message: 'Gagal ambil data');
  }
}
