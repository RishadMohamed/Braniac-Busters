// import 'package:flutter/material.dart';
// import 'dart:math' as math;
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

// final String localUserID = math.Random().nextInt(10000).toString();

// class VideoCalling extends StatelessWidget {
//   final CallId = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           TextFormField(
//             controller: CallId,
//             decoration: InputDecoration(
//               labelText: "Join a Call by ID",
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return CallPage(CallId: CallId.text,);
//               }));
//             },
//             child: Text("Join A Call"),
//           )
//         ],
//       )),
//     );
//   }
// }

// class CallPage extends StatelessWidget {
//   final String CallId;
//   const CallPage({required this.CallId});

//   @override
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: ZegoUIKitPrebuiltCall(
//             appID: 1022881243,
//             appSign:
//                 "c7557917337feb64dcdb8587ed30250e153f27c143b9d34b5d2071ba2a45a9fc",
//             callID: CallId,
//             userID: localUserID,
//             userName: "User_$localUserID",
//             config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
//               ..onOnlySelfInRoom = (context) {
//                 Navigator.of(context).pop();
//               }));
//   }
// }
