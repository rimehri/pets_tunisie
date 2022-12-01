class Event{
  
  int? id ; 
  String? title;
  String? note ; 
  int? isCompleted; 
  String? date ; 
  String? startTime; 
  String? endTime ;
  int? color;
  int? remind ;
  String? repeat ;

  Event({
      this.id ,  required this.title,required this.note, required this.isCompleted, required this.date,
    required   this.startTime, required this.endTime, required  this.color,required this.remind,required this.repeat,} );

  @override
  String toString() {
    return 'Task{id: $id, title: $title, note: $note, isCompleted: $isCompleted, date: $date, startTime: $startTime, endTime: $endTime, color: $color, remind: $remind, repeat: $repeat}';
  }
  Map<String,dynamic> toJson(){
    final Map <String,dynamic>  data = new Map<String,dynamic>();
    data['id'] = this.id;
    data['title'] = this.id;
    data['date'] = this.id;
    data['note'] = this.id;
    data['isCompleted'] = this.id;
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
    date = json['date'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
    remind = json['remind'];
    repeat = json['repeat'];


  }
}