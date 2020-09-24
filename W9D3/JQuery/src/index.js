const View = require("./ttt-view.js")
const Game = require("../Node_Solutions/game.js")


$(() => {
  window.View = View;
  window.Game = Game;
  let $ttt = $(".ttt");

  const game = new Game();
  const view = new View(game, $ttt);
  });


  