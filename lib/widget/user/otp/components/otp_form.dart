import 'package:flutter/material.dart';
import 'package:pfe/data/features/User/user.dart';
import '../../../../comonents/constants.dart';
import '../../../../comonents/default_button.dart';
import '../../../../config/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../index/home_page.dart';



class OtpForm extends StatefulWidget {
  const OtpForm({
    Key? key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  final  String? phone="";
  String? u1,u2,u3,u4;
  late SharedPreferences sharedPreferences;
  String? code ;
  final String? id_user="";

  // Future<dynamic> getSharedPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //
  //     id_user = prefs.getString("id");
  //     phone = prefs.getString('phone');
  //
  //   });
  //
  //
  // }
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight! * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    u1 = value;
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => {
                     u2 = value,
                    nextField(value, pin3FocusNode)},
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => {

    u3 = value,
                    nextField(value, pin4FocusNode)},
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    u4 = value;
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      code = u1!+u2!+u3!+u4!;
                    //  print("id"+id_user!);
                      print(code!);
                     // print("phone"+phone!);
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight! * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();


              final String?  id_user = prefs.getString("id");
               final String? phone = prefs.getString('phone');



print(id_user);
    await otp(phone!,u1!+u2!+u3!+u4! );


          Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
          builder: (context) => home_page()
          ),
          (Route<dynamic> route) => false
          );

    },

          )
        ],
      ),
    );
  }
}
