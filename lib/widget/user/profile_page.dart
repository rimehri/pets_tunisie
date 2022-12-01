
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:pfe/widget/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../comonents/Drawer.dart';
import '../../comonents/header_widget.dart';

import '../../config/URL.dart';
import '../../data/features/User/user.dart';
import '../../data/features/annonce/anonnce.dart';
import '../../data/model/User.dart';
import '../annonce/cart_ads.dart';
import '../annonce/details_ads.dart';
import '../index/home_page.dart';
import 'mes_annonce/details_ads.dart';
import 'registration_page.dart';

class ProfilePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
     return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage>{
  late  String  Id="";
  Future? doc;
 String? nom ;
String? addrese;
  String? mail ;
  String? phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

       elevation: 0,

      backgroundColor:  Color.fromRGBO(59, 120, 121, 1),

        leading: InkWell(
          child: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onTap: (){
            //After successful login we will redirect to profile page. Let's create profile page now
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => home_page()));
          },),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                    child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(child: drawer(),),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 100, child: HeaderWidget(100,false),),
            Container(
              alignment: Alignment.center,
              // margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
                      ],
                    ),
                    child: Icon(Icons.person, size: 80, color: Colors.grey.shade300,),
                  ),
                  SizedBox(height: 20,),
                  Text(nom??"", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  SizedBox(height: 10,),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Information",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Card(
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    ...ListTile.divideTiles(
                                      color: Colors.grey,
                                      tiles: [
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.my_location),
                                          title: Text("Localisation"),
                                          subtitle: Text(addrese??""),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          title: Text("Email"),
                                          subtitle: Text(mail??""),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          title: Text("Phone"),
                                          subtitle: Text(phone??""),
                                        ),

                                      ],
                                    ),
                                  ],
                                )
                              ],

                            ),
                          ),
                        ),
                        Text("Mes Annonces  "),


                      ],
                    ),
                  ),
                  getBody(),


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  Widget getBody() {




    return FutureBuilder<dynamic>(
      future: getmes(Id),
      builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
          ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Container (
            margin: EdgeInsets.only(top: 200),
            child: CupertinoActivityIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          print("---------");
          print(snapshot.data);
          print("---------");
          if (snapshot.hasError) {

            return  Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            return GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 4 / 4.5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(child: cardads(cart4:snapshot.data[index] ,


                  ),


                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsMesAds(
                                annonce: snapshot.data[index],
                              )));
                    },


                  );
                });
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }

  @override
  void initState()  {

    getBody();
getprofil();

    // TODO: implement initState
    super.initState();
  }
  getprofil() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nom = prefs.getString('name')!;
      addrese = prefs.getString('addresse')!;
      mail= prefs.getString('mail')!;
      phone = prefs.getString('phone')!;
      String? ID = prefs.getString("id");

        Id = ID!;


      print(nom??"");
    });
    final String? action = prefs.getString('name');
  }

}