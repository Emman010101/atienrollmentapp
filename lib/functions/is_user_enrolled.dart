import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../classes/database.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future isUserEnrolled() async {
  final User? user = _auth.currentUser;
  final userEmail = user?.email;

  Database db = Database();
  var response = await db.checkEmailIfUsed(userEmail);
  response = jsonDecode(response.body.toString());
  response = response['result'];
  print("Response: $response");
  if (response.toString() != 'false') {
    return true;
  }
  return false;
}
