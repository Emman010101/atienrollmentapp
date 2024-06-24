
import 'package:flutter/material.dart';
import 'package:atienrollmentapp/functions/is_user_enrolled.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
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
                final _isUserEnrolled = await isUserEnrolled();
                //print(user?.displayName.toString());
                print(_isUserEnrolled);

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
                  Text('Test Query'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
