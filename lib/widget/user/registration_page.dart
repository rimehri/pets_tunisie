
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
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
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
                            decoration: ThemeHelper().textInputDecoration(' Name', 'Enter your name'),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your name";
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
                            decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                return "Enter a valid email address";
                              }

                              else if
                              (val.isEmpty){
                                return "Enter a  phone number";
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
                                "Mobile Number",
                                "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
                                return "Enter a valid phone number";
                              }
                              else if
                              (val.isEmpty){
                                return "Enter a  phone number";
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
                                return "Enter a  phone number";
                              }
                              return null;
                            },
                            onSaved: (newValue) => addresse = newValue!,
                            style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                letterSpacing: .5)),
                            decoration: ThemeHelper().textInputDecoration('Your Address', 'Enter your Address'),
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
                                "Password*", "Enter your password"),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
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
                            child: Text( "you already have account ?",  style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

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
                                    Text("I accept all terms and conditions.", style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                                      color: Colors.grey,

                            letterSpacing: .5)),),
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
                              return 'You need to accept terms and conditions';
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
                                "Register",
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
                                    msg: "account created successfully",
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