class NoteBook {
  final String noteBookID;
  final String noteID;
  final String title;
  final String color;

  NoteBook(
      {required this.noteBookID,
      required this.noteID,
      required this.title,
      required this.color});

  factory NoteBook.fromMap(Map<String, dynamic> noteBook) => new NoteBook(
      noteBookID: noteBook['noteBookID'],
      noteID: noteBook['noteID'],
      title: noteBook['title NoteBook'],
      color: noteBook['color book']);

  Map<String, dynamic> toMap() {
    return {
      'noteBookID': noteBookID,
      'noteID': noteID,
      'title NoteBook': title,
      'color book': color,
    };
  }
}
