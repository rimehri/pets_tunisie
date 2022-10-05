import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback onClicked;
  final String? text;

  const ButtonWidget({Key? key,
    required this.onClicked,
     this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(

    margin: EdgeInsets.only(left:0 , right: 0, top: 0,bottom: 20),
    padding: EdgeInsets.only(left: 20, right: 168),
    height: 54,
    decoration: BoxDecoration(
        border: Border.all(
            width: 1,
            color: Colors.grey
        ),



      borderRadius: BorderRadius.circular(50),
      color: Colors.white,
      boxShadow: [
        BoxShadow(


            offset: Offset(0, 10),
            blurRadius: 50,
            color: Color(0xffEEEEEE)
        ),
      ],
    ),
    child: Container(

      child: InkWell(
        child: Container(
             // style: ElevatedButton.styleFrom(minimumSize: Size(100, 42)),
          //style: ElevatedButton.styleFrom( primary:Colors.grey[200],minimumSize: Size(80,42)),

              child: Container(


                child: Row(

                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Icon( Icons.date_range,
                  color: Color.fromRGBO(59, 120, 121, 1),),
                    const SizedBox(width: 20),
                    Text(

                      text!,
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),


                    ),

                  ],
                ),
              ),

            ),
        onTap:   onClicked,
      ),
    ),
  );
}
