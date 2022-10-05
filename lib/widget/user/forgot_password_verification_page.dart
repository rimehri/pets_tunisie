import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pfe/widget/index/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/features/User/user.dart';
import '../../comonents/header_widget.dart';
import '../../comonents/theme_helper.dart';
import '../../data/model/User.dart';
import 'profile_page.dart';


class ForgotPasswordVerificationPage extends StatefulWidget {
  const ForgotPasswordVerificationPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordVerificationPageState createState() => _ForgotPasswordVerificationPageState();
}

class _ForgotPasswordVerificationPageState extends State<ForgotPasswordVerificationPage> {
  final _formKey = GlobalKey<FormState>();


  bool _pinSuccess = false;
  late int ? resetcode ;
  late String? code="";
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
                child: HeaderWidget(
                    _headerHeight, true, ),
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
                          children:  [
                            Text('Verification',
                              style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,color: Colors.black45, letterSpacing: .5)),

                              // textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              'Enter the verification code we just sent you on your email address.',
                              style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                  fontWeight: FontWeight.bold,color: Colors.black54, letterSpacing: .5)),
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
                            OTPTextField(

                              length: 4,
                              width: 300,
                              fieldWidth: 50,
                              style: TextStyle(
                                  fontSize: 30
                              ),
                              //controller: rim,
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldStyle: FieldStyle.underline,
                              onCompleted: (pin) {
                                setState(() {
print("otp="+pin);
code=pin;

print("code="+code!);
                                  //code = pin;
                                  _pinSuccess = true;
                                });
                              },
                              onChanged: (value)=> code=value,
                            ),
                            SizedBox(height: 50.0),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "If you didn't receive a code! ",
                                    style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                        color: Colors.black38, letterSpacing: .5)),
                                  ),
                                  TextSpan(

                                    text: 'Resend',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ThemeHelper().alartDialog("Successful",
                                                "Verification code resend successful.",
                                                context);
                                          },
                                        );
                                      },
                                    style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(

                                        fontWeight: FontWeight.bold,color: Colors.blueGrey, letterSpacing: .5)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Container(
                              decoration: _pinSuccess ? ThemeHelper().buttonBoxDecoration(context):ThemeHelper().buttonBoxDecoration(context, "#AAAAAA","#757575"),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      40, 10, 40, 10),
                                  child: Text(
                                    "Verify",
                                    style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,color: Colors.white, letterSpacing: .5)),
                                  ),
                                ),
                                onPressed: _pinSuccess ? () async {
                                  await VerifCode(8222,int.parse(code!));
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => home_page()
                                      ),
                                          (Route<dynamic> route) => false
                                  );
                                } : null,
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

  Future getcode() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    resetcode = prefs.getInt('code');
    print("resetcos is  : " + resetcode.toString());


  }
  @override
  void initState() {
 getcode();
    super.initState();
  }
}
