

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe/widget/e-commerce/app_bar.dart';

import '../../comonents/Drawer.dart';
import '../../comonents/constants.dart';
import 'Categorie.dart';
import 'ItemsWidget.dart';
class Listproduit extends StatelessWidget {
  const Listproduit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        drawer: const Drawer(
          child: drawer(),
        ),
        body: ListView(

         children: [
           appbar(),
           Container(
           //  height: 500,
             padding: EdgeInsets.only(top: 15),
             decoration: const BoxDecoration(

                 color: Color(0xFFDECF2),
                     borderRadius:BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))

             ),

             child: Column(
               children: [
                 Container(
                   margin: EdgeInsets.symmetric(horizontal: 15),
                   padding: EdgeInsets.symmetric(horizontal: 15) ,
                   height: 50,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(30)
                   ),
                   child: Row(
                     children: [
                       Container (
                         margin: EdgeInsets.only(left: 0),
                         height: 50,
                         width: 300,
                         child: TextFormField(
                           decoration: InputDecoration(border: InputBorder.none,hintText: "Chercher ici "),
                         ),

                       ),
                       Icon(Icons.search)
                     ],
                   ),


                 ),
                 Container(
                   alignment: Alignment.centerLeft,
                   margin: EdgeInsets.symmetric(vertical:20,horizontal: 10 ),
                   child: Text(
                     "Categories",
                     style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold, color: AppConsts.appDeepOrange,)
                   ),
                 ),
                 CategorieWidget(),
                 Container (
                   alignment: Alignment.centerLeft,
                   margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                   child: Text(
                     "Best Selling ",
                     style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: AppConsts.appDeepOrange),
                   ),
                 ),
                 ItemsWidget()
               ],

             ),
           )
         ],
        ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        color: AppConsts.appDeepOrange,
        height: 70,
        items: [
          Icon(Icons.home , color:Colors.white ,size: 30,),
          Icon( CupertinoIcons.cart_fill , color:Colors.white ,size: 30,),
          Icon(Icons.list , color:Colors.white ,size: 30,)
      ],

      ),


    );
  }
}
