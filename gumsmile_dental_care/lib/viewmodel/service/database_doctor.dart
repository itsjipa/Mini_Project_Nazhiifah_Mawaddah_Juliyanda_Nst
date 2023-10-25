import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/doctor_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseDoctor {
  late Database _database;

  final String tableName = 'doctor';

  Future initializeDatabase() async {
    final path = join(await getDatabasesPath(), 'doctors.db');
    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        name TEXT,
        workHours TEXT,
        workDays TEXT,
        picture TEXT
        )
        ''');

      db.execute('''
UPDATE $tableName
SET workHours = strftime('%H:%M', workHours_start) || ' - ' || strftime('%H:%M', workHours_end)
''');
    });
  }

  Future<void> insertDoctor(DoctorModel doctorModel) async {
    try {
      await initializeDatabase();
    } catch (e) {
      debugPrint('Error : $e');
    }
    await _database.insert(
      tableName,
      doctorModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<DoctorModel>> getDoctors() async {
    try {
      await initializeDatabase();
    } catch (e) {
      debugPrint('Error : $e');
    }
    final List<Map<String, dynamic>> maps = await _database.query(tableName);
    return List.generate(maps.length, (i) {
      return DoctorModel.fromMap(maps[i]);
    });
  }
}
