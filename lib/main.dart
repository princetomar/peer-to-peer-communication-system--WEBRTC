import 'dart:math';
import 'package:flutter/material.dart';
import 'package:streamingtest/services/signallingServices.dart';
import 'joinScreen.dart';

// Our backend code to run the server is defined in the ../backend folder outside lib, in the main project folder.
// Step1. Open backend folder in terminal
// Step2. Run command - npm install
// Step3. nodemon - to run backend server for socket conenction

// Step4. Now run flutter project

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // signalling server url
  final String websocketUrl = "http://localhost:3000";

  // generate callerID of local user
  final String selfCallerID =
      Random().nextInt(999999).toString().padLeft(8, '0');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // init signalling service
    SignallingService.inst.init(
      webSocketURL: websocketUrl,
      callerID: selfCallerID,
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: JoinScreen(selfCallerId: selfCallerID),
    );
  }
}
