import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqfliteTest {
  late final Database _db;

  SqfliteTest() {
    _init();
  }

  Future<void> _init() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    _db = await databaseFactory.openDatabase('app_database.db');

    await _db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        age INTEGER
      );
    ''');
  }

  Future<void> addUser() async {
    final db = await openDatabase('app_database.db');
    await db.insert('users', {
      'name': 'Елена',
      'email': 'elena@gmail.com',
      'age': 25,
    });
  }

  Future<void> addNewUser() async {
    final db = await openDatabase('app_database.db');
    await db.insert('users', {
      'name': 'Kanye',
      'email': '@gmail.com',
      'age': 26,
    });
  }

  Future<void> getUsers() async {
    final db = await openDatabase('app_database.db');
    final userResults = await db.query('users', columns: ['id', 'name']);
    print(userResults);
  }

  Future<void> updateUsers() async {
    final db = await openDatabase('app_database.db');
    await db.update(
      'users',
      {'name': 'ueban'},
      where: 'name = ?',
      whereArgs: ['Елена'],
    );
  }

  Future<void> deleteUsers(int id) async {
    final db = await openDatabase('app_database.db');
    db.delete('users', where: 'id=?', whereArgs: [id]);
  }
}
