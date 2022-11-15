import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pfe/widget/animal/utils.dart';
import '../../comonents/header_widget.dart';
import '../../comonents/theme_helper.dart';
import '../../data/features/User/user.dart';
import '../../data/model/User.dart';
import 'button_widget.dart';
import 'list_animl.dart';

class modif_animal extends StatefulWidget {
   modif_animal({
    Key? key,required this.animal

  }) : super(key: key);
 final Animal animal ;
  @override
  State<modif_animal> createState() => _modif_animalState();
}

class _modif_animalState extends State<modif_animal> {

  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  final _formKey = GlobalKey<FormState>();

  DateTime dateTime = DateTime.now();
  var date_selected = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String? select;
  late TextEditingController name=TextEditingController(text: widget.animal.name!);
  late TextEditingController taille = TextEditingController(text: widget.animal.taille!.toString());
 late  TextEditingController race = TextEditingController(text: widget.animal.race);
 late  TextEditingController poids = TextEditingController(text: widget.animal.poids.toString());
 late TextEditingController etat_sante = TextEditingController(text: widget.animal.etatSante);
  late TextEditingController type = TextEditingController(text: widget.animal.typeAnimal!.typename);
  late TextEditingController descrption = TextEditingController(text: widget.animal.description);
  late int _radioValue = widget.animal.genre =="mâle"?1:2;

  // var date_selected = widget.animal.dateNaissance;
  // int _radioValue = widget.animal.genre =="male"?0:1;
  // TextEditingController taille = TextEditingController(text: animal.taille.toString());
  // TextEditingController name = TextEditingController(text: widget.animal.name);
  // TextEditingController genre = TextEditingController();
  // TextEditingController race = TextEditingController(text: widget.animal.race);
  // TextEditingController poids = TextEditingController(text: widget.animal.poids.toString());
  // TextEditingController etat_sante = TextEditingController(text: widget.animal.etatSante);
  // TextEditingController type = TextEditingController(text: widget.animal.typeAnimal!.typename);
  // TextEditingController descrption = TextEditingController(text: widget.animal.description);



  @override
  Widget build(BuildContext context) {





    bool checkedValue = false;
    //late SharedPreferences sharedPreferences;
    bool checkboxValue = false;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(
                150,
                false,
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 30, left: 10),
                alignment: Alignment.topLeft,
                // margin: EdgeInsets.only(top: 10, left: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => list_animal()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                )),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: Icon(
                      FontAwesomeIcons.dog,
                      size: 90,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: name,
                            // onChanged: (n) => name.text = n,
                           onSaved: (newValue) => name.text = newValue!,
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: const TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                ' Nom', 'Entrez le nom'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter  name";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ButtonWidget(
                          text:date_selected,
                          onClicked: () => Utils.showSheet(
                            context,
                            child: buildDatePicker(),
                            onClicked: () async {
                              final value =
                              DateFormat('yyyy/MM/dd').format(dateTime);
                              setState(() {
                                date_selected = value;
                              });

                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Container(
                          child: TextFormField(
                            onSaved: (val)=> type.text!=val,
                            controller: type,

                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Enter type d animal";
                              }
                              return null;
                            },
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                'Type', 'Enter type d animal'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: race,
                            onSaved: (val)=> race.text!=val,
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper()
                                .textInputDecoration("Race", "Enter race"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter race";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150,
                              child: TextFormField(
                                onSaved: (val)=> taille.text!=val,
                                controller: taille,
                                style: GoogleFonts.gloriaHallelujah(
                                    textStyle:
                                        const TextStyle(letterSpacing: .5)),
                                decoration: ThemeHelper().textInputDecoration(
                                    "taille", "entrer taille"),
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "entrer taille";
                                  }
                                  return null;
                                },
                              ),
                              // decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            Container(
                              width: 150,
                              child: TextFormField(
                                controller: poids,
                               onSaved: (val)=> poids.text!=val,
                                style: GoogleFonts.gloriaHallelujah(
                                    textStyle:
                                        const TextStyle(letterSpacing: .5)),
                                decoration: ThemeHelper().textInputDecoration(
                                    "poids", "entrer l podis "),
                                keyboardType: TextInputType.number,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "entrer l poids";
                                  }
                                  return null;
                                },
                              ),
                              // decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onSaved: (val)=> etat_sante.text!=val,
                            controller: etat_sante,
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: const TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                "état de santé", "entrer l état de santé "),
                            //keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "entrer l état de santé";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onSaved: (val)=> descrption.text!=val,
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
                            Text("mâle"),
                            Radio(
                                value: 2,
                                groupValue: _radioValue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioValue = value as int;
                                  });
                                }),
                            Text("femelle")
                          ],
                        ),
                        SizedBox(height: 15.0),
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
                                "Edit  Your Animal",
                                style: GoogleFonts.gloriaHallelujah(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5)),
                              ),
                            ),
                            onPressed: ()  {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                editanimal(
                                  "6331aaecf7d5701dd7df846d",
                                  widget.animal.sId,
                                  name.text,
                                  _radioValue == 1 ? "mâle" : "femelle",
                                  date_selected,
                                  etat_sante.text,
                                  poids.text,
                                  race.text,
                                  taille.text,

                                  type.text,descrption.text,

                                );

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
                                                    const  Text(
                                                        'Information',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    const  Text(
                                                        'modification avec succès : \n ',
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      ElevatedButton(
                                                        onPressed: () => Navigator
                                                                .of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            list_animal())),
                                                    style: style,
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
            Container(
              margin: EdgeInsets.fromLTRB(210, 130, 50, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 30,
                color: Color.fromRGBO(59, 120, 121, 1),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1920,
          maximumYear: DateTime.now().year,
         // initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );



  @override
  void initState() {




  }
}
