

import 'package:flutter/material.dart';

Future changeScreen(BuildContext context, var screen) async {
  await Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
  }
}