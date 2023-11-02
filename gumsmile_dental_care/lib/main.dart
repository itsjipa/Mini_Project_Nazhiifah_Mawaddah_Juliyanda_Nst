import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/book_apointment_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/home_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/listappointment_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/login_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/navbar_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/doctor_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/openai_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/past_provider.dart';
import 'package:gumsmile_dental_care/viewmodel/provider/register_provider.dart';
import 'package:gumsmile_dental_care/view/widgets/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          create: (_) => DoctorProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavbarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OpenAIProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BookAppointmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListAppointmentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PastProvider(),
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
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ),
              backgroundColor: Constant().colorButton,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Constant().colorButton,
            elevation: 5.0,
            highlightElevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30.0,
              ),
            ),
            foregroundColor: Colors.black,
          ),
          cardTheme: CardTheme(
            color: Constant().colorButton.withOpacity(
                  0.5,
                ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4.0,
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shadowColor: Colors.black12,
            elevation: 3.0,
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthLogin(),
      ),
    );
  }
}
