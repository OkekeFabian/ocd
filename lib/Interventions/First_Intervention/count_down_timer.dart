import 'dart:async';
import 'package:get/get.dart';

class CountDownTimerState extends GetxController{
  // Initial Count Timer value

  var SCount = 10;

  //object for Timer Class
  Timer _timer;

  // a Method to start the Count Down
  void StateTimerStart(){
    //Timer Loop will execute every 1 second, until it reach 0
    // once counter value become 0, we store the timer using _timer.cancel()

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if(SCount > 0){
        SCount--;
        update();
      }else{
        _timer.cancel();
      }
    });
  }

  // user can set count down seconds, from TextField
  void setnumber(var num){

    SCount = int.parse(num);
    update();

  }

  // pause the timer
  void Pause(){
    _timer.cancel();
    update();
  }

  // reset count value to 10
  void reset(){
    _timer.cancel();
    SCount = 10 ;
    update();
  }

}