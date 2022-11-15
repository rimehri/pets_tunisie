

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../comonents/Drawer.dart';
import '../../comonents/app_bar.dart';

class rendez_vous extends StatelessWidget {
  const rendez_vous({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        drawer:const  Drawer(child: drawer(),),
      body:  Stack(
      children:[
      CustomScrollView(

      slivers: [
    appbar(),

    SliverToBoxAdapter(
      child: Center (
        child: Container(
          margin: EdgeInsets.only(top: 90),
          height: 250,
          child: Image.network("https://theinnonthetay.co.uk/wp-content/uploads/2022/02/istockphoto-1221240925-612x612-1.jpg"),
        ),
      ),
    )
    
    ])])
    );
  }
}
