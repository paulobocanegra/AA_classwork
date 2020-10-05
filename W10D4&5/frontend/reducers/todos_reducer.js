import {RECEIVE_TODOS, RECEIVE_TODO} from '../actions/todo_actions'

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state=initialState, action) => {
    Object.freeze(state);
    const nextState = Object.assign({}, state);
    switch(action.type) {
        case RECEIVE_TODO:
            debugger
            nextState[action.todoPojo.id] = action.todoPojo;
            return nextState;
        case RECEIVE_TODOS:
            debugger
            const newTodos = {}
            action.todoArr.forEach(pojo => {
                newTodos[pojo.id] = pojo;
            });
            return newTodos;
        default:
            return state;
    }
}


export default todosReducer;