import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../Dashboard Pages/dashboard_admin.dart';
import '../Dashboard Pages/dashboard_general.dart';
import 'login_page.dart';

class AuthChecker extends StatefulWidget {
  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {

  User? user;

  @override
  void initState() {
    super.initState();
    //checkAuth();
    checkCurrentUser();
    //Navigator.pushReplacementNamed(context, '/login');
  }

  void checkCurrentUser() {
    user = FirebaseAuth.instance.currentUser;
  }


  @override
  Widget build(BuildContext context) {
    if (user == null) {
      //Navigator.pushReplacementNamed(context, '/login');
      return LoginPage();
    } else {
      if (user?.email == '0000@gmail.com') {
        //Navigator.pushReplacementNamed(context, '/adminDashboard');
        return DashboardDoctorPage();
      } else {
        //Navigator.pushReplacementNamed(context, '/generalDashboard');
        return DashboardGenPage();
      }
    }
  }
}