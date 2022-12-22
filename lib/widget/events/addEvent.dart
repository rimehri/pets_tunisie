import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pfe/comonents/default_button.dart';
import 'package:pfe/comonents/theme_helper.dart';
import 'package:pfe/data/features/events/EventController.dart';

import '../../comonents/constants.dart';
import '../../config/constants.dart';
import '../../data/db_helper.dart';
import '../../data/model/Event.dart';
import 'index_events.dart';
import 'inputFile.dart';

class addEvents extends StatefulWidget {
  const addEvents({Key? key}) : super(key: key);

  @override
  State<addEvents> createState() => _addEventsState();
}

class _addEventsState extends State<addEvents> {
 final  EventController _eventController = Get.put(EventController());
  DateTime _selectedDate = DateTime.now() ;
 DbHelper _sqlDb = DbHelper();
  String _endTime="9.30 PM";
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String _startTime=DateFormat("hh:mm a ").format(DateTime.now()).toString();
int _selectedRemind = 5 ;
int _selectedcolor = 0;
List <int> remindList=[
  5,10,15,20
];
  String _selectedRepeat = "Rien" ;
  List <String> RepeatList=[
 "Rien",
    "Quotidien",
    "Hebdomadaire",
    "Mensuel"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          appar(),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20,top: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ajouter un événement",
                    style: subHeadingStyle
                  ),
                  SizedBox(height: 8,),
                  inputFiled(title: "Titre", hint: "Titre", controller: _titleController,),
                  SizedBox(height: 8,),
                  inputFiled(title: "Note", hint: "Note", controller: _noteController,),
                  SizedBox(height: 8,),
                  inputFiled(title: "Date", hint: DateFormat.yMd().format(_selectedDate),
                  widget: IconButton(
                    icon: Icon(Icons.calendar_today_outlined,color: Colors.grey,),
                    onPressed: (){

                      _getDateFromUser();

                    },

                  ),
                  ),
                  SizedBox(height: 8,),
                  Row( 
                    children: [
                      Expanded(child: inputFiled(title: "date de début",hint: _startTime,
                        widget: IconButton(
                        onPressed: (){
                          _getTimeFromUser(isStratTime:true);
                        },
                        icon: Icon(
                          Icons.access_alarm_rounded,color: Colors.grey,
                        ),
                      ),)),
                      SizedBox(width: 12,),
                      Expanded(child: inputFiled(title: "date de fin ",hint: _endTime,  widget: IconButton(
                        onPressed: (){
                          _getTimeFromUser(isStratTime:false);
                        },
                        icon: Icon(
                          Icons.access_alarm_rounded,color: Colors.grey,
                        ),
                      )))
                    ],
                  ),
                  SizedBox(height: 8,),
                  inputFiled(title: "rappeler", hint: "$_selectedRemind minutes d'avance",
                  widget: DropdownButton(


                    icon:Icon(Icons.keyboard_arrow_down,color:Colors.grey),
                    iconSize: 32,
                    elevation: 4,
                    style: subtitlestyle,
                    underline:Container(height: 0,) ,
                    items:  remindList.map<DropdownMenuItem<String>>((int value) {
                      return new DropdownMenuItem<String>(
                        value: value.toString(),
                      child: new Text(value.toString()),
                      );
                      }).toList(),
                    onChanged: (String? newvalue) {
                      setState(() {

                        _selectedRemind= int.parse(newvalue!);
                      });
                    },
                  ),

                  ),
                  SizedBox(height: 8,),
                  inputFiled(title: "Répéter", hint: "$_selectedRepeat ",
                    widget: DropdownButton(


                      icon:Icon(Icons.keyboard_arrow_down,color:Colors.grey),
                      iconSize: 32,
                      elevation: 4,
                      style: subtitlestyle,
                      underline:Container(height: 0,) ,
                      items:  RepeatList.map<DropdownMenuItem<String>>((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value!,style: TextStyle(color: Colors.grey)),
                        );
                      }).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {

                          _selectedRepeat=newvalue!;
                        });
                      },
                    ),

                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.center ,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Couleur",style: titlestyle,),
                          SizedBox(height: 8,),

                          Wrap(
                            children: List<Widget>.generate(3, (int index) {
                              return GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _selectedcolor= index;
                                  });

                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: CircleAvatar (
                                  radius: 14,
                                    backgroundColor: index ==0?kBlueColor:index==1?kActiveIconColor:AppConsts.appDeepOrange,
                                    child: _selectedcolor==index?Icon(Icons.done,color: Colors.white,size: 15,):Container(),
                                  ),
                                ),
                              );
                            })
                          )
                        ],
                      ),
                      MyButton(label: "Créer ", onTap: (){

                        _validateDate();
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(4.0)),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    height: 200,
                                    width: 350,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(
                                          20, 50, 10, 10),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'Information',
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          Text(
                                            'Votre nouvel evenments a été ajouté avec succès : \n ',
                                            style: TextStyle(
                                                fontSize: 20),
                                          ),
                                          ElevatedButton(
                                            onPressed: () => Navigator
                                                .of(context)
                                                .pushReplacement(
                                                MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            index_events())),
                                            child: Text(
                                              'Okay',
                                              style: TextStyle(
                                                  color:
                                                  Colors.white),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      top: -40,
                                      child: CircleAvatar(
                                        backgroundColor:
                                        Colors.green,
                                        radius: 40,
                                        child: Icon(
                                          Icons.check_rounded,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      )),
                                ],
                              ),
                            ));
                      })
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  _getDateFromUser() async {
    DateTime? _pikerDate = await  showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),

        lastDate: DateTime(2221)
    );
    if(_pikerDate!=null){
      setState(() {
        _selectedDate = _pikerDate;
        print(_selectedDate);
      });

    }
    else
      {
print("it's null or something is wrong");
      }
  }
  _getTimeFromUser({required bool isStratTime}) async {
    var pickedTime= await _showtimepicker();
    String _formtedTime =  pickedTime.format(context);
    if(pickedTime==null){
      print("Time cancled");
    }else if(isStratTime==true){
      setState(() {
        _startTime=_formtedTime;
      });

    }
    else if(isStratTime==false){
setState(() {
  _endTime=_formtedTime;
});

    }
    
    
  }
  _showtimepicker(){
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,

        context: context, initialTime: TimeOfDay(
        //_startTime=> 10:30 AM
        hour: int.parse(_startTime.split(":")[0]),
        minute:  int.parse(_startTime.split(":")[1].split(" ")[0]),
    ));
  }
  _validateDate() async {
    String? title = _titleController.text;
    String? note = _noteController.text;
    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
int response = await  _sqlDb.insertData(  Event(

  title:_titleController.text,

  note:_noteController.text,
  date :DateFormat.yMd().format(_selectedDate),
  isCompleted:0,

  startTime:_startTime,
  endTime:_endTime ,
  color:_selectedcolor,
  remind :_selectedRemind,
  repeat : _selectedRepeat,

));
print(response);
//Get.back();
    } else
      Fluttertoast.showToast(
          msg: "Required: All fields are required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
  }
//   _addEventsTodB () async {
//   int?  value =  await _eventController.addEvent(
//    event: Event(
//       title:_titleController.text,
//       note:_noteController.text,
//
//    isCompleted:0,
//    date :DateFormat.yMd().format(_selectedDate),
//    startTime:_startTime,
//    endTime:_endTime ,
//    color:_selectedcolor,
//   remind :_selectedRemind,
//   repeat : _selectedRepeat,
//
//         ));
//   print("My id is "+"$value");
// }




class appar extends StatelessWidget {
  const appar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: AppConsts.appDeepOrange,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "événements",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppConsts.appDeepOrange),
            ),
          ),
        ],
      ),
    );
  }
}
