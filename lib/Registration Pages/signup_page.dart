import 'package:dermhub/Registration%20Pages/personalDetail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Dashboard Pages/dashboard_general.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool _showErrPasword=false;
  bool _showErrEmail=false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      if (_emailController.text == '0000@gmail.com') {
        Fluttertoast.showToast(
          msg: 'Invalid user id',
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      } else {
        try {
          await _auth.createUserWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          );
          Fluttertoast.showToast(
            msg: 'Sign up successful',
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );
          Navigator.push(
            context,
           // MaterialPageRoute(builder: (context) => DashboardGenPage()),
            MaterialPageRoute(builder: (context) => UserFormScreen()),
          );
        } on FirebaseAuthException catch (e) {
          Fluttertoast.showToast(
            msg: e.message!,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery
        .of(context)
        .size;
    final double formWidth = deviceSize.width >= 600 ? 500 : deviceSize.width *
        0.9;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: formWidth,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 32.0),
                    Text(
                      'Sign up',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32.0),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        errorText: _showErrEmail ? 'Please enter a valid email' : null,
                      ),
                      onChanged: (value) {
                        if (!isValidEmail(value)) {
                          setState(() {
                            _showErrEmail = true;
                          });
                        } else {
                          setState(() {
                            _showErrEmail = false;
                          });
                        }
                      },

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        errorText: _showErrPasword ? 'Please enter a valid password' : null,
                      ),

                      onChanged: (value) {
                        if (!isValidPassword(value)) {
                          setState(() {
                            _showErrPasword = true;
                          });
                        } else {
                          setState(() {
                            _showErrPasword = false;
                          });
                        }
                      },

                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        if (!RegExp(
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return 'Password must include uppercase, lowercase, numbers, and symbols';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 32.0),
                    ElevatedButton(
                      onPressed: _signUp,
                      child: Text('Sign up'),
                    ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text('Have an account? login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  bool isValidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
  }

  bool isValidPassword(String password) {
    RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regExp.hasMatch(password);
  }
}