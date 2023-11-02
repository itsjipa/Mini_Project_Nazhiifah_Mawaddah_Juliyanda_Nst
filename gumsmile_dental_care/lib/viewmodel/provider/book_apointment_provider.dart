import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/doctor_model.dart';
import 'package:gumsmile_dental_care/model/treatment_model.dart';
import 'package:intl/intl.dart';

class BookAppointmentProvider extends ChangeNotifier {
  TimeOfDay _selectedTime = TimeOfDay.now();
  DoctorModel? doctor;
  TreatmentType? _selectTreatment;
  String? _selectDate;

  TimeOfDay time = TimeOfDay.now();
  final DateTime _focusDay = DateTime.now();

  List<TreatmentType> data = [
    TreatmentType(
      name: "Consultation",
      price: 25000,
    ),
    TreatmentType(
      name: "Toothache",
      price: 100000,
    ),
    TreatmentType(
      name: "Orthodontics",
      price: 3500000,
    ),
    TreatmentType(
      name: "Prophylaxis",
      price: 150000,
    ),
    TreatmentType(
      name: "Whitening",
      price: 1000000,
    ),
    TreatmentType(
      name: "Hyaluronic Fillers",
      price: 800000,
    ),
  ];

  final formatCurrency = NumberFormat.currency(
    locale: 'id_ID',
    symbol: '',
    decimalDigits: 0,
  );

  TimeOfDay get selectedTime => _selectedTime;
  TreatmentType? get selectedTreatment => _selectTreatment;
  String? get selectDate => _selectDate;
  DateTime get focusDay => _focusDay;

  bool isWorkDay(DateTime selectDay, DoctorModel doctorModel) {
    final Map<int, String> dayMappings = {
      DateTime.monday: 'Monday',
      DateTime.tuesday: 'Tuesday',
      DateTime.wednesday: 'Wednesday',
      DateTime.thursday: 'Thursday',
      DateTime.friday: 'Friday',
      DateTime.saturday: 'Saturday',
      DateTime.sunday: 'Sunday',
    };
    final selectDayName = dayMappings[selectDay.weekday];
    debugPrint('${doctorModel.workDays.contains(selectDayName)}');
    return doctorModel.workDays.contains(selectDayName);
  }

  bool isDateSelectable(DateTime date) {
    if (_selectDate == null) {
      return false;
    }

    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(date);

    if (_selectDate == formattedDate) {
    return true;
  }

  return false;
  }

  DateTime get selectedDateAsDateTime {
    if (_selectDate != null) {
      return DateTime.parse(_selectDate!);
    } else {
      return DateTime.now(); 
    }
  }

  void updateSelectDate(DateTime selectedDate) {
    final formatter = DateFormat('yyyy-MM-dd');
    _selectDate = formatter.format(selectedDate);
    debugPrint('$_selectDate');
    notifyListeners();
  }

  void updateSelectTime(TimeOfDay newTime) {
    _selectedTime = newTime;
    notifyListeners();
  }

  bool isTimeWithinWorkHours(
      TimeOfDay selectedTime, List<WorkHours> workHours) {
    for (var hour in workHours) {
      final start = hour.start;
      final end = hour.end;

      final selectedDateTime = DateTime(
        selectedTime.hour,
        selectedTime.minute,
      );

      final startDateTime = DateTime(
        start.hour,
        start.minute,
      );

      final endDateTime = DateTime(
        end.hour,
        end.minute,
      );

      if (selectedDateTime.isAfter(startDateTime) &&
          selectedDateTime.isBefore(endDateTime)) {
        return true;
      }
    }

    return false;
  }

  void selectTreatment(TreatmentType? newTreatment) {
    _selectTreatment = newTreatment;
    notifyListeners();
  }
}
