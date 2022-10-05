import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../comonents/constants.dart';
import '../../../../config/size_config.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight! * 0.05),
              Text(
                "OTP Verification",
                style: GoogleFonts.gloriaHallelujah(textStyle: TextStyle(
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5,
                    letterSpacing: .5)),
              ),
              Text(
                "We sent your code to  ***",
                style: GoogleFonts.gloriaHallelujah(
                    textStyle: TextStyle(letterSpacing: .5)),
              ),
              buildTimer(),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight! * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: GoogleFonts.gloriaHallelujah(

                      textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          letterSpacing: .5)),

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in ",style: GoogleFonts.gloriaHallelujah(

            textStyle: TextStyle(

                letterSpacing: .5)),),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
