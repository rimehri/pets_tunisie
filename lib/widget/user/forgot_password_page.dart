
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../comonents/header_widget.dart';
import '../../comonents/theme_helper.dart';
import '../../data/features/User/user.dart';
import 'forgot_password_verification_page.dart';
import 'login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  late String phone1;
  TextEditingController rimeh = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _headerHeight = 300;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: _headerHeight,
                child: HeaderWidget(_headerHeight, true,),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Forgot Password?',
                              style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,color: Colors.black45, letterSpacing: .5)),

                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5,),


                            Text('We will send you a verification code to check your authenticity.',
                                style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                    color: Colors.black38, letterSpacing: .2)

                                )
                              // textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                controller: rimeh,
                                onSaved: (newValue) => phone1 = newValue!,                                style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                     color: Colors.black45, letterSpacing: .5)),
                                keyboardType: TextInputType.number,
                                decoration: ThemeHelper().textInputDecoration("phone", "Enter your phone"),
                                validator: (val){
                                  if(val!.isEmpty){
                                    return "phone can't be empty";
                                  }

                                  return null;
                                },
                              ),
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Send",
                                    style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,color: Colors.white, letterSpacing: .5)),
                                  ),
                                ),
                                onPressed: ()async{
                                  if(_formKey.currentState!.validate()) {
                                    print(rimeh.text+"eeeeeeeeeeee");
                                    await forgetpassword(rimeh.text);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ForgotPasswordVerificationPage()),
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "Remember your password? ",style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                      fontWeight: FontWeight.bold,color: Colors.black, letterSpacing: .5)),),
                                  TextSpan(
                                    text: 'Login',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => LoginPage()),
                                        );
                                      },
                                    style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                        fontWeight: FontWeight.bold,color: Colors.black45, letterSpacing: .5)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
