import 'package:atienrollmentapp/functions/change_screen.dart';
import 'package:atienrollmentapp/functions/checkuser.dart';
import 'package:atienrollmentapp/functions/is_user_enrolled.dart';
import 'package:atienrollmentapp/functions/signout.dart';
import 'package:atienrollmentapp/functions/snackbar.dart';
import 'package:atienrollmentapp/screen/highschool_enrollment_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../globalvars/globalvars.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> _signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      // User canceled the sign-in
      return null;
    }

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    final User? user = userCredential.user;

    return user;
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: AbsorbPointer(
        absorbing: _isLoading,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      print("Button is clicked");
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        if(await checkUser()){
                          await signOut();
                        }
                        User? user = await _signInWithGoogle();
                        final _isUserEnrolled = await isUserEnrolled();
                        if (!_isUserEnrolled) {
                          if (user != null) {
                            email = user.email.toString();
                            snackBar(context, 'Welcome, ${user.displayName}');
                            changeScreen(context, HighschoolEnrollmentForm());
                          } else {
                            snackBar(context, 'Sign in failed.');
                          }
                        } else {
                          snackBar(context,
                              "You're already finished with the enrollment process. Kindly wait for the email confirmation.");
                        }
                      } catch (e) {
                        print(e);
                        snackBar(context,
                            'Something went wrong. Please check your internet connection.');
                      }
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/googlelogo.png', // path to your image asset
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(width: 10),
                        Text('Continue with Google'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _isLoading
                ? Container(
                  height: screenHeight,
                  width: screenWidth,
                  color: Colors.black26,
                  child: Center(
                      child: CircularProgressIndicator(
                      ),
                    ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
