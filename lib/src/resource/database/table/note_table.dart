import '../app_database.dart';

// noteID: note['noteID'],
//       title: note['note title'],
//       nameContent: note['name Conten'],
//       content: note['content'],
//       date: note['date Time'],
//       update: note['munber update'],
//       status: note['status Note']);
class NoteTable {
  Future createUserTable() async {
    var dbClient = await SqliteDB().db;
    var res = await dbClient.execute("""
      CREATE TABLE Note(
        noteID TEXT PRIMARY KEY,
        title TEXT,
        nameContent TEXT,
        content TEXT,
        date TEXT,
        update TEXT,
        status INTEGER
      )""");
    return res;
  }
}
