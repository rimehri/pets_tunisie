


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../comonents/Drawer.dart';

class details_blog extends StatelessWidget {
  const details_blog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      drawer:const  Drawer(child: drawer(),),
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            //pinned: true,


            floating: true,
            elevation: 10,
            forceElevated: true,
            iconTheme: IconThemeData(color:  Color.fromRGBO(59, 120, 121, 1),size: 30),


            toolbarHeight:65,
            title:
            Container(

              //alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 10.0,left: 20 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(" Pets Tunisie" ,
                    style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,color: Color.fromRGBO(59, 120, 121, 1), letterSpacing: .5)),),
                  Column(

                    children: [
                      const Icon(
                        FontAwesomeIcons.store, size: 28, color: Color.fromRGBO(59, 120, 121, 1),),
                      Text('Shops',
                        style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 120, 121, 1), letterSpacing: .5)),
                      )
                    ],
                  )
                ],
              ),
            ),

            backgroundColor: Colors.white,

            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),


          ),
          SliverToBoxAdapter(
              child:Column(
                children: [

                ],
              )
          )


        ],
      ),
    );
  }
}
