import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/doctor_model.dart';
import 'package:gumsmile_dental_care/service/database_doctor.dart';

class DoctorProvider extends ChangeNotifier {
  List<DoctorModel> doctors = [];
  DoctorModel? selectedDoctor;
   

  List<DoctorModel> filteredDoctors = [];
  String searchQuery = '';

  final DatabaseDoctor _databaseDoctor = DatabaseDoctor();

  Future addDoctor(DoctorModel doctorModel) async {
    doctors.add(doctorModel);
    notifyListeners();
  }

  Future insertDataIntoLocal(List<Map<String, String>> data) async {
    try {
      doctors.clear();
      for (final item in data) {
        // mengolah data workDays
        final List<String> workDays =
            item['workDays']!.split(', ').map((e) => e.trim()).toList();

        final workHoursString = item['workHours']!.split(' - ');

        // membagi data yang ada di workhoursstring dengan -
        final List<String> parts = workHoursString;

        // menghilangkan tanda am atau pm untuk memproses waktu dari format 12 menjadi 24
        String startTime = parts[0].replaceAll(RegExp('[aApP][mM]'), '').trim();

        String endTime = parts[1].replaceAll(RegExp('[aApP][mM]'), '').trim();

        // melakukan format yang berisis dua angka int dari starttime
        final List<int> startList =
            startTime.split(':').map(int.parse).toList();

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
        // await _databaseDoctor.insertDoctor(doctor);
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Error insering : $e');
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
      if (now.hour >= hours.start.hour &&
          now.minute >= hours.start.minute &&
          now.hour < hours.end.hour) {
        return true;
      }
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

  void sortDoctorOnlineStatus(DateTime now) {
    doctors.sort((x, y) {
      final isOnlineX = isDoctorOnline(x, now);
      final isOnlineY = isDoctorOnline(y, now);

      if (isOnlineX && !isOnlineY) {
        return -1;
      } else if (!isOnlineX && isOnlineY) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  void selectDoctor(doctor) {
    selectedDoctor = doctor;
    notifyListeners();
  }

  List<DoctorModel> filterDoctors(String query) {
    searchQuery = query;
    return doctors
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Future<void> _selectTime(
  //     BuildContext context, TimeOfDay startTime, TimeOfDay endTime) async {
  //   final TimeOfDay? selectedTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //     builder: (BuildContext context, Widget? child) {
  //       return MediaQuery(
  //         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
  //         child: child!,
  //       );
  //     },
  //   );
  //   if (selectedTime != null) {
  //     if (selectedTime.isAfter(startTime) && selectedTime.isBefore(endTime)) {
  //       // Waktu yang dipilih valid dalam rentang jam kerja dokter.
  //       print('Waktu yang dipilih: $selectedTime');
  //       // Lakukan sesuatu dengan waktu yang dipilih, seperti membuat janji temu.
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Waktu yang dipilih bukan dalam jam kerja dokter.'),
  //         ),
  //       );
  //     }
  //   }
}
