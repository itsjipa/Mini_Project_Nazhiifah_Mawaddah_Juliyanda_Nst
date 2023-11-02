import 'package:flutter/material.dart';

class DoctorModel {
  final int? id;
  final String name;
  final List<WorkHours> workHours;
  final List<String> workDays;
  final String picture;

  DoctorModel({
    this.id,
    required this.name,
    required this.workHours,
    required this.workDays,
    required this.picture,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'workHours': List<dynamic>.from(
        workHours
            .map(
              (e) => e.toMap(),
            )
            .toList(),
      ),
      'workDays': workDays.join(', '),
      'picture': picture,
    };
  }

  factory DoctorModel.fromMap(Map<String, dynamic> map) {
    return DoctorModel(
      id: map['id'],
      name: map['name'],
      workHours:
      // List<WorkHours>.from(
        (map['workHours'] is List) ? (map['workHours'] as List).map(
          (x) => WorkHours.fromMap(x),
        // ),
      ).toList() : [],
      workDays: (map['workDays'] is String) ? (map['workDays'] as String).split(', ').map((e) => e.trim()).toList() : (map['workDays'] as List).cast<String>(),
      // List<String>.from(
      //   map['workDays'],
      // ),
      picture: map['picture'],
    );
  }
}

class WorkHours {
  final TimeOfDay start;
  final TimeOfDay end;

  WorkHours({
    required this.start,
    required this.end,
  });

  @override
  String toString() {
    return '${start.hour}:${start.minute} - ${end.hour}:${end.minute}';
  }

  static WorkHours fromString(String workHoursString) {
    final parts = workHoursString.split(' - ');
    final start = TimeOfDay.fromDateTime(
      DateTime.parse(
        parts[0],
      ),
    );
    final end = TimeOfDay.fromDateTime(
      DateTime.parse(
        parts[1],
      ),
    );
    return WorkHours(start: start, end: end);
  }

  Map<String, dynamic> toMap() {
    return {
      'start': '${start.hour} : ${start.minute}',
      'end': '${end.hour} : ${end.minute}',
    };
  }

  factory WorkHours.fromMap(Map<String, dynamic> map) {
    final String startString = map['start'];
    final String endString = map['end'];
    final WorkHours workHours = WorkHours(
      start: TimeOfDay(
        hour: int.parse(
          startString.split(':')[0],
        ),
        minute: int.parse(
          startString.split(':')[1],
        ),
      ),
      end: TimeOfDay(
        hour: int.parse(
          endString.split(':')[0],
        ),
        minute: int.parse(
          endString.split(':')[1],
        ),
      ),
    );
    return workHours;
  }
}
