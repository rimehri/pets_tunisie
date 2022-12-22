import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';
import 'package:intl/intl.dart';
import 'package:pfe/widget/animal/inputFiled.dart';
import 'package:pfe/widget/animal/uploadImage/media_source.dart';
import 'package:pfe/widget/animal/uploadImage/source_page.dart';
import 'package:pfe/widget/animal/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../comonents/header_widget.dart';
import '../../comonents/theme_helper.dart';
import '../../config/URL.dart';
import '../../data/features/User/typeanimal.dart';
import '../../data/features/User/user.dart';
import '../../data/model/TypeAnimal.dart';
import '../../data/model/User.dart';
import '../events/inputFile.dart';
import '../user/login_page.dart';
import 'button_widget.dart';
import 'list_animl.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
class add_animal extends StatefulWidget {
  const add_animal({Key? key}) : super(key: key);

  @override
  State<add_animal> createState() => _add_animalState();
}

class _add_animalState extends State<add_animal> {
  int _radioValue = 0;
  File? fileMedia;
  List? data = [];

  String dropdownValue ="Selected type";
  String dropdownRace ="Selected Race";
  String RaceValue ="Selected type";
    List  Racelist=[

  ];
  List? typelist ;

  late MediaSource source;
  final _formKey = GlobalKey<FormState>();
  DateTime dateTime = DateTime.now();
  var date_selected = DateFormat('yyyy/MM/dd').format(DateTime.now());
  String? select;
  late  String  Id="";
  TextEditingController taille = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController genre = TextEditingController();
  TextEditingController race = TextEditingController();
  TextEditingController poids = TextEditingController();
  TextEditingController etat_sante = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController descrption = TextEditingController();
  List  RepeatList=[

  ];
  Future GetAllType() async {



      //final String apiUrl = "https://tuncoin.herokuapp.com/cryptocurrency/values";
      var Response = await http.get(
          Uri.parse(VPNURL+'type/alltype'));
      final String responseString = Response.body;

      if (Response.statusCode == 200) {
        var json = jsonDecode(Response.body);
        setState(() {
          RepeatList =json;

        });
print(RepeatList);

      } else {
        throw ("Can't get the value");
      }

  }


  Future GetAllRace(String type) async {
    //final String apiUrl = "https://tuncoin.herokuapp.com/cryptocurrency/values";
    var Response = await http.get(Uri.parse('http://51.75.87.48:14600/type/getType/chien'));
    final String responseString = Response.body;

    if (Response.statusCode == 200) {

final data = jsonDecode(responseString);
setState(() {
  Racelist=data[0]['sousType'];
});
print("*/**/*/*/");
print(Racelist);
print("*/*/*/**");
 return responseString;

    } else {
      throw ("Can't get the value");
    }
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      backgroundColor: Color.fromRGBO(59, 120, 121, 1),
    );
    String password = "";

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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(5, 5),
                        ),
                      ],
                    ),
                    child: fileMedia==null? ClipRRect(

                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.asset(
                            "assets/avatar.png",
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            )):
                     ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image.file(
                              fileMedia!,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            )),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          child: TextFormField(
                            controller: name,
                            onChanged: (n) => password = n,
                            onSaved: (newValue) => password = newValue!,
                            style: GoogleFonts.gloriaHallelujah(
                                textStyle: const TextStyle(letterSpacing: .5)),
                            decoration: ThemeHelper()
                                .textInputDecoration(' Nom', 'Entrez le  nom'),
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
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: ButtonWidget(
                            text: date_selected,
                            onClicked: () => Utils.showSheet(
                              context,
                              child: buildDatePicker(),
                              onClicked: () async {
                                final value =
                                    DateFormat('yyyy/MM/dd').format(dateTime);
                                // Utils.showSnackBar(context, 'Selected "$value"');

                                setState(() {
                                  date_selected = value;
                                });

                                Navigator.pop(context);
                              },
                            ),

                          ),
                        ),
                        Container(
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                          child: inputFiled2(title: "", hint: " $dropdownValue",
                            widget:  DropdownButton<String>(


                              icon:Icon(Icons.keyboard_arrow_down,color:Colors.grey),
                              iconSize: 32,
                              elevation: 4,
                              style: subtitlestyle,
                              underline:Container(height: 0,) ,
                              items:RepeatList!.map<DropdownMenuItem<String>>((item) {

                                return new DropdownMenuItem(child: Text(item['typename']),
                                  value: item['typename'],
                                );
                              })?.toList()??[],
                              onChanged: ( newvalue) {
                                setState(() {

                                  dropdownValue=newvalue!.toString();
                                  print(dropdownValue);
                                });
                              },
                            ),
                          ),
                        ),

SizedBox(height: 20,),

                dropdownValue=="Selected type"  ?Container()  :    Container(
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  child: inputFiled2(title: "", hint: " $dropdownRace",
                            widget:  DropdownButton<String>(


                              icon:Icon(Icons.keyboard_arrow_down,color:Colors.grey),
                              iconSize: 32,
                              elevation: 4,
                              style: subtitlestyle,
                              underline:Container(height: 0,) ,
                              items:Racelist!.map<DropdownMenuItem<String>>((item) {

                                return new DropdownMenuItem(child: Text(item['name']),
                                  value: item['name'],
                                );
                              })?.toList()??[],
                              onChanged: ( newvalue) {
                                setState(() {

                                  dropdownRace=newvalue!.toString();
                                  print(dropdownRace);
                                });
                              },
                            ),
                          ),
                ),

                        SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),

                              width: 150,
                              child: TextFormField(
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

                            ),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              width: 150,
                              child: TextFormField(
                                controller: poids,
                                onChanged: (val) {
                                  password = val;
                                },
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
                                "Ajoutez votre animal",
                                style: GoogleFonts.gloriaHallelujah(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: .5)),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();




                                await addanimal(
                                   Id,
                                    name.text,
                                    _radioValue == 1 ? "mâle" : "femelle",
                                    date_selected,
                                    etat_sante.text,
                                    poids.text,
                                 dropdownRace,
                                    taille.text,
                                    dropdownValue,
                                fileMedia,
                                    descrption.text);

                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                          child: Stack(
                                            clipBehavior: Clip.none,
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
                                                      const Text(
                                                        'Information',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        'Votre nouvel animal a été ajouté avec succès : \n ',
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
              padding: EdgeInsets.fromLTRB(30, 60, 20, 20),
              child: InkWell(
                onTap: () => capture(MediaSource.image),
                child: Icon(

                  Icons.add_a_photo_outlined,
                  size: 30,
                  color: Color.fromRGBO(59, 120, 121, 1),
                ),
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
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
  Future getvadationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? ID = prefs.getString("id");

    setState(() {
      Id = ID!;
    });



  }
  Future capture(MediaSource source) async {
    setState(() {
      this.source = source;
      this.fileMedia = null;
    });

    final result = await Navigator.of(this.context).push(
      MaterialPageRoute(
        builder: (context) => SourcePage(),
        settings: RouteSettings(
          arguments: source,
        ),
      ),
    );

    if (result == null) {
      return;
    } else {
      setState(() {
        fileMedia = result;
      });
    }
  }
  @override
  void initState() {
    print("all type");
    GetAllType();
    print("allRace");

    GetAllRace(dropdownValue);

    getvadationData();
    // TODO: implement initState
    super.initState();
  }
}
