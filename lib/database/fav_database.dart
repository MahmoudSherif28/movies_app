// import 'package:movies/database/fav_database_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// const String tableMovies = 'tableMovies';
// const String columnGeneralId = 'generalId';
// const String columnTitle = 'title';
// const String columnImage = 'image';
// const String columnBigImage = 'big_image';
// const String columnRating = 'rating';
// const String columnYear = 'year';
// const String columnId = 'id';
//
// class SQLProvider {
//   late Database db;
//   static final SQLProvider instance = SQLProvider._internal();
//   factory SQLProvider() {
//     return instance;
//   }
//   SQLProvider._internal();
//
//   Future open() async {
//     db = await openDatabase(join(await getDatabasesPath(), 'first.db'),
//         version: 1, onCreate: (Database db, int version) async {
//           await db.execute('''
// create table $tableMovies (
//   $columnGeneralId integer primary key autoincrement,
//   $columnTitle text not null,
//   $columnImage text not null,
//   $columnBigImage text not null,
//   $columnId text not null,
//   $columnYear integer not null,
//   $columnRating text not null)
// ''');
//         });
//   }
//
//   Future<List<SQLModel>> getAllMovies() async {
//     List<Map<String , dynamic >> movieMap = await db.query(tableMovies);
//     if (movieMap.isEmpty) {
//       return [];
//     }else {
//       List<SQLModel> allMovies = [];
//       for ( var element in movieMap){
//         allMovies.add(SQLModel.fromMap(element));
//       }
//       return allMovies;
//     }
//   }
//
//   Future<SQLModel> insert(SQLModel sqlModel) async {
//     sqlModel.generalId = await db.insert(tableMovies, sqlModel.toMap());
//     return sqlModel;
//   }
//
//   Future<int> delete(int generalID) async {
//     return await db.delete(tableMovies, where: '$columnGeneralId = ?', whereArgs: [generalID]);
//   }
//
//   Future<int> update(SQLModel sqlModel) async {
//     return await db.update(tableMovies, sqlModel.toMap(),
//         where: '$columnGeneralId = ?', whereArgs: [sqlModel.id]);
//   }
//
//   Future close() async => db.close();
//
// }
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDb {
  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await init();
      return _database;
    } else {
      return _database;
    }
  }

  init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'movies.db');
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: onCreate,
    );
    return database;
  }

  onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE 'favourites' (id TEXT , title TEXT , image TEXT)");
  }

  Future<List<Map>> getData() async {
    Database? myDatabase = await database;
    List<Map<String, dynamic>> response =
        await myDatabase!.rawQuery("SELECT * FROM 'favourites'");
    return response;
  }

  Future<void> insertData({
    required String id,
    required String title,
    required String image,
  }) async {
    Database? myDatabase = await database;
    await myDatabase!.rawInsert(
        "INSERT INTO 'favourites' ('id' ,'title', 'image') VALUES( '$id' , '$title' , '$image')");
  }

  Future<int> deleteData({
    required String id,
  }) async {
    Database? myDatabase = await database;
    int bookId = await myDatabase!
        .rawDelete("DELETE FROM 'favourites' WHERE id = ?", [id]);
    return bookId;
  }
}
