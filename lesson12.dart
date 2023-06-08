import 'dart:io';
import 'dart:math';

void main() {
  startGame();
}

gameForUserToGuess() {
  int count = 0;
  int random = Random().nextInt(100);
  int userGuess = 0;
  print("Guess the number from 1 to 100: ");

  while (userGuess != random) {
    count++;
    print("Enter your guess: ");
    userGuess = int.parse(stdin.readLineSync()!);

    if (userGuess < random) {
      print("Greater");
    } else if (userGuess > random) {
      print("Less");
    }
  }
  print("Got it in $count steps!");
}

computerBinarySearch() {
  print("Come up with the number from 1 to 100 so that computer could guess it: ");

  int min = 1;
  int max = 100;
  int count = 0;

  while (min <= max) {
    int middle = (min + max) ~/ 2;
    count++;
    print("Is it $middle?\n1) Yes\n2) Greater\n3) Less");
    int answer = int.parse(stdin.readLineSync()!);
    if (answer == 1) {
      print("Got it in $count steps!");
      break;
    } else if (answer == 2) {
      min = middle;
    } else if (answer == 3) {
      max = middle;
    } else {
      print("No such option");
    }
  }
}

computerRandomSearch() {
  print("Come up with the number from 1 to 100 so that computer could guess it: ");

  int count = 0;
  int min = 0;
  int max = 100;
  int answer = 0;

  while (answer != 1) {
    int random = min + Random().nextInt(max - min);
    count++;
    print("Is it $random?\n1) Yes\n2) Greater\n3) Less");
    answer = int.parse(stdin.readLineSync()!);

    if (answer == 2) {
      min = random;
    } else if (answer == 3) {
      max = random;
    }
  }
  print("Got it in $count steps!");
}

startGame() {
  print("Who is gonna guess the number?\n1) User\n2) Computer");
  int playerChoice = int.parse(stdin.readLineSync()!);

  switch (playerChoice) {
    case 1:
      gameForUserToGuess();
    case 2:
      print("Choose the level:\n1) Easy\n2) Hard");
      int levelChoice = int.parse(stdin.readLineSync()!);

      switch (levelChoice) {
        case 1:
          computerBinarySearch();
        case 2:
          computerRandomSearch();
        default:
          print("Wrong number");
      }
    default:
      print("Wrong number");
  }
}
