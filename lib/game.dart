import 'dart:math';
// ignore_for_file: avoid_print
import 'dart:io';

class Game{ //camel case
  int? _ans; //กำหนดตป.ให้เป็น package private  --> _ตป.
  int _guessCount = 0;
  int? max;
  Game({int? maxRandom}){
    maxRandom ??= 100;
    max = maxRandom;
    _ans =Random().nextInt(max!)+1;
  }
  /* int getCount(){
    return _guessCount;
  }*/
  // แบบข้างล่างจะเป็น ตัว getter ของ Dart
  int get guessCount{
    return _guessCount;
  }
  int? get maxNum{
    return max;
  }
/*  ส่วนอันนี้เป็น setter
  int set guessCount(int value){
    _guessCount = value;
  }*/


  int doGuess(int num){
    _guessCount ++;
    //ทายถูก return 0
    //ทายมากไป return 1
    //ทายน้อยไป return -1
    if (num > _ans!) {
      return 1;
    } else if (num < _ans!) {
      return -1;
    } else {
      return 0;
    }
  }
}