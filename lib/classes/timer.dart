//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
// Timer? _timer;
// const maxSeconds = 3;
// int secondsRemaining = maxSeconds;
//
// class MyTimer extends StatefulWidget {
//   const MyTimer({super.key});
//
//   @override
//   State<MyTimer> createState() => _MyTimerState();
// }
//
// class _MyTimerState extends State<MyTimer> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
//
//   void _startTimer() {
//     _timer?.cancel(); // Cancel any existing timer
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (secondsRemaining > 0) {
//           secondsRemaining--;
//         } else {
//           _timer?.cancel();
//         }
//       });
//     });
//   }
//
//   void _resetTimer() {
//     _timer?.cancel();
//     setState(() {
//       secondsRemaining = maxSeconds;
//     });
//   }
//
//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }
// }
