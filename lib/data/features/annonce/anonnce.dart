import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../../../config/URL.dart';
import '../../model/annonce.dart';
Future <dynamic >getannonce() async {
 // var members1 = <User>[];
  //final String apiUrl = "https://tuncoin.herokuapp.com/cryptocurrency/values";
  var Response = await http.get(Uri.parse('https://obscure-taiga-00684.herokuapp.com/annonce/getall'));
  final String responseString = Response.body;

  if (Response.statusCode == 200) {
    var json = jsonDecode(Response.body);
   // members1 = json.map<User>((json)=> User.fromJson(json)).toList();


    // json.map<User>((json) => new User.fromJson(jsonDecode(responseString)).toList();
    return json.map<Annonce>((json)=> Annonce.fromJson(json)).toList();
  } else {
    throw ("Can't get the value");
  }
}
Future<dynamic> addannonce(user,titre , categorie,type , date_creation,prix ,description,) async {
  final response = await http.post(
    Uri.parse(URL_BASE + '/annonce/add'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <dynamic, dynamic>{
          "user":user,
          "Titre":titre,
          "type":type,
          "categorie":categorie,

          "date_creation":date_creation,
          "prix":prix,
          "description":description,



        }),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.


  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("not logged");
    Fluttertoast.showToast(
        msg: "Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    throw Exception('Failed to create animal.');
  }
}
