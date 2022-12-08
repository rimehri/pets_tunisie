class Event{
  
  int? id ; 
  String? title;
  String? note ;
  String? date ;
  int? isCompleted; 

  String? startTime; 
  String? endTime ;
  int? color;
  int? remind ;
  String? repeat ;

  Event({
      this.id ,  required this.title,required this.note, required this.date, required this.isCompleted,
    required   this.startTime, required this.endTime, required  this.color,required this.remind,required this.repeat,} );

  @override
  String toString() {
    return 'Task{id: $id, title: $title, note: $note, isCompleted: $isCompleted, date: $date, startTime: $startTime, endTime: $endTime, color: $color, remind: $remind, repeat: $repeat}';
  }
  Map<String,dynamic> toJson(){
    final Map <String,dynamic>  data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;

    data['note'] = this.note;
    data['date'] = this.date;
    data['isCompleted'] = this.isCompleted;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    return data;
  }
  Event.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];

    note = json['note'];
    date = json['date'];
    isCompleted = json['isCompleted'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];


  }
}