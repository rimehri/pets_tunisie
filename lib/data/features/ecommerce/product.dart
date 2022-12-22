//this function for get all product from vendur
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../config/URL.dart';
import '../../model/ecommerceProduct.dart';
Future <dynamic >getallProduct() async {
  // var members1 = <User>[];
  //final String apiUrl = "https://tuncoin.herokuapp.com/cryptocurrency/values";
  var Response = await http.get(Uri.parse(VPNURL+'produit/all-product'));
  final String responseString = Response.body;

  if (Response.statusCode == 200) {
    var json = jsonDecode(Response.body);
    // members1 = json.map<User>((json)=> User.fromJson(json)).toList();
print (json);

    // json.map<User>((json) => new User.fromJson(jsonDecode(responseString)).toList();
    return json.map<Product>((json)=> Product.fromJson(json)).toList();
  } else {
    throw ("Can't get the value");
  }
}