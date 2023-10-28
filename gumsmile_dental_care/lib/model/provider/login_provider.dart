import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/model/provider/method_provider.dart';

class LoginProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  get formKey => _formKey;

  Future<bool> checkLogin(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      _isLoading = true;
      notifyListeners();

      try {
        final user = await Methods().logIn(email, password);
        _isLoading = false;
        notifyListeners();

        return user != null;
      } catch (e) {
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } else {
      return false;
    }
  }

  String? validatorPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please input your password";
    } else if (value.length < 8) {
      return "Enter min. 8 characters";
    }
    return null;
  }

  String? validatorEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email address";
    } else if (!value.contains("@") || !value.contains(".")) {
      return "Please enter a valid email address";
    }
    return null;
  }
}
