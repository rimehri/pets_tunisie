import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/config/constants.dart';
import 'package:pfe/widget/animal/modif_animal.dart';
import '../../data/model/User.dart';
import 'list_animl.dart';

class details extends StatelessWidget {
  const details({Key? key, required this.animal}) : super(key: key);
  final Animal animal;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Color.fromRGBO(59, 120, 121, 1),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3, bottom: 0),
                  height: size.height,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 15),
                          child: Row(
                            children: [
                              Text("Type: ",
                                  style:
                                     TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(0, 147, 148, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                              Text(
                                animal.typeAnimal!.typename==null?"":animal.typeAnimal!.typename!+"  ",
                               style:
                                  TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 20),
                          child: Row(
                            children: [
                              Text("Race: ",
                                  style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(0, 147, 148, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                              Text(
                                animal.race!.toString()+ "  ",
                                style:
                                  TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,

                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 20),
                          child: Row(
                            children: [
                              Text("Taille: ",
                                  style:  TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(0, 147, 148, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                              Text(
                                animal.taille.toString() + "m  ",
                                style:TextStyle(
                                    fontSize: 22,
                                    color: Colors.black87,

                                ),
                              ),
                              Text("Poids: ",
                                  style:  TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(0, 147, 148, 1),
                                        fontWeight: FontWeight.bold),
                                  ),
                              Text(
                                animal.poids.toString() + "kg",
                                style:  TextStyle(
                                    fontSize: 20,
                                    color: Colors.black87,

                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, right: 180),
                          child: Column(
                            children: [
                              Text("état de santé : ",style: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 147, 148, 1),fontWeight: FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                alignment: Alignment.topLeft,
                                  child: Text(animal.etatSante.toString(),style: TextStyle(fontSize: 20, color: Colors.black87,))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 2, left: 20),
                          child: Column(
                            children: [
                              Container(

                                  alignment: Alignment.topLeft,
                                  child: Text("Remarque : ",style:GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: 20,color: Color.fromRGBO(0, 147, 148, 1),fontWeight: FontWeight.bold)))),
                              Text(animal.description!.toString(),style:GoogleFonts.aBeeZee(textStyle:TextStyle(fontSize: 20, color: Colors.black87,))),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 40, left: 10),
                            child: InkWell(
                               onTap: () {
                Navigator.push( context, MaterialPageRoute(builder: (context) => list_animal()), );
                },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            )),

                      ],
                    ),

                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 20,top: 10),
                      child: Text(
                        animal.name!.toString(),
                        style: GoogleFonts.gloriaHallelujah(
                            textStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            "assets/genre.svg",
                            color: Colors.white,
                            width: 30.0,
                          ),
                          onPressed: () {},
                        ),
                        Text(
                          animal.genre == null ? "male" : animal.genre!,
                          style: GoogleFonts.gloriaHallelujah(
                            textStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 0, left: 20),
                      child: Text(animal.dateNaissance!.toString(),
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ))),
                    )
                  ],
                ),
                Positioned(
                    top: 120,
// right: 10,
                    left: 230,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.0),
                        child: Image.asset(
                          'assets/kitten-510651.jpg',
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ))),
              ],
            ),
          )
        ]),
      ),
    );
  }

// Positioned(
// bottom: 0,
// child: Container(
// width: MediaQuery
//     .of(context)
//     .size
//     .width,
//
// height: MediaQuery
//     .of(context)
//     .size
//     .height * 0.65,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(40.0),
// topLeft: Radius.circular(40.0)),
// color: Colors.white
// ),
//
// )),
// Positioned(
// top: 40,
// left: 20,
//
// child: Icon(Icons.arrow_back_ios, color: Colors.white,),),
// Positioned(
// top: 100,
// left: 30,
//
// child: Column(
//
// children: [
// Text(animal.name!, style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 25,
// color: Colors.white,
// fontWeight: FontWeight.bold)),),
// Row(
//
// children: [
// IconButton(
//
// icon:
// SvgPicture.asset("assets/genre.svg",
// color: Colors.white,
// width: 30.0,
//
// ),
// onPressed: () {},
// ),
// Text(
// animal.genre == null ? "male" : animal.genre!,
// style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(
// color: Colors.white,
// ),
// ),)
// ],
// ),
// Text(animal.dateNaissance!,
// style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(
// fontSize: 20, color: Colors.white,)))
// ],
// )),
// Positioned(
// top: 120,
// // right: 10,
// left: 180,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(100.0),
//
// child: Image.asset(
// 'assets/kitten-510651.jpg', fit: BoxFit.cover, width: 200,
// height: 200,))),
// }
// Positioned(
// top: 320,
// left: 30,
//
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// Row(
// children: [
// Row(
// children: [
// Text("Type: ", style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 25,
// color: Color.fromRGBO(173, 40, 93, 1),
// fontWeight: FontWeight.bold),)),
// Text(animal.typeAnimal!.typename!+"  ", style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 22,
// color: Colors.black38,
// ),),
// )],
// ),
// Row(
// children: [
// Text("Race: ", style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 25,
// color: Color.fromRGBO(173, 40, 93, 1),
// fontWeight: FontWeight.bold),)),
// Text(animal.race!, style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 22,
// color: Colors.black38,
// ),),
// )],
// ),
// ],
// ),
// Row(
// children: [
// Row(
// children: [
// Text("Taille: ", style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 25,
// color: Color.fromRGBO(173, 40, 93, 1),
// fontWeight: FontWeight.bold),)),
// Text(animal.taille.toString()+"m  ", style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 22,
// color: Colors.black38,
// ),),
// )],
// ),
// Row(
// children: [
// Text("Poids: ", style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 25,
// color: Color.fromRGBO(173, 40, 93, 1),
// fontWeight: FontWeight.bold),)),
// Text(animal.poids.toString()+"kg", style: GoogleFonts.gloriaHallelujah(
// textStyle: TextStyle(fontSize: 22,
// color: Colors.black38,
// ),),
// )],
// ),
// ],
// ),
// ],
// )),
// Container(
// color:Colors.blueGrey,
// margin: EdgeInsets.only(left: 10,top:450,bottom: 250 ),
// child: Column(children: [
//
//
// Text("état de santé  ",style:GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(173, 40, 93, 1),))),
// Text(animal.etatSante!,style:GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: 20, color: Colors.black54,))),
// ],),
// ),
// Container(
// color: Colors.grey,
// margin: EdgeInsets.only(left: 10,top:550,bottom: 150 ),
// child: Column(children: [
//
//
// Text("Remarque ",style:GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(173, 40, 93, 1),))),
// Text(animal.description!,style:GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: 20, color: Colors.black54,))),
// ],),
// ),
//
// Positioned(
// top: 200,
// left: 50,
// child: Container(
//
// margin: EdgeInsets.only(left: 10,top:450 ),
// child: Column(children: [
//
//
// Text("List des Evenements   ",style:GoogleFonts.gloriaHallelujah(textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(173, 40, 93, 1),))),
//
// ],),
// ),
// ),
}
