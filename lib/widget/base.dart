
import 'package:flutter/material.dart';
import 'package:pfe/widget/home.dart';


import '../config/size_config.dart';



class base extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: home(),
    );
  }
}