/// @author Jose V S Carneiro <git@josevaltersilvacarneiro.net>
/// @version 0.1
/// @access public
/// @copyright Copyright (C) 2023, José V S Carneiro
/// @license GPLv3

final class Player {
  late String _name;
  late int _score;

  Player(String name) {
    this._name = name;
    this._score = 0;
  }

  String get name {
    return this._name;
  }

  int get score {
    return this._score;
  }

  void set score(int points) {
    this._score += points;
  }
}
