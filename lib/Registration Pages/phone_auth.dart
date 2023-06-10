
import 'package:flutter/material.dart';

class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 25,
              ),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      Navigator.pushNamed(context, 'verify');
                    },
                    child: Text("Send the code")),
              )
            ],
          ),
        ),
      ),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:studymaster/Registration%20Pages/signup_page.dart';
//
// class PhoneAuthPage extends StatefulWidget {
//   @override
//   _PhoneAuthPageState createState() => _PhoneAuthPageState();
// }
//
// class _PhoneAuthPageState extends State<PhoneAuthPage> {
//   final _phoneController = TextEditingController();
//   final _codeController = TextEditingController();
//
//   late String _verificationId;
//   bool _codeSent = false;
//
//   Future<void> _verifyPhone() async {
//     final phone = '+1${_phoneController.text.trim()}'; // assuming phone number is in the US format
//     final auth = FirebaseAuth.instance;
//
//     await auth.verifyPhoneNumber(
//       phoneNumber: phone,
//       verificationCompleted: (credential) async {
//         await auth.signInWithCredential(credential);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => SignupPage()),
//         );// navigate to home page on successful sign-in
//       },
//       verificationFailed: (e) {
//         print(e.message);
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Failed to verify phone number. Please try again later.'),
//         ));
//       },
//       codeSent: (verificationId, resendToken) {
//         setState(() {
//           _verificationId = verificationId;
//           _codeSent = true;
//         });
//       },
//       codeAutoRetrievalTimeout: (verificationId) {
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//       timeout: Duration(seconds: 60),
//     );
//   }
//
//   Future<void> _submitCode() async {
//     final code = _codeController.text.trim();
//     final credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: code);
//     final auth = FirebaseAuth.instance;
//
//     try {
//       await auth.signInWithCredential(credential);
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => SignupPage()),
//       ); // navigate to home page on successful sign-in
//     } catch (e) {
//       if (e is FirebaseAuthException) {
//         print(e.message);
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('Invalid verification code. Please try again.'),
//         ));
//       } else {
//         print('Error: $e');
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text('An unexpected error occurred. Please try again later.'),
//         ));
//       }
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Phone Authentication')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             SizedBox(height: 16.0),
//             if (_codeSent)
//               TextField(
//                 controller: _codeController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Verification Code'),
//               ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _codeSent ? _submitCode : _verifyPhone,
//               child: Text(_codeSent ? 'Submit Code' : 'Verify Phone Number'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
