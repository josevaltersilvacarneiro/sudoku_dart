/// @author Jose V S Carneiro <git@josevaltersilvacarneiro.net>
/// @version 0.1
/// @access public
/// @copyright Copyright (C) 2023, José V S Carneiro
/// @license GPLv3

final class House {
  late int _value;
  late bool _status = true;

  House(int value) {
    this._value = value;
  }

  int get value {
    return this._value;
  }

  bool isHouseFree() {
    return this._status;
  }

  void markChosen() {
    this._status = false;
  }
}
