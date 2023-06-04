/**
 * This class is responsible for interacting with the user.
 * 
 * @author Jose V S Carneiro <git@josevaltersilvacarneiro.net>
 * @version 0.1
 * @access public
 * @copyright Copyright (C) 2023, José V S Carneiro
 * @license GPLv3
 */

import '../Model/Entity/board.dart';
import '../Model/Entity/house.dart';
import '../Model/Entity/player.dart';

import '../../Src/convert.dart';

import 'dart:io';

class Display {
  late int _dimension;
  late int _length;

  late bool _quit;

  Display() {
    this._dimension = this.getDimension();
    this._length = this.dimension * this.dimension;
    this._quit = false;
  }

  void _printHyphens() {
    int amount = 5 * this.length;

    for (int i = 0; i < amount; i++) stdout.write('=');
    print('');
  }

  int _getNumber(String message) {
    String? number;

    stdout.write(message);
    number = stdin.readLineSync() ?? '';

    return int.parse(number);
  }

  int getDimension() {
    return 2;
  }

  int get dimension {
    return this._dimension;
  }

  int get length {
    return this._length;
  }

  bool get quit {
    return this._quit;
  }

  List<String> get players {
    List<String> players = ['Jose', 'Maria'];

    return players;
  }

  (int, int) get move {
    int section, number;

    section = _getNumber("Enter section: ");
    number = _getNumber("Enter number: ");

    section--;

    return (section, number);
  }

  void update(Board board, List<Player> players) {
    int section, house;
    House houseObj;

    this._printHyphens();
    for (int i = 0; i < this._length; i++)
      stdout.write(board.columnsSum[i].toString() + '|');
    print('');

    for (int row = 0; row < this.length; row++) {
      for (int column = 0; column < this.length; column++) {
        (section, house) = convert(row, column, this.dimension);

        houseObj = board[section][house];

        if (houseObj.isHouseFree())
          stdout.write('XX|');
        else
          stdout.write(houseObj.value.toString() + '|');
      }
      print(board.rowsSum[row]);
    }

    this._printHyphens();

    for (Player player in players)
      print(player.name + "\t\t" + player.score.toString());

    this._printHyphens();
  }
}
