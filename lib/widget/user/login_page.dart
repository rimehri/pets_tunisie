import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:pfe/data/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pfe/widget/user/registration_page.dart';

import '../../comonents/header_widget.dart';
import '../../comonents/theme_helper.dart';
import '../../data/features/User/user.dart';
import '../../data/model/User.dart';
import '../index/home_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late SharedPreferences sharedPreferences;
  double _headerHeight = 250;
 final  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email = "";
late String currentuser="" ;
  late String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(
                  _headerHeight, true), //let's create a common header widget
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  // This will be the login form
                  child: Column(
                    children: [
                      Text(
                        " Pets Tunisie",
                        style: GoogleFonts.gloriaHallelujah(
                            textStyle: const TextStyle(
                                fontSize: 34.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                                letterSpacing: .5)),
                      ),
                      SizedBox(height: 30.0),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                child: TextFormField(

                                  onSaved: (newValue) => email = newValue!,
                                  style: GoogleFonts.gloriaHallelujah(
                                      textStyle: TextStyle(letterSpacing: .5)),
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Email', 'Entrez Ton Email'),
                                  validator: (val) {
                                    if ((val!.isEmpty)) {
                                      return "entrez votre email valide";
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 30.0),
                              Container(
                                child: TextFormField(

                                  onSaved: (newValue) => password = newValue!,
                                  style: GoogleFonts.gloriaHallelujah(
                                      textStyle:
                                          const TextStyle(letterSpacing: .5)),
                                  obscureText: true,
                                  decoration: ThemeHelper().textInputDecoration(
                                      'Mot de Passe', 'Enter your password'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "s'il vous plait entrez votre mot de passe";
                                    }
                                    return null;
                                  },
                                ),
                                decoration:
                                    ThemeHelper().inputBoxDecorationShaddow(),
                              ),
                              SizedBox(height: 15.0),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPage()),
                                    );
                                  },
                                  child: Text(
                                    "Mot de passe oublié?",
                                    style: GoogleFonts.gloriaHallelujah(
                                        textStyle: TextStyle(
                                            color: Colors.grey,
                                            letterSpacing: .3)),
                                  ),
                                ),
                              ),
                              Container(
                                decoration:
                                    ThemeHelper().buttonBoxDecoration(context),
                                child: ElevatedButton(
                                  style: ThemeHelper().buttonStyle(),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(40, 10, 40, 10),
                                    child: Text(
                                      'Connexion',
                                      style: GoogleFonts.gloriaHallelujah(
                                          textStyle: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              letterSpacing: .5)),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      User u = await login(email, password);
                                      final prefs = await SharedPreferences.getInstance();
                                     // await prefs.setString('name', u.name!);
                                      //await prefs.setString('addresse', u.addresse!);
                                     // await prefs.setString('mail', u.email!);
                                  //    await prefs.setString('phone', u.phone!);
                                      setState(() {
                                        //currentuser = u.sId!;
                                      });
                                      print(password);
                                      print(email);
                                      print(u.image);
                                      print(u);
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => home_page()
                                          ),
                                              (Route<dynamic> route) => false
                                      );
                                    }

                                    //  },

                                  }),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                //child: Text('Don\'t have an account? Create'),
                                child: Text.rich(TextSpan(children: [
                                  TextSpan(
                                      text: "vous n'avez pas de compte, ",
                                      style: GoogleFonts.gloriaHallelujah(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              letterSpacing: .5))),
                                  TextSpan(
                                    text: 'Créez',
                                    style: GoogleFonts.gloriaHallelujah(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Color.fromRGBO(59, 120, 121, 1),
                                            letterSpacing: .5)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RegistrationPage()));
                                      },
                                  ),
                                ])),
                              ),
                            ],
                          )),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
  getCurrentUseer() async {
  User u = await getCurrentUser(currentuser);
    final uid = u.sId;
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  //await prefs.setString('currentid', u.sId);


    //print(uemail);
  }

}
