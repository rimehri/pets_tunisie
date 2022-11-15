

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe/data/features/User/user.dart';
import 'package:pfe/widget/veterinary/cartveto.dart';

import '../../comonents/Drawer.dart';
import '../../comonents/app_bar.dart';
import '../annonce/details_ads.dart';
import 'details_veto.dart';
class lis_veto extends StatefulWidget {
  const lis_veto({Key? key}) : super(key: key);

  @override
  State<lis_veto> createState() => _lis_vetoState();
}

class _lis_vetoState extends State<lis_veto> {
  Future? doc;
  @override
  Widget build(BuildContext context) {
    Future doc;
    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 238, 234, 1),

      drawer:const  Drawer(child: drawer(),),
      body:   Stack(
          children:[
            CustomScrollView(

              slivers: [
                appbar(),

                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      SingleChildScrollView(child: getBody()),
                    ],
                  ),
                )

              ],
            )


          ]
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

         // Navigator.push( context, MaterialPageRoute( builder: (context) => add_animal()), );

          // Add your onPressed code here!
        },
        backgroundColor:  Color.fromRGBO(59, 120, 121, 1),
        label: const Text('Rejoignez-nous'),
        icon: const Icon(Icons.add),
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
            return ListView.builder(

                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,itemBuilder: (context,index){
              return InkWell(

                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => details_veto(

                          )));
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: cartveto(cart: snapshot.data[index]),
                ),
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
  doc =   getuser();
    super.initState();
  }
}
