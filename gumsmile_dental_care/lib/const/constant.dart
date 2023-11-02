import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constant {
  final List<Map<String, String>> data = [
    {
      'name': 'Drg. Jessie Ramsley',
      'workHours': '09:00am - 15:00pm',
      'workDays': 'Monday, Thursday, Friday',
      'picture': 'assets/dokter/doctorimg1.jpeg'
    },
    {
      'name': 'Drg. Thalia Smith',
      'workHours': '09:00am - 13:15pm',
      'workDays': 'Tuesday, Wednesday, Saturday',
      'picture': 'assets/dokter/doctorimg2.jpeg'
    },
    {
      'name': 'Drg. Zoe Adam',
      'workHours': '15:15am - 20:00pm',
      'workDays': 'Thursday, Saturday',
      'picture': 'assets/dokter/doctorimg3.jpeg'
    },
    {
      "name": "Drg. Josh Alexander",
      "workHours": "14:15pm - 19:05pm",
      "workDays": "Monday, Wednesday, Friday",
      "picture": "assets/dokter/doctorimg4.jpeg",
    },
    {
      "name": "Drg. Xavierra Ailen",
      "workHours": "09:00am - 13:15pm",
      "workDays": "Tuesday, Friday, Saturday",
      "picture": "assets/dokter/doctorimg5.jpeg",
    },
    {
      "name": "Drg. Zein Aldebaran",
      "workHours": "17:45pm - 20:00pm",
      "workDays": "Wednesday, Friday",
      "picture": "assets/dokter/doctorimg6.jpeg",
    },
    {
      "name": "Drg. Maria Sylvie",
      "workHours": "19:45pm - 21:00pm",
      "workDays": "Wednesday, Thursday, Friday",
      "picture": "assets/dokter/doctorimg7.jpeg",
    },
    {
      "name": "Drg. Lucas Leonidas",
      "workHours": "19:40pm - 21:00pm",
      "workDays": "Wednesday, Thursday, Friday",
      "picture": "assets/dokter/doctorimg8.jpeg",
    },
  ];
  Color colorBar = const Color.fromRGBO(210, 227, 200, 1);
  Color colorButton = const Color.fromRGBO(178, 200, 186, 1);
  Color itemSelect = const Color.fromRGBO(178, 200, 186, 1);
  Color colorPage = const Color.fromRGBO(235, 243, 232, 1);
  Color colorIcon = const Color.fromRGBO(134, 167, 137, 1);

  TextStyle textAppBar = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.5,
  );
  TextStyle text = GoogleFonts.inriaSans(
    color: Colors.black,
    fontSize: 12.0,
  );
  TextStyle textFeature = GoogleFonts.quicksand(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
  );
  TextStyle textHeading = GoogleFonts.rubik(
    color: const Color.fromRGBO(115, 120, 100, 1),
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
  );
  TextStyle textButton = GoogleFonts.lexendDeca(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: Colors.black,
  );
}
