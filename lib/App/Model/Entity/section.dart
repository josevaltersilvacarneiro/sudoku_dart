/// @author Jose V S Carneiro <git@josevaltersilvacarneiro.net>
/// @version 0.1
/// @access public
/// @copyright Copyright (C) 2023, José V S Carneiro
/// @license GPLv3

import 'dart:math';

import 'house.dart';

final class Section {
  late int _length;
  late List<House> _section = [];

  Section(int dimension) {
    this._length = dimension * dimension;

    for (int i = 0; i < this.length; i++)
      this._section.add(House(this._getRand(i)));
  }

  int _getRand(int end) {
    bool found;
    int randNumber;

    Random generator = new Random(this.length);

    do {
      found = false;

      randNumber = 1 + generator.nextInt(this.length);

      for (int i = 0; i < end; i++)
        if (randNumber == this[i].value) {
          found = true;
        }
    } while (found);

    return randNumber;
  }

  operator [](index) => this._section[index];

  int get length {
    return this._length;
  }

  House getHouse(int house) {
    return this._section[house];
  }

  bool isFree() {
    for (int i = 0; i < this.length; i++)
      if (this.getHouse(i).isHouseFree()) return true;

    return false;
  }

  int index(int value) {
    for (int i = 0; i < this.length; i++) {
      if (value == this[i].value) return i;
    }

    return -1;
  }
}
