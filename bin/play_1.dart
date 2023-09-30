import 'dart:io';
import 'dart:math';

import 'package:play_1/play_1.dart' as play_1;

void main() {
  game();
}

void game() {
  print('Добро пожаловать, введите количество раундов');
  int rounds = int.tryParse(stdin.readLineSync() ?? "") ?? 0;
  int compWins = 0;
  int userWins = 0;

  for (int i = 1; i < rounds; i++) {
    print('Раунд $i');
    print('Введите действие\n1)Камень\n2)Ножницы\n3)Бумага');
    int userChoise = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    int compChoise = Random().nextInt(3) + 1;
    print(compChoise);
    if (userChoise != 1 && userChoise != 2 && userChoise != 3) {
      print('Error');
      i--;
    } else {
      if (userChoise == compChoise) {
        print('Ничья');
      } else if (userChoise == 1 && compChoise == 2 ||
          userChoise == 2 && compChoise == 3 ||
          userChoise == 3 && compChoise == 1) {
        print('Победа пользователя');
        userWins++;
      } else if (compChoise == 1 && userChoise == 2 ||
          compChoise == 2 && userChoise == 3 ||
          compChoise == 3 && userChoise == 1) {
        print('Победа компьютера');
        compWins++;
      }
    }
  }
  if (compWins > userWins) {
    print('Победа компьютера со счетом $compWins : $userWins');
  } else if (compWins < userWins) {
    print('Победа пользователя со счетом $compWins : $userWins');
  } else {
    print('Ничья со счетом $compWins : $userWins');
  }
}
