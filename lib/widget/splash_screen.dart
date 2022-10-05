

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'base.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 4), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => base()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(59, 120, 121, 1),
      body:



      SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 80,right: 0,top: 150,bottom: 10),

                      child: Image.asset('assets/aaz.png',)),
                  Positioned(

                    left: 50,
                    bottom: 120,
                    child:
                    Text("Pets Tunisie" ,
                      style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                        fontSize: 34.0,
                        fontWeight: FontWeight.bold,color: Colors.white, letterSpacing: .5)),),
                  ),
                ],
              ),



              CircularProgressIndicator(
                color: Colors.white,
              ),
            ],

            // const CircularProgressIndicator(
            //   color: Colors.white,
            // ),

          ),
        ),
      ),


    );
  }
}
