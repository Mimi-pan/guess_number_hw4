// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'game.dart';
List<int> gameCount = [];
void main() {
  // const maxRandom = 100; //compile-time constant:มองเป็น literal ก่อนคอมไพล์ , datatype final จะใช้เมื่อต้องการให้อ่านได้อย่างเดียว ไม่ต้องเปลี่ยนค่าอีก
  //var random = Random();
  //var answer = random.nextInt(maxRandom) + 1;
  String? cmd = 'Y';
  while (true) {
    if (cmd != null) {
      if (cmd == 'Y' || cmd == 'y') {
        playGame();
      }
      if (cmd == 'N' || cmd == 'n') {
        print("▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔");
        print("You've played "+(gameCount.length).toString()+" games.");
        for (var i = 0; i < gameCount.length; i++) {
          print("💘 Game #"+(i+1).toString() +": "+gameCount[i].toString()+" guesses.");
        }
        print("▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔");
        print('Have a nice day');
        break;
      }
      stdout.write('Play again? (Y/N): ');
      cmd = stdin.readLineSync();
    }
  }

  //var guessCount = 0;
  /*int sum(int a, int b, {int? c})
  { //{int? c} เป็น named parameter  จะให้ไม่ให้ก็ได้ ซึ่งจะมีค่าเป็น null ได้ (optional)
    //ถ้าต้องการให้ optional เป็น positional --> ใส่ {required int c}
    //int a, int b ---> positional  ต้องส่งค่าตามตำแหน่ง
    return a + b + c!;
  }
  var result = sum(1, 4, c:34 );
  print(result);*/
}

void playGame() {
  stdout.write('Enter a maximum number to random: ');
  dynamic max = stdin.readLineSync();
  max = int.tryParse(max);
  var game = Game(maxRandom: max);
  var isCorrect = false;
  //const maxRandom = 100;
  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    stdout.write(
        '║ Guess the number between 1 and ' + (game.maxNum).toString() + ' : ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }
    //guessCount++; //HW : ย้ายอันนี้ไปคลาส Game
    var result = game.doGuess(guess);
    if (result == 1) {
      print('║ ➜ $guess is TOO HIGH! ▲ ');
      print('╟────────────────────────────────────────');
    } else if (result == -1) {
      print('║ ➜ $guess is TOO LOW! ▼ ');
      print('╟────────────────────────────────────────');
    } else if (result == 0) {
      print('║ ➜ $guess is CORRECT ❤, total guesses: ' +
          (game.guessCount).toString());
      print('╟────────────────────────────────────────');
      gameCount.add(game.guessCount);
      isCorrect = true;
    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}

/*Refactoring = การปรับเปลี่ยนโครงสร้างโค้ด
โดยที่การทำงานยังคงเหมือนเดิม*/
