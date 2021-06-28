import "dart:io" as io;
import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class SqliteDB {
  static final SqliteDB _instance = new SqliteDB.internal();

  factory SqliteDB() => _instance;
  static late Database _db;

  Future<Database> get db async {
    // ignore: unnecessary_null_comparison
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  SqliteDB.internal();

  /// Initialize DB
  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "myDatabase.db");
    var taskDb = await openDatabase(path, version: 1);
    return taskDb;
  }

  Future countTable() async {
    var dbClient = await db;
    var res = await dbClient.rawQuery("""SELECT count(*) as count FROM NoteBook
         """);
    return res[0]['count'];
  }
}

















// import 'package:moor/moor_web.dart';
// import 'package:moor/moor.dart';
// import 'database.dart';
//
// part 'app_database.g.dart';
//
// @UseMoor(
//     tables: [Blogs, Projects, Profiles],
//     daos: [BlogDao, ProjectDao, ProfileDao])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase() : super(WebDatabase('db'));
//
//   static AppDatabase _instance;
//
//   static AppDatabase instance() {
//     if (_instance == null) {
//       _instance = AppDatabase();
//     }
//     return _instance;
//   }
//
//   @override
//   int get schemaVersion => 1;
//
//   @override
//   MigrationStrategy get migration {
//     return MigrationStrategy(beforeOpen: (OpeningDetails details) async {
//       await into(profiles).insert(Profile(
//           id: AppDefautls.uid,
//           name: AppDefautls.name,
//           email: AppDefautls.email,
//           description: AppDefautls.description,
//           urls: AppDefautls.urls.toString(),
//           isDefault: 1,
//           image: "",
//           createTime: DateTime.now()));
//       AppDefautls.blogs.forEach((element) async {
//         await into(blogs).insert(element);
//       });
//       AppDefautls.projects.forEach((element) async {
//         await into(projects).insert(element);
//       });
//     });
//   }
// }
