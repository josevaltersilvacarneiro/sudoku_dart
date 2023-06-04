/**
 * This is the main class of the project.
 * 
 * @author Jose V S Carneiro <git@josevaltersilvacarneiro.net>
 * @version 0.1
 * @access public
 * @copyright Copyright (C) 2023, José V S Carneiro
 * @license GPLv3
 */

import 'View/display.dart';
import 'Model/Entity/player.dart';
import 'Model/Entity/board.dart';
import '../Src/convert.dart';

class Sudoku {
  late int _dimension;
  late int _length;
  late int _numberPlayers;
  late int _nextPlayer;

  bool _diagonal = false;

  List<Player> _players = [];
  late Display _display;
  late Board _board;

  Sudoku(Display display) {
    this._display = display;

    this._dimension = this.display.dimension;
    this._length = this.display.length;

    this._board = new Board(this.dimension);
    this._nextPlayer = 0;

    for (String playerName in this.display.players)
      this._players.add(new Player(playerName));

    this._numberPlayers = this.players.length;
  }

  void set diagonal(bool value) {
    this._diagonal = value;
  }

  bool get quit {
    if (this.display.quit) return true;

    for (int i = 0; i < this.length; i++)
      if (this.board[i].isFree()) return false;

    return true;
  }

  int get dimension {
    return this._dimension;
  }

  int get length {
    return this._length;
  }

  bool get diagonal {
    return this._diagonal;
  }

  Display get display {
    return this._display;
  }

  Board get board {
    return this._board;
  }

  List<Player> get players {
    return this._players;
  }

  Player get nextPlayer {
    this._nextPlayer += 1;
    this._nextPlayer %= this._numberPlayers;

    return this._players[this._nextPlayer];
  }

  void show() {
    this.display.update(this.board, this.players);
  }

  void play(Player player) {
    int section, house, number, row, column;

    (section, number) = this.display.move;

    house = this.board[section].index(number);

    this.board[section][house].markChosen();

    (row, column) = convert(section, house, this.dimension);

    if (!this.board.isRowFree(row)) player.score = this.board.rowsSum[row];

    if (!this.board.isColumnFree(column))
      player.score = this.board.columnsSum[column];

    if (!this.board.isDiagonalFree() && !this.diagonal) {
      player.score = this.board.diagonalSum;
      this.diagonal = true;
    }
  }
}
