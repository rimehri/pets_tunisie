




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/widget/annonce/cardimage.dart';

import '../../comonents/constants.dart';
import '../../config/size_config.dart';
import '../../data/model/annonce.dart';
import 'all_ads.dart';

class DetailsAds extends StatefulWidget {
  const DetailsAds({Key? key,required this.annonce}) : super(key: key);
final Annonce annonce ;

  @override
  State<DetailsAds> createState() => _DetailsAdsState();
}

class _DetailsAdsState extends State<DetailsAds> {
  int currentPage = 0;
 ScrollController? _scrollController;
  List<Map<String, String>> ann = [
    {

      "image": "https://www.furminator.net/Static/Tetra/media/img/navigation/products.png"

    },
    {

      "image": "https://img.arabshoppy.com/ae04/kf/Sd05912470957403891c4f509f6203c3cK.jpg"
    },
    {

      "image": "https://image.made-in-china.com/155f0j00gMhGRkEoYIqw/Plastic-Cat-Litter-Shovel-Pet-Cat-Accessories-Products-for-Cat.jpg"
    },
    {

      "image": "https://i.etsystatic.com/10692466/r/il/69ff48/1395834613/il_fullxfull.1395834613_2q82.jpg"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          CustomScrollView(
           // physics: AlwaysScrollableScrollPhysics(),
            //  shrinkWrap: true,
          //  controller:_scrollController ,
            slivers: [
              SliverAppBar(
                  elevation: 10,
                  toolbarHeight:55,
                  forceElevated: true,
                  // pinned: true ,
          shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25)),
    ),
    backgroundColor: Colors.white,
    leading: IconButton(
    color: Colors.black,
    icon: const Icon(Icons.arrow_back_ios),
    tooltip: 'Menu Icon',

      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => list_ads()),
        );

      },
    ),
    actions: <Widget>[
    IconButton(

    onPressed: () {},
    icon: Icon(Icons.share,color: Colors.black,),
    ),
    IconButton(

    onPressed: () {},
    icon: Icon(Icons.favorite_border,color: Colors.black,),
    )

              ]),
              SliverToBoxAdapter(
                child: Column(

                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.35,
                      width: MediaQuery.of(context).size.width*0.9,

                      child: Column(

                        children: [
                          Expanded(
                            flex: 1,
                            child: PageView.builder(
                              onPageChanged: (value) {
                                setState(() {
                                  currentPage = value;
                                });
                              },
                              itemCount: ann.length,
                              itemBuilder: (context, index) => card(
                                image: ann[index]["image"]!,

                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              ann.length,
                                  (index) => buildDot(index: index),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                          Container
                        (
                        margin: EdgeInsets.only(top: 10,left: 360),
            child: Text(widget.annonce.prix.toString()+"dt",style: TextStyle(fontSize: 20),),),

                        Container
                          (
                          margin: EdgeInsets.only(bottom: 0,right: 20,left: 20),
                          child: Text(widget.annonce.titre!,style: TextStyle(fontSize: 20),),),
                        Container
                          (
                          margin: EdgeInsets.only(top: 10,right: 20,left: 20),
                          child: Text(widget.annonce.categorie!,style: TextStyle(fontSize: 20),),),
                        Container
                          (
                          margin: EdgeInsets.only(top: 10,right: 20,left: 20),
                          child: Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                        Container
                          (
                          margin: EdgeInsets.only(top: 0 ,left: 20,right: 20),
                          child: Text(widget.annonce.description!,style: TextStyle(fontSize: 20),),),
                        SizedBox(height: 10,),
                        Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
                        Container(
                          margin: EdgeInsets.only(right: 20,left: 20,top: 10),
                          child: Text("Emplacement ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [


                            Container(

                              height: 40,
                              width: 40,
                              // color: Colors.grey,
                              child: IconButton(
                                icon:
                                SvgPicture.asset("assets/location.svg",

                                  color:Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 2),
                              child: Text(
                                "Tunis",
                                style:GoogleFonts.gloriaHallelujah (textStyle:TextStyle(
                                  color: Colors.black,
                                ),

                                ),),
                            ),
                            Divider( color: Color.fromRGBO(59, 255, 121, 1), height: 1,),




                          ],
                        ),
                        Divider( color: Color.fromRGBO(59, 120, 121, 1), height: 1,),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [

                            CircleAvatar(
                              radius: 25.0,
                              backgroundColor:Color.fromRGBO(59, 120, 121, 0.4),
                              child: Image.asset(
                                'assets/3135715.png',
                              ), //For Image Asset

                            ),
                            Container(
                              margin: EdgeInsets.only(top:10,right: 100),
                              child: Text(
                                "Rimeh Berrichi ",
                                style:GoogleFonts.gloriaHallelujah (textStyle:TextStyle(fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),

                                ),),
                            ),
                            Divider( color: Color.fromRGBO(59, 255, 121, 1), height: 1,),




                          ],
                        ),

                        SizedBox(height: 100,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    173,
                    40,
                    93,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: FlatButton(

                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => howScreen()),
                  // );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.message,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(
                    "Message ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    38,
                    133,
                    23,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: FlatButton(

                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => howScreen()),
                  // );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.phone,color: Colors.white,),
                    SizedBox(width: 10,),
                    Text(
                      "51803386 ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),

              ),
            ),
          ),


        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20: 6,
      decoration: BoxDecoration(
        color: currentPage == index ?    Color.fromRGBO(59, 120, 121, 1) : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
  @override
  void initState() {
    _scrollController = new ScrollController();
    _scrollController?.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _scrollController?.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
