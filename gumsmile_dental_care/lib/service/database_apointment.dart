import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/appointment_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseAppointment {
  late Database _database;

  final String tableName = 'appointment';
  Future<Database> initializeDatabase() async {
    final path = await getDatabasesPath();
    final database = await openDatabase(
      join(path, 'appointment_db.db'),
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            doctorName TEXT,
            picture TEXT,
            treatmentType TEXT,
            date TEXT,
            time TEXT
          )
        ''');
      },
      version: 1,
    );
    _database = database;
    return database;
  }

  Future<void> insertAppointment(Appointment appointment) async {
    try {
      await initializeDatabase();
    } catch (e) {
      debugPrint('$e');
    }

    final appointMap = appointment.toMap();
    debugPrint('inserting : $appointMap');

    _database.insert(
      tableName,
      appointMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Appointment>> getAppointment() async {
    try {
      await initializeDatabase();
    } catch (e) {
      debugPrint('$e');
    }
    final List<Map<String, dynamic>> maps = await _database.query(tableName);
    return List.generate(maps.length, (index) {
      return Appointment.fromMap(maps[index]);
    });
  }

  Future<bool> updateAppointment(String doctorName, String updateDoctorName,
      Appointment newAppointment) async {
    try {
      await initializeDatabase();
      final result = await _database.update(
        tableName,
        newAppointment.toMap(),
        where: 'doctorName = ?',
        whereArgs: [doctorName],
      );

      if (result > 0) {
        await _database.update(
          tableName,
          {'doctorName': updateDoctorName},
          where: 'doctorName = ?',
          whereArgs: [doctorName],
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<void> deleteAppointmentByDoctorName(String doctorName) async {
    try {
      await initializeDatabase();
      await _database.delete(
        tableName,
        where: 'doctorName = ?',
        whereArgs: [doctorName],
      );
    } catch (e) {
      rethrow;
    }
  }
}
