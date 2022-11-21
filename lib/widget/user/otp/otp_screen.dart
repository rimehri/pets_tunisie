import 'package:flutter/material.dart';


import '../../../config/size_config.dart';
import '../registration_page.dart';
import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        leading: InkWell(
          child: Icon(Icons.arrow_back_ios,color: Colors.black45,),
          onTap: (){
            //After successful login we will redirect to profile page. Let's create profile page now
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
          },),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Body(),
    );
  }
}