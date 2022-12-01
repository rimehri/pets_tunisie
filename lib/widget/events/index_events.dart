import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pfe/comonents/default_button.dart';
import 'package:pfe/data/features/events/EventController.dart';
import 'package:pfe/widget/events/addEvent.dart';


import '../../comonents/constants.dart';
import '../../comonents/theme_helper.dart';

import 'TaskTile.dart';

class index_events extends StatefulWidget {


  const index_events({Key? key}) : super(key: key);

  @override
  State<index_events> createState() => _index_eventsState();
}

class _index_eventsState extends State<index_events> {
  final _eventController = Get.put(EventController());
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body: Column(


children: [
  appar(),

  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: EdgeInsets.all(8),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.yMMMd().format(DateTime.now()),style: subHeadingStyle,),
            Text("Today",style: subHeadingStyle2,)
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(8),
       child:     MyButton(label: "+ New Events", onTap: () async {

        await  Get.to(()=>const addEvents());
_eventController.getEvent();

       }),
      )



    ],
  ),
  Container(
    margin: EdgeInsets.only(top: 20,left:10 ),
    child: DatePicker(
      DateTime.now(),
      height: 100,
      width: 80,
      initialSelectedDate: DateTime.now(),
      selectedTextColor:  Colors.white,
      selectionColor:  AppConsts.appDeepOrange,
      dateTextStyle: GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey
        )),
        dayTextStyle: GoogleFonts.lato(
            textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey
            )

      ),
     monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey
          )

      ),
      onDateChange: (date){
        _selectedDate= date;

      },
    ),
  ),
  SizedBox(height: 10,),
 Flex (
     direction: Axis.vertical,

     children:[  Obx(() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      itemCount: _eventController.eventList.length,

      itemBuilder: (_, index) {
        print(_eventController.eventList.length.toString());
        return AnimationConfiguration.staggeredList(position: index,
            child: SlideAnimation(
              child: FadeInAnimation(
                child: Row(
                  children: [
                    GestureDetector(
                      child: TaskTile(_eventController.eventList[index],),
                    )

                  ],
                ),
              ),
            )
        );
      });
  })],)


],
      ),
    );
  }

}


class appar extends StatelessWidget {
  const appar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon (
            Icons.sort,
            size: 30,
            color: AppConsts.appDeepOrange,
          ),
          Padding(padding: EdgeInsets.only(left: 20),
            child:Text("Events",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: AppConsts.appDeepOrange),




            ) ,),

        ],
      ),
    );
  }
}

