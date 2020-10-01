import Tile from './tile.jsx'
import React from 'react';


// <div>
//     <Board //setting props to this component Board
//         board={this.state.board} //props key value pair
//         updateGame={this.updateGame}
//     />
// </div>

console.log("This is the board");

class Board extends React.Component {
    constructor(props){
        super(props);
        
    }

    render (){
        return (
            <div>
                {this.props.board.grid.map(row => {
                    return (<div className="row">{row.map(tile => { //all callbacks in map need a "return"
                        return (
                            <Tile

                            />
                        )
                    })
                    }
                    </div>)
                })}
            </div>
        )
    }
}
export default Board;