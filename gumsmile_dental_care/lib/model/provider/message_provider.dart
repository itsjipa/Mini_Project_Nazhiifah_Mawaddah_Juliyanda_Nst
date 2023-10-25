import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/doctor_model.dart';
import 'package:gumsmile_dental_care/viewmodel/service/database_doctor.dart';

class MessageProvider extends ChangeNotifier {
  List<DoctorModel> doctors = [];

  final DatabaseDoctor _databaseDoctor = DatabaseDoctor();

  Future addDoctor(DoctorModel doctorModel) async {
    doctors.add(doctorModel);
    notifyListeners();
    await _databaseDoctor.insertDoctor(doctorModel);
  }

  Future insertDataIntoLocal(List<Map<String, String>> data) async {
    for (final item in data) {

      // mengolah data workDays
      final List<String> workDays =
          item['workDays']!.split(', ').map((e) => e.trim()).toList();

      final workHoursString = item['workHours']!;

      // membagi data yang ada di workhoursstring dengan -
      final List<String> parts = workHoursString.split(' - ');

      // menghilangkan tanda am atau pm untuk memproses waktu dari format 12 menjadi 24
      String startTime = parts[0].replaceAll(RegExp('[aApP][mM]'), '');

      String endTime = parts[1].replaceAll(RegExp('[aApP][mM]'), '');

      // melakukan format yang berisis dua angka int dari starttime
      final List<int> startList = startTime.split(':').map(int.parse).toList();

      final List<int> endList = endTime.split(':').map(int.parse).toList();

      final TimeOfDay start =
          TimeOfDay(hour: startList[0], minute: startList[1]);

      final TimeOfDay end = TimeOfDay(
        hour: endList[0],
        minute: endList[1],
      );

      final WorkHours workHours = WorkHours(start: start, end: end);

      final doctor = DoctorModel(
        name: item['name'] ?? '',
        workHours: [workHours],
        workDays: workDays,
        picture: item['picture'] ?? '',
      );
      addDoctor(doctor);
    }
  }

  Future fetchDoctorFromLocal() async {
    doctors = await _databaseDoctor.getDoctors();
    notifyListeners();
  }

  bool isDoctorOnline(DoctorModel doctorModel, DateTime now) {
    final workHours = doctorModel.workHours;
    final workDays = doctorModel.workDays;

    // meriksa apakah hari ini hari kerja
    if (!workDays.contains(getDay(now))) {
      return false;
    }

    for (var hours in workHours) {
      if (
          now.hour >= hours.start.hour && now.minute >= hours.start.minute && 
          now.hour < hours.end.hour) {
        return true;
      }
      notifyListeners();
    }
    return false;
  }

  String getDay(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      case DateTime.sunday:
        return 'Sunday';
      default:
        return '';
    }
  }
}
