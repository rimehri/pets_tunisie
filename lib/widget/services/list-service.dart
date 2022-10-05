import 'package:flutter/material.dart';
import 'package:pfe/widget/services/cartservice.dart';
import 'package:pfe/widget/services/categories.dart';

import '../../comonents/Drawer.dart';
import '../../comonents/app_bar.dart';
import '../../data/features/User/user.dart';

class list_service extends StatefulWidget {
  const list_service({Key? key}) : super(key: key);

  @override
  State<list_service> createState() => _list_serviceState();
}

class _list_serviceState extends State<list_service> {
  Future? doc;
  @override
  Widget build(BuildContext context) {
         return Scaffold(
           backgroundColor: Color.fromRGBO(237, 241, 240, 1),

      drawer:const  Drawer(child: drawer(),),
      body: Stack(
        children:  [
          CustomScrollView(

            slivers: [
              appbar(),
              SliverToBoxAdapter(
              child:Column(
                children: [
                  SizedBox(height: 60,),
                  Categories(),
                  getBody()
                ],
              )
              ),


            ],
          )
        ],
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
          return Center(child: CircularProgressIndicator());
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

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => details(
                  //           animal:snapshot.data.animal[index],
                  //         )));

                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: cartveto(cart2: snapshot.data[index]),
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
