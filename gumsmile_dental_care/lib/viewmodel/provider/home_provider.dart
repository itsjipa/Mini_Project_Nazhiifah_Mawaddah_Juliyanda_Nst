import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/method_provider.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController editingController = TextEditingController();
  final image = [
    'assets/slider/img2.jpeg',
    'assets/slider/img3.jpeg',
    'assets/slider/img4.jpeg',
  ];

  String? username;

  void setName(String uid) {
    Methods().getUsername(uid).then((value) {
      username = value;
      notifyListeners();
    });
  }
}
