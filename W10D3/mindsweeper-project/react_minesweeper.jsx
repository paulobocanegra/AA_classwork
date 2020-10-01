// add event listener here!, since this is the entry point (id="game")
//waits until everything is loaded, then executes!
//webpack makes sure that everything is loaded int he correct order, ONCE the document is fully "loaded"
//then puts in bundle.js for us! :)

import React from 'react';
import ReactDOM from 'react-dom';
import Game from './Components/game';

document.addEventListener('DOMContentLoaded', () =>{ //takes in a callback
    //now hook into the DOM
    const game = document.getElementById('game');
    ReactDOM.render(<Game />, game);
});

// ReactDOM.render();
