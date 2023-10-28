import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/view/screen/message_screen.dart';

class NavbarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final screen = [
      MessageScreen(),
      Container(),
      Container(),
    ];

  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
