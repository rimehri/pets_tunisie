

import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../comonents/theme_helper.dart';
import '../../../data/features/annonce/anonnce.dart';
import '../../../data/model/annonce.dart';
import '../../annonce/all_ads.dart';
import '../profile_page.dart';


class edit_annonce extends StatefulWidget {
   edit_annonce({Key? key, required this.annonce}) : super(key: key);
Annonce annonce;
  @override
  _edit_annonceState createState() => _edit_annonceState();
}

class _edit_annonceState extends State<edit_annonce> {
  final _formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  late int _radioValue = widget.annonce.type=="offre" ? 0:1;
  String? select;


  late TextEditingController titre = TextEditingController(text: widget.annonce.titre);
  late TextEditingController prix = TextEditingController(text: widget.annonce.prix.toString());
  late TextEditingController categorie = TextEditingController(text: widget.annonce.categorie);
 late  TextEditingController descrption = TextEditingController(text: widget.annonce.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ajouter une annonce",style: TextStyle(color: Colors.black),),
        elevation: 10,
        toolbarHeight:55,

        // pinned: true ,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'Menu Icon',

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfilePage()),
            );

          },
        ),


      ),

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [


            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  DottedBorder(

                    strokeWidth: 2,
                    dashPattern: [8, 4],
                    borderType: BorderType.Rect,
                    color: Color.fromRGBO(59, 120, 121, 1),
                    child: Container(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.add, color: Color.fromRGBO(59, 120, 121, 1),size: 50,),
                          Text("Ajouter Des Photos",style: TextStyle(fontSize: 25),)
                        ],
                      ),

                      // margin: EdgeInsets.only(bottom: 50),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(


                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            offset: const Offset(5, 5),
                          ),
                        ],
                      ),
                      width: 350,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: titre,


                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: const TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                ' Titre', ' Titre'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Veuillez remplir le champ titre ";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          child: TextFormField(
                            controller: categorie,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Veuillez remplir le champ description";
                              }
                              return null;
                            },
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                'categorie', 'Enter categorie d annonce'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value as int;
                                  });
                                }),
                            Text("Demande"),
                            Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value as int;
                                  });
                                }),
                            Text("Offre ")
                          ],
                        ),
                        //SizedBox(height: 20.0),
                        // Container(
                        //   child: TextFormField(
                        //     controller: race,
                        //     style: GoogleFonts.gloriaHallelujah(
                        //         textStyle: TextStyle(letterSpacing: .5)),
                        //
                        //     decoration: ThemeHelper()
                        //         .textInputDecoration("categorie", "Enter categorie"),
                        //     validator: (val) {
                        //       if (val!.isEmpty) {
                        //         return "Veuillez remplir le champ description";
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        //   decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        // ),
                        SizedBox(height: 20.0),


                        Container(
                          child: TextFormField(
                            controller: prix,
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: const TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                "Prix", "entrer le Prix "),
                            //keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Veuillez remplir le champ Prix";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: descrption,
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: const TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                "Description", "entrer descripion"),

                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter a  description";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),

                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                          ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                              const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Modifier   Votre Annonce",
                                style: GoogleFonts.gloriaHallelujah(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5)),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                 editannonce(
                                    widget.annonce.sId,
                                    titre.text,
                                    categorie.text,
                                    _radioValue == 1 ? "demande" : "offre",




                                    prix.text,

                                    descrption.text);

                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(4.0)),
                                      child: Stack(

                                        alignment: Alignment.topCenter,
                                        children: [
                                          Container(
                                            height: 200,
                                            width: 350,
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(
                                                  20, 50, 10, 10),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Information',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    'Your New animal added with seccuss : \n ',
                                                    style: TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () =>  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) => ProfilePage()),
                                                    ),

                                                    child: Text(
                                                      'Okay',
                                                      style: TextStyle(
                                                          color:
                                                          Colors.white),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: -40,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                Colors.green,
                                                radius: 40,
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Colors.white,
                                                  size: 50,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ));
                              }

                              //}
                            },
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
