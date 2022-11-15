

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CartItemSample.dart';
import 'cartBottombar.dart';
import 'cartappbar.dart';

class CartHome extends StatelessWidget {
  const CartHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CartAppBar(),
          Container(
            height: 700,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Color(0xffedecf2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                  topRight: Radius.circular(35)
              ),
            ),
            child: Column(
              children: [
                CartItemSample(),

              ],
            ),

          )

        ],
      ),
     bottomNavigationBar: cartBottomNavBar(),
    );
  }
}
