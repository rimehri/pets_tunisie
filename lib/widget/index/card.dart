


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/data/model/User.dart';

class card extends StatefulWidget {

  final String? image ;
  final String?  text;
  final GestureTapCallback press;
  const card({Key? key, required this.image,
    required this.text,
    required this.press,}) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 12),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(4.0, 4.0), // shadow direction: bottom right
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(

          children: [
            Container (
              width: 150,
              height: 100,
              decoration: BoxDecoration(

                image:  DecorationImage(
                  image: NetworkImage(widget.image??""),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),



            Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(widget.text!,style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),
                ),



              ],
            ),

          ],
        ));
  }
}
