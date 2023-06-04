/**
 * It starts and manages the game.
 * 
 * @param arguments list that contains all the command line arguments
 * 
 * @author Jose V S Carneiro <git@josevaltersilvacarneiro.net>
 * @version 0.1
 * @access public
 * @copyright Copyright (C) 2023, José V S Carneiro
 * @license GPLv3
 */

import 'App/View/display.dart';
import 'App/sudoku.dart';

void main(List<String> arguments) {
  Display display = new Display();
  Sudoku game = new Sudoku(display);

  while (!game.quit) {
    game.show();
    game.play(game.nextPlayer);
  }

  game.show();
}
