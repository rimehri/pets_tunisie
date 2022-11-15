


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pfe/data/features/User/user.dart';


import '../../data/model/User.dart';
import '../../data/model/annonce.dart';

class cardads extends StatefulWidget {
  final Annonce cart4;

  const cardads({Key? key, required this.cart4,}) : super(key: key);

  @override
  State<cardads> createState() => _cardadsState();
}

class _cardadsState extends State<cardads> {
String? phone ="";
  @override
  Widget build(BuildContext context) {
    return buildCard();
  }
  Container buildCard() {
    var heading = '\$2300 per month';
    var subheading = '2 bed, 1 bath, 1300 sqft';
    var cardImage = NetworkImage(
        'https://www.purina-arabia.com/sites/default/files/2020-12/Product%20Listing%20Hero%20Cat%20Food.jpg');
    var supportingText =
        'Beautiful home to rent, recently refurbished with modern appliances...';
    return Container(
      margin: EdgeInsets.only(right: 8,left: 8),
      child: Card(


          color: Color.fromRGBO(229, 229, 229, 1),
          elevation: 4.0,
          child: Column(
            children: [

              Container(

                height: 110.0,
                child: Ink.image(
                  image: cardImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(widget.cart4.prix.toString()+"TND",style: TextStyle(color: Colors.red,fontSize: 17,fontWeight: FontWeight.bold),),
              ),
              Container (
                alignment: Alignment.bottomLeft,
                child: Text(widget.cart4.titre!,style: TextStyle(fontSize: 20),),),
              Divider( color: Color.fromRGBO(59, 120, 121, 0.5), height: 1,),

              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                children: [


                  Container(

                    height: 30,
                    width: 30,
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
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.cart4.date_creation.toString().substring(0,10) ,
                      style:TextStyle(
                        color: Colors.black,


                      ),),
                  ),
                ],
              ),


              // ButtonBar(
              //   children: [
              //     TextButton(
              //       child: const Text(''),
              //       onPressed: () {/* ... */},
              //     ),
              //
              //   ],
              // )
            ],
          )),
    );
  }

}
