Future executeAfter(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}