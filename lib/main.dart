import 'dart:async';

import 'package:atienrollmentapp/functions/checkuser.dart';
import 'package:atienrollmentapp/functions/signout.dart';
import 'package:atienrollmentapp/screen/displaypic.dart';
import 'package:atienrollmentapp/screen/signup_screen.dart';
import 'package:atienrollmentapp/screen/test_screen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'globalvars/globalvars.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Ideal time to initialize
  //await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  final userCheck = await checkUser();
  if(userCheck){
    await signOut();
  }

  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.red,
            displayColor: Colors.red,
          )),
      //home: HighschoolEnrollmentForm(),
      home: SignupScreen(),
      //home: DisplayPictureScreen(imagePath: '',),
      //home: TestScreen(),
      debugShowCheckedModeBanner: false,
      title: "ATI",
    );
  }
}