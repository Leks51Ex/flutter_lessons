import 'package:drift/drift.dart';
import 'package:flutter_stepik/shared_preferences/drift/database/database.dart';

class DriftDatabaseTest{

  final AppDatabase database;

  DriftDatabaseTest({required this.database});

  //Add data
  Future<void> insert()async{
    await database.into(database.users).insert(UsersCompanion(
      name: const Value('Василий'),
      email: Value('vasily@example.com'),
      age: Value(30),
    ));
  }
  
  // get data
  Future<void>getAll()async{
        final users = await database.select(database.users).get();
        for (var user in users) {
          print(user);
        }
  }


  Future<void> getFirst()async{
    final user = await (database.select(database.users)..where((u)=>u.id.equals(1))).getSingle();
    print(user);
  }

  //update data

  Future<void>updateNameForFirst()async{
    await (database.update(database.users)..where((u)=> u.id.equals(1))).write(
      UsersCompanion(
        name: Value('Михаил'),
      ),
    );
  }
  
  Future<void>replaceAllForFirst()async{
    final newUser = User(id: 1, email: 'Michail@mail.ru', age: 49, createdAt: DateTime.now());

    await database.update(database.users).replace(newUser);
  }

  //delete data

  Future<void>deleteUser()async{
           await (database.delete(database.users)..where((u) => u.id.equals(1))).go();
  }
 

}


void main(List<String> args)async {
  AppDatabase db = AppDatabase();
  DriftDatabaseTest databaseTest = DriftDatabaseTest(database: db);
  await databaseTest.insert();
}