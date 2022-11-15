



import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

import '../../comonents/constants.dart';
import 'cart/cartHome.dart';

class appbar extends StatelessWidget {
  const appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon (
            Icons.sort,
            size: 30,
            color: AppConsts.appDeepOrange,
          ),
          Padding(padding: EdgeInsets.only(left: 20),
          child:Text("Shops",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: AppConsts.appDeepOrange),




          ) ,),
          Spacer(),
InkWell(
  onTap: (){

    Navigator.push( context, MaterialPageRoute(builder: (context) => CartHome()), );
  },
  child:   Badge(
    badgeContent: Text("3",style: TextStyle(color: Colors.white),),

    badgeColor: Colors.red,
    padding: EdgeInsets.all(7),
    child: InkWell(
      onTap: (){
        Navigator.push( context, MaterialPageRoute(builder: (context) => CartHome()), );

      },
      child: Icon(Icons.shopping_bag_outlined),
    ),
  ),
)
        ],
      ),
    );
  }
}
