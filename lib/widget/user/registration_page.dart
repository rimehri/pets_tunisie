
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pfe/data/features/User/user.dart';
import 'package:pfe/widget/home.dart';

import '../../comonents/header_widget.dart';
import '../../comonents/theme_helper.dart';
import '../../data/model/User.dart';
import 'login_page.dart';
import 'otp/otp_screen.dart';


class RegistrationPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _RegistrationPageState();
  }
}

class _RegistrationPageState extends State<RegistrationPage>{

  final _formKey = GlobalKey<FormState>();
  bool checkedValue = false;
  late SharedPreferences sharedPreferences;
  bool checkboxValue = false;
  late String email = "";
  late String name = "";
  late String id = "";
  late String phone ;
  late String password = "";
  late String addresse = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(150, false, ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50,right: 10,left: 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Container(
                    height: 150,


                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [


                        Container(
                          child: TextFormField(
                            onSaved: (newValue) => name = newValue!,
                            style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(

                                letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(' Nom', 'Entrez Nom'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "S'il vous plaît entrez votre nom";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            onSaved: (newValue) => email = newValue!,
                            style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(

                                letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration("E-mail ", "Entrez l'email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Entrez un email valide";
                              }

                              else if
                              (val.isEmpty){
                                return "s'il vous plait Entrez un email";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onSaved: (newValue) => phone = newValue!,
                            style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(

                                letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration(
                                "numéro de téléphone",
                                "Entrez votre numéro de mobile"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "Entrez votre numéro de téléphone";
                              }
                              else if
                              (val.isEmpty){
                                return "s'il vous plait Entrez votre numéro de téléphone";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            validator: (val) {

                               if
                              (val!.isEmpty){
                                return "s'il vous plait Entrez votre adresse";
                              }
                              return null;
                            },
                            onSaved: (newValue) => addresse = newValue!,
                            style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration('Votre  Address', 'Entrez votre adresse'),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            onSaved: (newValue) => password = newValue!,
                            style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                letterSpacing: .5)),
                            obscureText: true,
                            decoration: ThemeHelper().textInputDecoration(
                                "Mot de Passe", "Tapez votre mot de passe"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "s'il vous plait entrez votre mot de passe";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10,0,10,20),
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push( context, MaterialPageRoute( builder: (context) => LoginPage()), );
                            },
                            child: Text( "vous avez déjà un compte ?",  style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                color: Colors.grey, letterSpacing: .5)),
                            ),
                          ),
                        ),
                        //SizedBox(height: 15.0),
                        FormField<bool>(
                          builder: (state) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkboxValue,
                                        onChanged: (value) {
                                          setState(() {
                                            checkboxValue = value!;
                                            state.didChange(value);
                                          });
                                        }),
                                    Text("J'accepte tous les termes et conditions.", style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                                      color: Colors.grey,

                            letterSpacing: .1)),),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.errorText ?? '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
                                  ),
                                )
                              ],
                            );
                          },
                          validator: (value) {
                            if (!checkboxValue) {
                              return 'Vous devez accepter les termes et conditions';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration: ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "S'inscrire",
                                style:  GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
color: Colors.white,

                              letterSpacing: .5)),
                              ),
                            ),
                            onPressed: () async  {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                User u = await register(name,phone,email,password,addresse);
                               print(id);
                                print(u);
                                WidgetsFlutterBinding.ensureInitialized();

                               SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                                prefs.setString('id', u.sId!);
                                prefs.setString('phone', u.phone.toString());
                                prefs.setInt('codeI',u.resetCode!);
                                print("eee"+u.phone.toString());
                                Fluttertoast.showToast(
                                    msg: "compte créé avec succès",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0);

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => OtpScreen()
                                    ),
                                        (Route<dynamic> route) => false
                                );
                              }
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
  _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var ids = prefs.getString('id');
    setState(() {
      id=ids!;
      print(id);
    });

  }
}