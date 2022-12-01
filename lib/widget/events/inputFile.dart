import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfe/comonents/constants.dart';
import 'package:pfe/comonents/theme_helper.dart';

class inputFiled extends StatelessWidget {
  final String title;
  final String hint;

  final TextEditingController? controller;
  final Widget? widget;

  const inputFiled(
      {required this.title,
      required this.hint,
       this.controller,
       this.widget,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
          style: titlestyle
            ,),
          Container(
            margin: EdgeInsets.only(top: 8,),
            padding: EdgeInsets.only(left: 14 ),
            child: Row(
              children: [
                Expanded(
                  child:TextFormField(
                    readOnly: widget==null?false:true,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subtitlestyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        width: 0)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,width: 0)
                      )
                    ),
                    style: subtitlestyle,
                    controller: controller,
                    autofocus: false,
                    cursorColor:Colors.grey[700]
                  ) ,
                ),
                widget==null?Container():Container(child: widget,)
              ],
            ),
            height: 52,

            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0
              ),
              borderRadius: BorderRadius.circular(12)
            ),


          )


        ],
      ),
    );
  }
}
