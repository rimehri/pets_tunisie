import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfe/data/model/User.dart';
import 'package:http/http.dart' as http;

import '../../../config/URL.dart';



void firstLoad() async {

  try {
    final res  = await http.Request('GET', Uri.parse('https://obscure-taiga-00684.herokuapp.com/user/getUsers'));
    final jsonMembers = json.decode(res.body);
    List<User> fetchedPosts = jsonMembers
        .map<User>((json) => new User.fromJson(json))
        .toList();
    print(fetchedPosts);

  } catch (err) {
    print(err);
    print('Something went wrong');
  }


}
Future<User> register(String name,String phone,String email, String password, String addresse) async {
  final response = await http.post(
    Uri.parse(URL_BASE+'/user/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, dynamic>{'Name': name,'addresse': addresse,'phone': phone ,'email': email,'password':password}),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    User u = User.fromJson(jsonDecode(response.body));
    print(jsonDecode(response.body));

    print(u);
    return u;

  } else {

    var mess = jsonDecode(response.body)['message'];
    print(mess.runtimeType);
    // If the server did not return a 201 CREATED response,
    // then throw an exception.

    print("not logged");
    Fluttertoast.showToast(
        msg: mess,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    throw Exception('Failed to create account .');
  }
}


 Future<User> login(String email, String password) async {
  final response = await http.post(
    Uri.parse(URL_BASE+'/user/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{'email': email, 'password': password}),
  );

  if (response.statusCode == 201 || response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    return User.fromJson(jsonDecode(response.body));
  } else {
    var mess = jsonDecode(response.body)['message'];
print(mess);
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("not logged");
    Fluttertoast.showToast(
        msg: mess,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    throw Exception('Failed to create account.');
  }
}





Future<User> otp(String phone,String code) async {
  final response = await http.patch(
    Uri.parse(URL_BASE+'/user/activateAccount'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, dynamic>{
          'phone' :phone,
          'code': int.parse(code) }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(jsonDecode(response.body));
    return User.fromJson(jsonDecode(response.body));

  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("not logged");
    Fluttertoast.showToast(
        msg: "code invalid",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    throw Exception('Failed to create account.');
  }
}
Future forgetpassword(String phone) async {

  // double amount1 = double.parse(amount);
  final Response = await http.patch(
      Uri.parse("https://obscure-taiga-00684.herokuapp.com/user/forgetPassword/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:jsonEncode(<String, String> {"phone": phone}));
  var mess = jsonDecode(Response.body)['message'];
  if (Response.statusCode == 200) {

    print(mess);
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    print("SUCC");
    Fluttertoast.showToast(
        msg: mess,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);


  }  else {
    Fluttertoast.showToast(
        msg: mess,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception("ff");
  }
}
Future VerifCode(int code,resetcode) async {

  // double amount1 = double.parse(amount);

 // var mess = jsonDecode(Response.body)['message'];
  if (code==resetcode) {


    Fluttertoast.showToast(
        msg: "Code Succ ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);


  }  else {
    Fluttertoast.showToast(
        msg: "Code Invalide",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    throw Exception("Cannot find Code");
  }
}
Future<User> getCurrentUser(String id) async {
  final Response = await http.get(Uri.parse(URL_BASE+'/user/getUser/$id'));

  final String responseString = Response.body;

  return User.fromJson(jsonDecode(responseString));
  // Similarly we can get email as well
  //final uemail = user.email;

  //print(uemail);
}

Future<User> getCurrentUserbyphone(String phone) async {
  final Response = await http.get(Uri.parse(URL_BASE+'/user/getuserbyphone/$phone'));

  final String responseString = Response.body;

  return User.fromJson(jsonDecode(responseString));
  // Similarly we can get email as well
  //final uemail = user.email;

  //print(uemail);
}
// Future<User> getUser(String id) async {
//
//
//
//   User u = userFromJson(responseString);
//   //print(stage);
//   Map<String,dynamic> json = jsonDecode(responseString);
//   List<dynamic> body = json['stage'];
//   List<Stage> values =
//   body.map((dynamic item) => Stage.fromJson(item)).toList();
//   print(values[0].title);
//   print(values[1].date);
//   final User user = await getUser(id);
//
//   return userFromJson(responseString);
//
// }
Future<User > getanimal(String id) async {
  //final String apiUrl = "https://tuncoin.herokuapp.com/cryptocurrency/values";
  var Response = await http.get(Uri.parse(URL_BASE+'/user/getUser/$id'));
  final String responseString = Response.body;

  if (Response.statusCode == 200) {
    Map<String, dynamic> json = jsonDecode(Response.body);

   List<dynamic> body = json['animal'];

    List<Animal> values =
    body.map((dynamic item) => new Animal.fromJson(item)).toList();
    return User.fromJson(jsonDecode(responseString));
  } else {
    throw ("Can't get the value");
  }
}
Future <dynamic >getuser() async {
  var members1 = <User>[];
  //final String apiUrl = "https://tuncoin.herokuapp.com/cryptocurrency/values";
  var Response = await http.get(Uri.parse('https://obscure-taiga-00684.herokuapp.com/user/getUsers'));
  final String responseString = Response.body;

  if (Response.statusCode == 200) {
    var json = jsonDecode(Response.body);
    members1 = json.map<User>((json)=> User.fromJson(json)).toList();


   // json.map<User>((json) => new User.fromJson(jsonDecode(responseString)).toList();
    return json.map<User>((json)=> User.fromJson(json)).toList();
  } else {
    throw ("Can't get the value");
  }
}
Future getOneAnimal(iduser,idanimal) async {
  var headers = {
    'Content-Type': 'application/json'
  };
  var request = http.Request('GET', Uri.parse('https://obscure-taiga-00684.herokuapp.com/user/getAnimal'));
  request.body = json.encode({
    "id": iduser,
    "animal": idanimal
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  }
  else {
    print(response.reasonPhrase);
  }

}
Future  <User> getclient(String id) async {
  final Response = await http.get(Uri.parse(URL_BASE+'/user/getUser/$id'));

  final String responseString = Response.body;

  return User.fromJson(jsonDecode(responseString));
  // Similarly we can get email as well
  //final uemail = user.email;

  //print(uemail);
}

Future<dynamic> addanimal(user,name , genre, date_naissence,etat_sante, poids, race, taille,type,description) async {
  final response = await http.post(
    Uri.parse(URL_BASE + '/user/addanim'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <dynamic, dynamic>{
          "id":user,
          "name":name,
          "genre":genre,
          "date_naissance":date_naissence,
          "etat_sante":etat_sante,
          "poids":poids,
          "taille":taille,
          "race":race,

          "typename":type,
          "Description":description,
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
Future<User> deleteanimal(String id,String animal ) async {
  final http.Response response = await http.delete(
    Uri.parse(URL_BASE+'/user/removeanimal'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(
          <dynamic, dynamic>{
            "id":id,
            "animal":animal,
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

    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a "200 OK response",
    // then throw an exception.
    throw Exception('Failed to delete album.');
  }
}
void editanimal(
    String? id , String? animal, String? name,genre, date_naissence,etat_sante, poids, race, taille,type,description) async {
  final response = await http.patch(
      Uri.parse(
        URL_BASE+'/user/editeanimal',
      ),
      headers: <String, String>{
        'Context-Type': 'application/json;charset=UTF-8',
      },
      body: <String, String>{
        'id': id!,
        'animal': animal!,
        'name': name!,
        "genre":genre,
        "date_naissance":date_naissence,
        "etat_sante":etat_sante,
        "poids":poids,
        "taille":taille,
        "race":race,

        "typename":type,
        "Description":description,
      });
  if (response.statusCode == 200) {
    print(response.reasonPhrase);
    print("succ!!");


  } else {
    print(response.statusCode);
    print(response.reasonPhrase);
  }}


