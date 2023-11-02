import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gumsmile_dental_care/view/screen/loginscreen.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/login_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Login UI TESTING', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => LoginProvider(),
        child: const ScreenLogin(),
      ),
    ));

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register now'), findsOneWidget);
    expect(find.text('Dont have any account?'), findsOneWidget);
  });
}
