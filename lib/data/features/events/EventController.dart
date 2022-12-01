


import 'package:get/get.dart';
import '../../db_helper.dart';


import '../../model/Event.dart';
class EventController extends GetxController {
@override
  void onReady(){

  super.onReady();
}
var eventList = <Event> [].obs;
Future <int >   addEvent({Event? event}) async {
  return await  DbHelper.insert(event!) ;

}
void getEvent() async {
  List<Map<String,dynamic>>? events = await DbHelper.query();
  eventList.assignAll(events!.map((data ) => new Event.fromJson(data)).toList());
}
void delete(Event event ){
  DbHelper.delete(event);


}
}
