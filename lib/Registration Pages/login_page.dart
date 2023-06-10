import 'package:dermhub/Registration%20Pages/phone_auth.dart';
import 'package:dermhub/Registration%20Pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Dashboard Pages/dashboard_admin.dart';
import '../Dashboard Pages/dashboard_general.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String _textValue = '';

  void _signInWithEmailAndPassword() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
        if (userCredential.user == null) {
          Fluttertoast.showToast(
            msg: "User not found for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );

        } else {
          final user = userCredential.user!;
          // Check if the user is an admin
          if (user.email == "0000@gmail.com") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardDoctorPage()),
            );
          } else {

            Fluttertoast.showToast(
              msg: "Login successful.",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
              textColor: Colors.white,
            );


            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardGenPage()),
            );
          }
        }
      } on FirebaseAuthException catch (e) {


        if (e.code.toString() == 'invalid-email') {

          Fluttertoast.showToast(
            msg: "User not found for that email.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );


        } else if (e.code.toString() == 'wrong-password') {

          Fluttertoast.showToast(
            msg: "Wrong password provided for that user.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );

        }
      }
    } else {


      Fluttertoast.showToast(
        msg: "Please fill all relevant fields.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   'assets/images/background2.png',
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),



      Form(
        key: _formKey,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: _signInWithEmailAndPassword,
                  child: Text('login'),
                ),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: const Text("Don't have an account? sign up"),
                ),
              ],
            ),

          ],
        ),
      ),

        ],
      ),
    );
  }


}












