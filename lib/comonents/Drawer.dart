import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/widget/services/list-service.dart';

import '../widget/animal/list_animl.dart';
import '../widget/annonce/all_ads.dart';
import '../widget/home.dart';
import '../widget/index/home_page.dart';
import '../widget/user/login_page.dart';
import '../widget/user/profile_page.dart';
import '../widget/veterinary/list_vete.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration:BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.0, 1.0],
                colors: [
                  Color.fromRGBO(59, 120, 121, 0.41),
                  Color.fromRGBO(59, 120, 121, 0.41)
                ]
            )
        ) ,
        child: ListView(
          children: [

            Container(
              height: 160,
              decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0)),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [ Color.fromRGBO(59, 120, 121, 1),Color.fromRGBO(59, 120, 121, 1),],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 45.0,
                    backgroundColor:Color.fromRGBO(59, 120, 121, 0.4),
                    child: Image.asset(
                      'assets/3135715.png',
                    ), //For Image Asset

                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("Welcome Rimeh",
                        style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,color: Colors.white, letterSpacing: .5))

                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.houseUser, size: _drawerIconSize, color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('Home', style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: 17, color: Color.fromRGBO(59, 120, 121, 0.7)  ) ),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => home_page()));
              },
            ),
            Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
            ListTile(
              leading: Icon(FontAwesomeIcons.user, size: _drawerIconSize,  color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('My Account', style:GoogleFonts.gloriaHallelujah(textStyle:  TextStyle(fontSize: 17, color: Color.fromRGBO(59, 120, 121, 0.7) )),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
            ListTile(
              leading: Icon(FontAwesomeIcons.cat,size: _drawerIconSize, color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('My animals', style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: _drawerFontSize, color: Color.fromRGBO(59, 120, 121, 0.7))),
              ),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => list_animal()), );
              },
            ),
            Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
            ListTile(
              leading: Icon(FontAwesomeIcons.userDoctor, size: _drawerIconSize, color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('veterinary',style: GoogleFonts.gloriaHallelujah(textStyle:  TextStyle(fontSize: _drawerFontSize,color: Color.fromRGBO(59, 120, 121, 0.7))),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => lis_veto()),);
              },
            ),
            Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
            ListTile(
              leading: Icon(FontAwesomeIcons.shop, size: _drawerIconSize, color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('Shops',style:GoogleFonts.gloriaHallelujah(textStyle:  TextStyle(fontSize: _drawerFontSize,color: Color.fromRGBO(59, 120, 121, 0.7))),),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => list_ads()),);
              },
            ),
            Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
            ListTile(
              leading: Icon(FontAwesomeIcons.hotel, size: _drawerIconSize, color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('Services',style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: _drawerFontSize,color: Color.fromRGBO(59, 120, 121, 0.7))),),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => list_service()), );
              },
            ),
            Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
            ListTile(
              leading: Icon(FontAwesomeIcons.adversal, size: _drawerIconSize, color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('Ads',style:GoogleFonts.gloriaHallelujah(textStyle:  TextStyle(fontSize: _drawerFontSize,color: Color.fromRGBO(59, 120, 121, 0.7))),),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => list_ads()),);
              },
            ),
            Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
            ListTile(
              leading: Icon(FontAwesomeIcons.rightFromBracket, size: _drawerIconSize, color: Color.fromRGBO(59, 120, 121, 1),),
              title: Text('Logout',style: GoogleFonts.gloriaHallelujah(textStyle:  TextStyle(fontSize: _drawerFontSize,color: Color.fromRGBO(59, 120, 121, 0.7))),),
              onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => LoginPage()), );
              },
            ),
          ],
        ),
      ) ,
    );
  }
}
