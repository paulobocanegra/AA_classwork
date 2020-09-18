let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
    let grid = new Array(8);
    for (let i = 0; i < grid.length; i++){
      grid[i] = new Array(8); 
    };

    grid.positionSetter(3,4,"black");
    grid.positionSetter(4,3,"black");
    grid.positionSetter(3,3,"white");
    grid.positionSetter(4,4,"white");
    return grid;
}

Array.prototype.positionSetter = function(row, col, color){
  this[row][col] = new Piece(color);  
};

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let row = pos[0];
  let col = pos[1];

  if ((row >= 0 && row <= 7) && (col >= 0 && col <= 7)) {
    return true;
  } else {
    return false;    
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let row = pos[0];
  let col = pos[1];

  return this.grid[row][col];
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let row = pos[0];
  let col = pos[1];
  if (!this.getPiece(pos)){
    return false;
  } else {
  return this.grid[row][col].color === color;
  }
  // if(this.isValidPos(pos)){
  //   if (this.getPiece(pos).color === color){
  //     return true;
  //   }
  // } else {
  //   return false;
  // }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (!this.getPiece(pos)){
    return false;
  } else {
    return true;
  }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 * 
 * 
 * our ideas: 
 * base cases: piece is the same color OR piece is undefined OR if pos is not on the board
 * question: how do we check what the inputs will look like? should we be adding/returning piecesToFlip everytime?
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){


  if (!piecesToFlip) {
    piecesToFlip = [];
  }
  let nextPos = [pos[0]+dir[0], pos[1]+dir[1]];
    if (!this.isValidPos(nextPos) || !this.isOccupied(nextPos) ) return [];

    if (this.isMine(nextPos, color) ) return piecesToFlip;

    piecesToFlip.push(nextPos);

    return this._positionsToFlip(nextPos, color, dir, piecesToFlip);
};



  //base case #1: not a valid pos
  // if (!this.isValidPos(pos)){
  //   return [];
  // }

  // //base case #2: next spot is a blank
  // if (!this.grid[pos[0] + dir[0]][pos[1] + dir[1]]){
  //   return [];
  // } 


  //base case #3: we reach another piece that is the same color
//   if (this.grid[pos[0] + dir[0]][pos[1] + dir[1]]) {
//     return this.getPiece([pos[0] + dir[0], pos[1] + dir[1]]).color === color;
//   }
//   if (this.grid[pos[0] + dir[0]][pos[1] + dir[1]] && this.getPiece([pos[0] + dir[0], pos[1] + dir[1]]).color === color) {
//     return piecesToFlip.push(this.getPiece([pos[0] + dir[0], pos[1] + dir[1]]));
//   }

//   let new_pos = [];
//   new_pos.push(pos[0] + dir[0]);
// new_pos.push(pos[1] + dir[1]);
// let output = []; 
// this._positionsToFlip(new_pos, color, dir, output);
// };

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {

};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {

};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};



module.exports = Board;
