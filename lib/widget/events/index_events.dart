import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pfe/comonents/default_button.dart';
import 'package:pfe/data/features/events/EventController.dart';
import 'package:pfe/widget/events/addEvent.dart';


import '../../comonents/Drawer.dart';
import '../../comonents/constants.dart';
import '../../comonents/theme_helper.dart';

import '../../data/db_helper.dart';
import '../../data/model/Event.dart';
import 'TaskTile.dart';
import 'notification/notification_service.dart';

class index_events extends StatefulWidget {


  const index_events({Key? key}) : super(key: key);

  @override
  State<index_events> createState() => _index_eventsState();
}

class _index_eventsState extends State<index_events> {

  DbHelper _sqlDb = DbHelper();
  var eventList = <Event> [].obs;
  final _eventController = Get.put(EventController());
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Drawer(
        child: drawer(),
      ),
backgroundColor: Colors.white,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),



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
            Text("Aujourd'hui",style: subHeadingStyle2,)
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(8),
       child:     MyButton(label: "+ Nouveaux ", onTap: () async {

        await  Get.to(()=>const addEvents());
//_eventController.getEvent();

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
        setState(() {
          _selectedDate= date;
        });


      },
    ),
  ),
  SizedBox(height: 10,),
 //DROP TABLE EVENT IF U NEED IT JUST REMOVE THE COMM
// InkWell(child: Text("delete "),onTap: (){_sqlDb.deletetable(); },),
 Flex (
     direction: Axis.vertical,

     children:[  Obx(() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,


      itemCount: eventList.length,

      itemBuilder: (_, index) {
          Event event = eventList[index];
          if(event.repeat=='Quotidien'){
            DateTime date = DateFormat.jm().parse(event.startTime.toString());
            var myTime = DateFormat("HH:mm").format(date);
            print(myTime);
            return AnimationConfiguration.staggeredList(position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap:(){
                            _showBottomShee(context,event);
                          },
                          child: TaskTile(eventList[index],),
                        )

                      ],
                    ),
                  ),
                )
            );
          }
          if (event.date==DateFormat.yMd().format(_selectedDate)){
            return AnimationConfiguration.staggeredList(position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap:(){
                            _showBottomShee(context,event);
                          },
                          child: TaskTile(eventList[index],),
                        )

                      ],
                    ),
                  ),
                )
            );
          }
          else {
            return Container();
          }
        print(event);

      });
  })],)


],
      ),
    );
  }
var notifeyHelper;
@override
  void initState()  {

reed();

    // TODO: implement initState
    super.initState();
    //notifeyHelper=NotificationHelper();
  //  notifeyHelper.requestIOSOermission();
  }

  _showBottomShee(BuildContext contex , Event event) {
Get.bottomSheet(Container(
  padding: const EdgeInsets.only(top:4 ),
  height: event.isCompleted==1?MediaQuery.of(contex).size.height*0.24:MediaQuery.of(contex).size.height*0.32,
  color: Colors.white,
  child: Column(
    children: [
      Container(
        height: 6,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[300]
        ),
      ),
      Spacer(),
      event.isCompleted==1?Container():
      _buttomsheetButton(label: "Événement terminé",onTap: (){MakeEventCompleted(event.id!);reed();Get.back();},clr: AppConsts.appDeepOrange,context: contex),SizedBox(height: 10,),
      _buttomsheetButton(label: "Supprimer l'événement ",onTap: () {
delete(event);
reed();
Get.back();

        
        
        
      },clr: Colors.red[300]!,context: contex),
      SizedBox(height: 10,),
      _buttomsheetButton(label: "fermer" ,onTap: (){},isClose:true, clr: Colors.white!,context: contex),
      SizedBox(height: 10,)
   ],
  ),
));


  }
  _buttomsheetButton({String? label,Function()? onTap,required Color clr, bool isClose=false,required BuildContext context}){
return GestureDetector(
  onTap: onTap!,
  child: Container(
    child: Center(child: Text(label!,style: isClose?titlestyle:titlestyle.copyWith(color:Colors.white ,fontWeight: FontWeight.bold))),
    margin :EdgeInsets.symmetric(vertical: 4),
    height: 55,
    width:MediaQuery.of(context).size.width*0.9 ,

    decoration: BoxDecoration(
        color:isClose==true? Colors.transparent:clr,
      border:Border.all(width: 1,
          color: isClose==true?Colors.grey[300]!:clr),
      borderRadius: BorderRadius.circular(20)
    ),
  ),
);
}




  Future<void > reed () async {
    List<Map<String,dynamic>>? events=  await   _sqlDb.readData("SELECT * FROM 'event' ");
    eventList.assignAll(events!.map((data ) => new Event.fromJson(data)).toList());
    print ( events);
  }
  Future<void>  MakeEventCompleted(int id )async {
    int i= await _sqlDb.updateData(id);
    print("updateindex"+i.toString());
  }

  Future<void> delete (Event event)async{

    int  response = await  _sqlDb.deletetData(event);

    print("delete"+response.toString());


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
            child:Text("événements",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: AppConsts.appDeepOrange),




            ) ,),

        ],
      ),
    );
  }
}

