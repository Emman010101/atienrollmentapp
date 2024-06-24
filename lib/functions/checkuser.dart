import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<bool> checkUser() async {
  final User? user = _auth.currentUser;

  if(user != null){
    return true;
  }
  return false;
}