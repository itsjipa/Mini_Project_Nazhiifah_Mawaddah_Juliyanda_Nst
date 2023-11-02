import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gumsmile_dental_care/view/screen/message_screen.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/doctor_provider.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Message Ui Testing', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => DoctorProvider(),
        child: const MessageScreen(),
      ),
    ));

    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Search'), findsOneWidget);
    expect(find.text('Active Now'), findsOneWidget);
  });
}
