class TodoModel {
  TodoModel({

    required this.title,
    required  this.completed,});

  TodoModel.fromJson(dynamic json) {
    title = json['title'];
    completed = json['completed'];
  }

 late String title;
 late bool completed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['completed'] = completed;
    return map;
  }

}