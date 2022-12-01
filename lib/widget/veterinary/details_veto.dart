import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe/data/features/map.dart';
import 'package:pfe/widget/veterinary/list_vete.dart';
import 'package:pfe/widget/veterinary/rendez_vous.dart';

class details_veto extends StatefulWidget {
  const details_veto({Key? key}) : super(key: key);

  @override
  _details_vetoState createState() => _details_vetoState();
}

class _details_vetoState extends State<details_veto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 233, 233, 1),
      body: Stack(
        children: [
          CustomScrollView(
            // physics: AlwaysScrollableScrollPhysics(),
            //  shrinkWrap: true,
            //  controller:_scrollController ,
            slivers: [
              SliverAppBar(
                  flexibleSpace: FlexibleSpaceBar(
                    background: myflexible(),
                  ),
                  expandedHeight: 300,
                  pinned: true,
                  elevation: 5,
                  toolbarHeight: 55,
                  forceElevated: true,
                  // pinned: true ,
                  // shape: const RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.only(
                  //       bottomRight: Radius.circular(15),
                  //       bottomLeft: Radius.circular(15)),
                  // ),
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.arrow_back_ios),
                    tooltip: 'Menu Icon',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => lis_veto()),
                      );
                    },
                  ),
                  actions: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    )
                  ]),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, top: 18.0, right: 8, left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Diplome et Formation ",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Text(
                                "Diplôme national de Docteur en Médecine Dentaire de la faculté de Médecine dentaire de Monastir"),
                            Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text(
                                  "Mode de réglement ",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        "assets/money-bag.svg",
                                        color: Colors.blue,
                                        width: 20.0,
                                      ),
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Espèce")
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        "assets/cheque.svg",
                                        color: Colors.blue,
                                        width: 20.0,
                                      ),
                                      onPressed: () {},
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Chèque")
                                  ],
                                ),
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  "Adresse  ",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Text(
                                "Route de Gremda km 3.5 à coté de polyclinique ChamsSfax Ville 3000 Sfax Tunisie")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 20, top: 18.0, right: 8, left: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  "Hotaire de travail  ",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 70),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Text("1er Seance "),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      Container(
                                        child: Text("1er Seance "),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("lun "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 40,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Mar "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 40,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Mer "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 40,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Jeu "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 40,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Ven "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 40,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Sam "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text("08:30->13:00 "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 40),
                                            child: Text("08:30->13:00 "),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            child: Text("Dim "),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 50,
                                            ),
                                            child: Text(
                                              " Cabinet Fermé  ",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 70,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            left: 100,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    38,
                    133,
                    23,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(25)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => rendez_vous()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 10,),
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "PRENEZ RENDEZ VOUS ",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget myflexible() {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(top: 80, bottom: 10),
        height: 80,
        width: 80,
        child: Image.asset(
          "assets/doctor.jpg",
          fit: BoxFit.cover,
        ),
      ),
      Container(
          child: Text(
        "Dr Fedia Mtaala",
        style: TextStyle(color: Colors.blue, fontSize: 20),
      )),
      Container(
        child: Text(
          "vétérinaire",
          style: TextStyle(fontSize: 15, color: Colors.black45),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 120.0, top: 20),
        child: Row(
          children: [
            Container(
              child: Icon(
                Icons.phone,
                color: Colors.blueGrey,
              ),
              height: 40, width: 40,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(240, 247, 240, 1),
                  borderRadius: BorderRadius.circular(8)),

              // color: Colors.grey,height: 40,width: 40,),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Icon(
                  Icons.local_post_office_outlined,
                  color: Colors.blueGrey,
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 247, 240, 1),
                    borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                ServiceLauncher.handleButton(
                    "https://www.google.com/maps/search/?api=1&query=36.8466313,36.8466313");
              },
              child: Container(
                child: Icon(
                  FontAwesomeIcons.location,
                  color: Colors.blueGrey,
                ),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 247, 240, 1),
                    borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: 40,
              ),
            )
          ],
        ),
      )
    ],
  );
}
