import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe/comonents/app_bar.dart';

import 'package:pfe/data/features/annonce/anonnce.dart';
import 'package:pfe/widget/animal/add_animal.dart';
import 'package:pfe/widget/annonce/add_ads.dart';

import 'package:pfe/widget/annonce/cart_ads.dart';
import 'package:pfe/widget/annonce/details_ads.dart';

import '../../comonents/Drawer.dart';
class list_ads extends StatefulWidget {
  const list_ads({Key? key}) : super(key: key);

  @override
  State<list_ads> createState() => _list_adsState();
}

class _list_adsState extends State<list_ads> {
  Future? doc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      drawer:const  Drawer(child: drawer(),),
      body:   Stack(
          children:[
            CustomScrollView(

              slivers: [
                appbar(),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      getBody(),
                    ],
                  ),
                )

              ],
            )


          ]
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(right: 70) ,
        child: FloatingActionButton.extended(
          icon: const Icon(Icons.add_a_photo_outlined),
          label:Text(' Publier Votre annonce'),
          onPressed: () {

            Navigator.push( context, MaterialPageRoute( builder: (context) => add_annonce()), );

            // Add your onPressed code here!
          },
          backgroundColor:  Color.fromRGBO(59, 120, 121, 0.7),

        ),
      ),
    );
  }
  Widget getBody() {




    return FutureBuilder<dynamic>(
      future: doc,
      builder: (
          BuildContext context,
          AsyncSnapshot<dynamic> snapshot,
          ) {
        print(snapshot.connectionState);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Container (
            margin: EdgeInsets.only(top: 200),
            child: CupertinoActivityIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          print("---------");
          print(snapshot.data);
          print("---------");
          if (snapshot.hasError) {

            return const Text('Error');
          } else if (snapshot.hasData) {
            return GridView.builder(
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 4 / 4.5,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(child: cardads(cart4:snapshot.data[index] ,


                  ),


                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsAds(
                                annonce: snapshot.data[index],
                              )));
                    },


                  );
                });
          } else {
            return const Text('Empty data');
          }
        } else {
          return Text('State: ${snapshot.connectionState}');
        }
      },
    );
  }

  @override
  void initState() {
    doc= getannonce();
    super.initState();
  }
}
