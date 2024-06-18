
import 'dart:async';

class MyTimer {
  Timer? _timer;
  //static const maxSeconds = 3;
  int sec = 0;

  Future startTimer(var funcToRun, int maxSeconds) async {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), await (timer) {
      sec++;
      print('Seconds $sec');
      if(sec == maxSeconds){
        sec = 0;
        _timer?.cancel();
        return funcToRun;
      }
    });
  }
}