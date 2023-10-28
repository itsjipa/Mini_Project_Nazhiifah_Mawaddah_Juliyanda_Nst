import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gumsmile_dental_care/const/constant.dart';
import 'package:gumsmile_dental_care/model/provider/login_provider.dart';
import 'package:gumsmile_dental_care/model/provider/navbar_provider.dart';
import 'package:gumsmile_dental_care/model/provider/message_provider.dart';
import 'package:gumsmile_dental_care/model/provider/register_provider.dart';
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
          create: (_) => MessageProvider(),
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
                borderRadius: BorderRadius.circular(20.0,),
              ),
              backgroundColor: Constant().colorButton,
            )
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: AuthLogin(),
      ),
    );
  }
}
