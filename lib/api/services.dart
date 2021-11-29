import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pttifyme/models/datamodel.dart';

class Services extends GetConnect {
  // static var client = http.client();
  Future<List<dynamic>> getData() async {
    final response = await get("https://randomuser.me/api/?results=10");
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return response.body['results'];
    }
  }
}
