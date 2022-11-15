import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe/comonents/app_bar.dart';
import 'package:pfe/data/features/User/user.dart';
import 'package:pfe/widget/animal/add_animal.dart';
import 'package:pfe/widget/animal/card.dart';
import 'package:pfe/widget/animal/details.dart';

import '../../comonents/Drawer.dart';
import '../../data/model/User.dart';

class list_animal extends StatefulWidget {
  const list_animal({Key? key}) : super(key: key);

  @override
  State<list_animal> createState() => _list_animalState();
}

class _list_animalState extends State<list_animal> {
  Future? doc;
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color.fromRGBO(221, 238, 234, 1),
      drawer: const Drawer(
        child: drawer(),
      ),
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            appbar(),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  SingleChildScrollView(child: getBody()),
                ],
              ),
            )
          ],
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => add_animal()),
          );

          // Add your onPressed code here!
        },
        backgroundColor: Color.fromRGBO(59, 120, 121, 1),
        child: const Icon(FontAwesomeIcons.add),
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
          return Container(
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
                itemCount: snapshot.data.animal.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => details(
                                    animal: snapshot.data.animal[index],
                                  )));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0)),
                                    child: Stack(

                                      alignment: Alignment.topCenter,
                                      children: [
                                        Container(
                                          height: 200,
                                          width: 350,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                20, 50, 10, 10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  '',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  'vous voulez vraiment supprimer votre animal \n ',
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: ElevatedButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        style:style ,

                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: ElevatedButton(
                                                        onPressed: () async {
                                                          await deleteanimal(
                                                          "6331aaecf7d5701dd7df846d",
                                                          snapshot.data.animal[index].sId
                                                          );
                                                          Navigator.pop(context);
                                                          {

                                                          }


                                                        },

                                                        child: Text(
                                                          'Confirmer ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ));
                        },
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Spacer(),
                              Icon(FontAwesomeIcons.trash),
                            ],
                          ),
                        ),
                        child: cardanimal(cart4: snapshot.data.animal[index]),
                      ),
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
    doc = getanimal("635a95b07bac467cb2ab8690");
    super.initState();
  }
}
