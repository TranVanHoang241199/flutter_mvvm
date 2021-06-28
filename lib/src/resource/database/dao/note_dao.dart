// import '../app_database.dart';

// class NoteDAO {
//   late String noteID;
//   late String title;
//   late String nameContent;
//   late String content;
//   late DateTime date;
//   late int update;
//   late String? status;

//   /// Add user to the table // thêm người dùng vào bản
//   Future putUser() async {
//     /// User data
//     dynamic note = {
//       "noteID": noteID,
//       "title": title,
//       "nameContent": nameContent,
//       "content":content,
//       "date": date,
//       "update": update,
//       "status": status,
//     };

//     /// Adds user to table // thêm người dùng vào bản
//     final dbClient = await SqliteDB().db;
//     int res = await dbClient.insert("Note", note);
//     return res;
//   }
// }
