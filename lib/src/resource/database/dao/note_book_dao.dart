// import '../app_database.dart';

// class NoteBook {
//   late String noteBookID;
//   late String noteID;
//   late String title;
//   late String color;

//   /// Add user to the table
//   Future putNoteBook() async {
//     /// User data
//     dynamic notebook = {
//       "noteBookID": noteBookID,
//       "noteID": noteID,
//       "note": title,
//       "color": color,
//     };

//     /// Adds user to table
//     final dbClient = await SqliteDB().db;
//     int res = await dbClient.insert("Notebook", notebook);
//     return res;
//   }
// }
