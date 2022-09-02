import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:homework/app_constants.dart';
import 'package:http/http.dart' as http;



class ProductRepository extends GetxService{
  Future<Response> getAllProducts() async {
    http.Response response = await http.get(Uri.parse(AppConstants.BASE_URL+AppConstants.PRODUCT_URI)).timeout(const Duration(seconds: 20));
    var body = jsonDecode(response.body);
    Response res = Response(body: body, statusCode: 200);
    return res;
  }

}