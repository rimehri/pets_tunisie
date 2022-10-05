


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/data/model/User.dart';

import 'modif_animal.dart';

class cardanimal extends StatefulWidget {
  final Animal cart4;

  const cardanimal({Key? key, required this.cart4,}) : super(key: key);

  @override
  State<cardanimal> createState() => _cardanimalState();
}

class _cardanimalState extends State<cardanimal> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(

          margin: EdgeInsets.only(left: 10,right: 10),
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
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),

                    image: DecorationImage(
                        fit: BoxFit.cover,
            image: AssetImage('assets/kitten-510651.jpg')
            )
                  ),
                ),



                Column(
                 // crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.cart4.name.toString(),
                          style:GoogleFonts.gloriaHallelujah(textStyle:  TextStyle(fontSize: 17,
                            color: Color.fromRGBO(173, 40, 93, 1),fontWeight: FontWeight.bold)
                          ),
                        ),
                        Row(

                          children: [


                            IconButton(
                              icon:
                              SvgPicture.asset("assets/type2.svg",
                                width: 20.0,
                                color: Color.fromRGBO(59, 120, 121, 1),
                              ),
                              onPressed: () {},
                            ),
                            Text(
                              widget.cart4.typeAnimal!.typename == null?"non definie" : widget.cart4.typeAnimal!.typename!,
                              style:GoogleFonts.gloriaHallelujah (textStyle:TextStyle(
                                color: Colors.black,
                              ),

                              ),),

                          ],
                        ),
                      ],
                    ),

                    Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(

                          children: [
                            IconButton(
                              icon:
                              SvgPicture.asset("assets/genre.svg",
                                width: 20.0,

                              ),
                              onPressed: () {},
                            ),
                            Text(
                              widget.cart4.genre == null?"male" : widget.cart4.genre!,
                              style: GoogleFonts.gloriaHallelujah (textStyle:TextStyle(
                                color: Colors.black,
                              ),
                            ),)
                          ],
                        ),
                        Row(

                          children: [
                            IconButton(
                              icon:
                              SvgPicture.asset("assets/date.svg",
                                  width: 20.0,

                              ),
                              onPressed: () {},
                            ),
                            Text(
                              widget.cart4.dateNaissance== null?"31/01/2022" : widget.cart4.dateNaissance!,
                              style: GoogleFonts.gloriaHallelujah (textStyle:TextStyle(
                                color: Colors.black,
                              ),
                            ),)
                          ],
                        ),
                      ],
                    ),

                  ],
                ),

              ],
            )),
        Positioned(
          //right: 0,
          right: 18,
          child:     IconButton(
            icon: const Icon(Icons.edit),

            onPressed: () { Navigator.push( context, MaterialPageRoute(builder: (context) => modif_animal(animal: widget.cart4,)), );},

            // Icons.edit_sharp,
            color: Color.fromRGBO(59, 120, 121, 1),
          ),)
      ],
    );
  }
}
