import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Dashboard Pages/dashboard_admin.dart';
import 'Dashboard Pages/dashboard_general.dart';
import 'Registration Pages/authchecker.dart';
import 'Registration Pages/login_page.dart';
import 'package:device_preview/device_preview.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => MyApp(),
  // ));

  runApp(MyApp());

}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Derm Hub',

      theme: ThemeData(
        colorSchemeSeed: const Color(0xE6CBA2),
        textTheme: GoogleFonts.plusJakartaSansTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      home: AuthChecker(),
      routes: {
        '/login': (context) => LoginPage(),
        '/adminDashboard': (context) => DashboardDoctorPage(),
        '/generalDashboard': (context) => DashboardGenPage(),
      },
    );
  }
}

