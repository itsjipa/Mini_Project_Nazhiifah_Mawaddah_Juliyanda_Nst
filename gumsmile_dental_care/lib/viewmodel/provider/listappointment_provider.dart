import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/appointment_model.dart';
import 'package:gumsmile_dental_care/service/database_apointment.dart';

class ListAppointmentsProvider extends ChangeNotifier {
  List<Appointment> _appointment = [];
  DateTime selectedTime = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DatabaseAppointment databaseAppointment = DatabaseAppointment();

  List<Appointment> get appointment => _appointment;

  void addAppointment(Appointment appointment) {
    _appointment.add(appointment);
    notifyListeners();
  }

  void removeAppointment(Appointment appointment) {
    _appointment.remove(appointment);
  }

  Future<void> fetchDataAppointments() async {
    try {
      final appointments = await databaseAppointment.getAppointment();
      _appointment = appointments;
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> showTimePickerDialog(BuildContext context) async {
    TimeOfDay? selectedTimeOfDay = TimeOfDay.fromDateTime(selectedTime);

    selectedTimeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfDay,
    );

    if (selectedTimeOfDay != null) {
      selectedTime = DateTime(
        selectedTime.year,
        selectedTime.month,
        selectedTime.day,
        selectedTimeOfDay.hour,
        selectedTimeOfDay.minute,
      );
      notifyListeners();
    }
  }
}
