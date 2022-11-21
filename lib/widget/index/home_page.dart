
import 'dart:convert';

import 'package:pfe/comonents/app_bar.dart';
import 'package:pfe/data/model/User.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/comonents/Drawer.dart';
import 'package:pfe/widget/index/categorie.dart';

import '../../comonents/cartads.dart';
import '../../comonents/theme_helper.dart';
import '../../config/constants.dart';
import '../../data/features/User/user.dart';

import 'body.dart';
import 'card_blog.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  late Future _doctorsFuture1;
  List _posts = [];
  late ScrollController _scrollController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      drawer:const  Drawer(child: drawer(),),
      body: CustomScrollView(

        slivers: [
          appbar(),
          SliverToBoxAdapter(
          child:Column(
            children: [
              card_blog(),
              //Categories(),
              body()
            ],
          )
          )


        ],
      ),
    );
  }






}
