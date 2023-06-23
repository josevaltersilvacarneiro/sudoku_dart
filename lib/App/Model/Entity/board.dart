/// @author Jose V S Carneiro <git@josevaltersilvacarneiro.net>
/// @version 0.1
/// @access public
/// @copyright Copyright (C) 2023, José V S Carneiro
/// @license GPLv3

import 'section.dart';
import '../../../Src/convert.dart';

final class Board {
  late int _dimension;
  late int _length;

  List<Section> _board = [];

  List<int> _rowsSum = [];
  List<int> _columnsSum = [];
  int _diagonalSum = 0;

  Board({required int dimension}) {
    this._dimension = dimension;
    this._length = this._dimension * this._dimension;

    for (int i = 0; i < this._length; i++) {
      this._board.add(new Section(this._dimension));
      this._rowsSum.add(0);
      this._columnsSum.add(0);
    }

    this._findSums();
  }

  void _findSums() {
    for (int row = 0; row < this._length; row++)
      for (int column = 0; column < this._length; column++) {
        int section, house, number;

        (section, house) = convert(row, column, this._dimension);

        number = this._board[section].getHouse(house).value;

        this._columnsSum[column] += number;
        this._rowsSum[row] += number;

        if (row == column) this._diagonalSum += number << 1;
      }
  }

  operator [](index) => this._board[index];

  int get length {
    return this._length;
  }

  List get rowsSum {
    return this._rowsSum;
  }

  List get columnsSum {
    return this._columnsSum;
  }

  int get diagonalSum {
    return this._diagonalSum;
  }

  bool isRowFree(int row) {
    for (int column = 0; column < this._length; column++) {
      int section, house;

      (section, house) = convert(row, column, this._dimension);

      if (this[section][house].isHouseFree()) return true;
    }

    return false;
  }

  bool isColumnFree(int column) {
    for (int row = 0; row < this._length; row++) {
      int section, house;

      (section, house) = convert(row, column, this._dimension);

      if (this[section][house].isHouseFree()) return true;
    }

    return false;
  }

  bool isDiagonalFree() {
    for (int i = 0; i < this._length; i++) {
      int section, house;

      (section, house) = convert(i, i, this._dimension);

      if (this[section][house].isHouseFree()) return true;
    }

    return false;
  }
}
