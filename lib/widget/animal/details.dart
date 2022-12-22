import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/config/constants.dart';
import 'package:pfe/widget/animal/modif_animal.dart';
import 'package:pfe/widget/animal/ticket_info_content.dart';
import '../../comonents/constants.dart';
import '../../data/model/User.dart';
import 'clipper.dart';
import 'list_animl.dart';

class details extends StatefulWidget {
  const details({Key? key, required this.animal}) : super(key: key);
  final Animal animal;

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  bool _isCollapsed = false;
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
                              Text("",
                                //widget.animal.typeAnimal!.typename==null?"":widget.animal.typeAnimal!.typename!+"  ",
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
                                widget.animal.race!.toString()+ "  ",
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
                                widget.animal.taille.toString() + "m  ",
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
                                widget.animal.poids.toString() + "kg",
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
                                  child: Text(widget.animal.etatSante.toString(),style: TextStyle(fontSize: 20, color: Colors.black87,))),
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
                              Text(widget.animal.description!.toString(),style:GoogleFonts.aBeeZee(textStyle:TextStyle(fontSize: 20, color: Colors.black87,))),


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
                        widget.animal.name!.toString(),
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
                          widget.animal.genre == null ? "male" : widget.animal.genre!,
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
                      child: Text(widget.animal.dateNaissance!.toString(),
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
                        child: Image.network(
                          widget.animal.image!,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ))),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  left: _isCollapsed ? -120 : size.width - 65,
                  child: Stack(
                    children: [
                      ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: size.height,
                          width: size.width + 90,
                          decoration:  BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppConsts.appOrangeColor,
                                  AppConsts.appDeepOrange,
                                ],
                              )),
                          child: const TicketInfo(),
                        ),
                      ),
                      Positioned(
                        left: 8,
                        top: size.height * 0.65 + 37,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            _isCollapsed = !_isCollapsed;
                          }),
                          child: Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppConsts.appBlueColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppConsts.appDarkBlueColor,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/qr.svg',
                                color: Colors.white,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 7,
                        top: size.height * 0.65 + 37,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            _isCollapsed = !_isCollapsed;
                          }),
                          child: Container(
                            height: 46,
                            width: 46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppConsts.appOrangeColor,
                              boxShadow: const [
                                BoxShadow(
                                  color: AppConsts.appDarkBlueColor,
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/type.svg',
                                color: Colors.white,
                                height: 26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
