class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $("ul").on("click", "li", ()=>(this.makeMove(event.target))); 
    // event.target is still just the li? We want it to be a JQuery object..

  }

  makeMove($square) {
    debugger
    $("square").css('background-color', 'none');
    $("square").addClass(`${this.game.currentPlayer}`);
    this.game.playMove($("square").data("pos"));
  }

  setupBoard() {
    let $ul = $("<ul></ul>");
    // $("ul").addClass("group");
    
    // debugger
    // for(let i=0 ;i < 9; i++){
      //   let $li = $("<li></li>");
      //   $ul.append($li);
      // };
      
    for (let row = 0; row < 3; row++){
      for(let col = 0; col < 3; col++){
        let position = [row, col];
        let $li = $("<li></li>")
        $li.data("pos", position);
        // console.log($li.data("pos"))
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}



module.exports = View;
