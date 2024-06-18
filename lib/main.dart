import 'dart:async';

import 'package:atienrollmentapp/screen/signup_screen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'globalvars/globalvars.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Colors.black,
            ),
          ),
      ),
      //home: HighschoolEnrollmentForm(),
      home: SignupScreen(),
      debugShowCheckedModeBanner: false,
      title: "ATI",
    );
  }
}