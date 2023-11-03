import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/appointment_model.dart';

class PastProvider extends ChangeNotifier {
  final AppointmentModel data = AppointmentModel(
      doctorName: "Drg. Lucas Leonidas",
      picture: "assets/dokter/doctorimg8.jpeg",
      treatmentType: "Orthodentist",
      date: "2023-10-18",
      time: "7:30 PM");
}
