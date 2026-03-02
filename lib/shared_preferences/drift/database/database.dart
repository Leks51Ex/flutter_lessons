////
//// run `dart run build_runner build --delete-conflicting-outputs` to build
////

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter_stepik/shared_preferences/drift/tables/user_table.dart';
part 'database.g.dart';

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; 
	
  ///Открытие соединения с базой данных  
  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_database'); 
  }

  @override
MigrationStrategy get migration => MigrationStrategy(
  onCreate: (Migrator m) async {
    await m.createAll();
  },
);
}