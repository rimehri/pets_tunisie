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
print(json);

    // json.map<User>((json) => new User.fromJson(jsonDecode(responseString)).toList();
    return json.map<Annonce>((json)=> Annonce.fromJson(json)).toList();
  } else {
    throw ("Can't get the value");
  }
}
Future<dynamic> addannonce(user,titre , categorie,type ,prix ,description,) async {
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

          //"date_creation":date_creation,
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
Future<Annonce> deleteannonce(String id ) async {
  final http.Response response = await http.delete(
    Uri.parse(URL_BASE+'/annonce/removeannonce'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode(
        <dynamic, dynamic>{
          "id":id,

        }),


  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON. After deleting,
    // you'll get an empty JSON `{}` response.
    // Don't return `null`, otherwise `snapshot.hasData`
    // will always return false on `FutureBuilder`.
    print("succ!!");
    Fluttertoast.showToast(
        msg: "suppression avec succès",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);

    return Annonce.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete animail.');
  }
}
void editannonce(
    String? id , String? titre, String? category ,type,prix,description) async {
  final response = await http.patch(
      Uri.parse(
        URL_BASE+'/annonce/updateannonce',
      ),
      headers: <String, String>{
        'Context-Type': 'application/json;charset=UTF-8',
      },
      body: <String, String>{
        'id': id!,
        'Titre': titre!,
        'type': type!,
        'prix':prix,
        "categorie":category!,
        "description":description,



      });
  if (response.statusCode == 200) {
    print(response.reasonPhrase);
    print("succ!!");


  } else {
    print(response.statusCode);
    print(response.reasonPhrase);
  }}