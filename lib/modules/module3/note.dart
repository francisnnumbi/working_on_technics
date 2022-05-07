import 'dart:convert';

class Note {
  String title;
  String description;
  int priority;
  DateTime date;

  Note(
      {required this.title,
      required this.description,
      required this.date,
      this.priority = 0});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'priority': priority,
      'date': date.toString(),
    };
  }

  String readPriority() {
    switch (priority) {
      case 0:
        return 'Very High';
      case 1:
        return 'High';
      case 2:
        return 'Medium';
      case 3:
        return 'Low';
      default:
        return 'Low';
    }
  }

  static Note fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'],
      description: map['description'],
      priority: map['priority'],
      date: DateTime.parse(map['date']),
    );
  }

  static List<Note> fromMapList(List<dynamic> mapList) {
    return mapList.map((map) => Note.fromMap(jsonDecode(map))).toList();
  }

  @override
  String toString() {
    return 'Note{title: $title, description: $description, priority: $priority, date: ${date.toString()}}';
  }
}
