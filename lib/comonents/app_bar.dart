
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
class appbar  extends StatelessWidget {
  const appbar ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //pinned: true,


      floating: true,
      elevation: 10,
      forceElevated: true,
      iconTheme: IconThemeData(color:  Color.fromRGBO(59, 120, 121, 1),size: 30),


      toolbarHeight:65,
      title:
      Container(

        //alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 10.0,left: 20 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(" Pets Tunisie" ,
              style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,color: Color.fromRGBO(59, 120, 121, 1), letterSpacing: .5)),),
            Column(

              children: [
                const Icon(
                  FontAwesomeIcons.store, size: 28, color: Color.fromRGBO(59, 120, 121, 1),),
                Text('Shops',
                  style: GoogleFonts.gloriaHallelujah(textStyle: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold, color: Color.fromRGBO(59, 120, 121, 1), letterSpacing: .5)),
                )
              ],
            )
          ],
        ),
      ),

      backgroundColor: Colors.white,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      flexibleSpace:Stack(

        children: [

          Positioned(
            top: 90,
            right: 10,


            child: Row(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container (
                    margin: EdgeInsets.only(left: 10,top: 20),
                    height: 50,
                    width: 250,

                    child:    TextField(

                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          FontAwesomeIcons.search, size:20,color: Colors.grey.withOpacity(0.3),),


                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.3),
                        hintText: "Search..",
                        hintStyle: TextStyle(
                          color: Colors.grey[400],

                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )
                ),
                Container (
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(59, 120, 121, 1),
                      borderRadius:  BorderRadius.only(
                        topLeft:  Radius.circular(10.0),
                        topRight:  Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )
                  ),

                  margin: EdgeInsets.only(left: 10,top: 20),
                  height: 50,
                  width: 50,
                  child:    const Icon(
                    FontAwesomeIcons.search, size: 20, color: Colors.white,),

                ),

                Container (
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color.fromRGBO(59, 120, 121, 1),),
                      borderRadius:  const BorderRadius.only(
                        topLeft:  Radius.circular(10.0),
                        topRight:  Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )
                  ),

                  margin: EdgeInsets.only(left:10,top: 20),
                  height: 50,
                  width: 50,
                  child:    const Icon(
                    FontAwesomeIcons.list, size: 20, color: Color.fromRGBO(59, 120, 121, 1),),

                )
              ],
            ),
          ),

        ],
      ) ,

    );
  }
}
