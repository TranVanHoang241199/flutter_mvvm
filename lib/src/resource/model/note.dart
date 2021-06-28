class Note {
  final String noteID;
  final String title;
  String? nameContent;
  String? content;
  final DateTime date;
  final int update;
  final String? status;

  Note(
      {required this.noteID,
      required this.title,
      this.nameContent,
      this.content,
      required this.date,
      required this.update,
      required this.status});

  factory Note.fromMap(Map<String, dynamic> note) => new Note(
      noteID: note['noteID'],
      title: note['note title'],
      nameContent: note['name Conten'],
      content: note['content'],
      date: note['date Time'],
      update: note['munber update'],
      status: note['status Note']);

  Map<String, dynamic> toMap() {
    return {
      'noteID': noteID,
      'note title ': title,
      'name Conten': nameContent,
      'content': content,
      'date Time': date,
      'munber update': update,
      'status Note': status
    };
  }
}
