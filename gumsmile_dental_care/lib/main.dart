import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/model/provider/navbar_provider.dart';
import 'package:gumsmile_dental_care/model/provider/message_provider.dart';
import 'package:gumsmile_dental_care/view/widgets/navbar_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MessageProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavbarProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Constant().colorBar,
            centerTitle: true,
            foregroundColor: Colors.white,
            titleSpacing: 1.5,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Constant().colorBar,
              selectedItemColor: Constant().itemSelect,
              unselectedItemColor: Colors.black54,
              ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: NavigationBarWidget(),
      ),
    );
  }
}
