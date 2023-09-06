class TaskModel {
  static const String collectionName = 'tasks';
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;
  bool? isDone;

  TaskModel({
    this.id,
    this.title,
    this.description,
    this.dateTime,
    this.isDone,
  });

  TaskModel.fromfireStore(Map<String, dynamic> json)
      : this(
          id: json['id'],
          title: json['title'],
          description: json['description'],
          dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime']),
          isDone: json['isDone'],
        );

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'isDone': isDone,
    };
//
  }
}
