import React from 'react';
import * as Minesweeper from '../minesweeper.js'; // just defines game logic! :) 
import Board from './board.jsx';

console.log("This is the game");

class Game extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            board: new Minesweeper.Board(10, 15) //instance of this Board class that we imported from minesweeper.js
        };
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame(){

    }

    render (){
        return (
            <div>
                <Board //setting props to this component Board
                    board={this.state.board} //props key value pair
                    updateGame ={this.updateGame} 
                />
            </div>
        )
    }
}

export default Game;


                // <li
                //     key={index}
                //     className={klass}
                //     onClick={() => this.props.onTabChosen(index)}>
                //     {title}{' '}
                // </li>





//add game component, so then we can see what is rendered

// {/* <h1>   WE IN GAME.JSX SON </h1> */}

//need to export game


//create game component
// create constructor
// let board = new Minesweeper.Board;
// this.state = board