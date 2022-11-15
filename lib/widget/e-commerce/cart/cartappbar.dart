

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../comonents/constants.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
                  size: 30,
              color: AppConsts.appDeepOrange,
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 20),
          child: Text("Cart ", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: AppConsts.appDeepOrange
          ),),
          ),
          Spacer(),
          Icon (
              Icons.more_vert,
            size: 30,
            color: AppConsts.appDeepOrange,

          )

        ],
      ),

    );
  }
}
