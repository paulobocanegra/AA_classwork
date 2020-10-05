export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todoArr) => {
    return {
        type: RECEIVE_TODOS,
        todoArr
    }
}

export const receiveTodo = (todoPojo) => {
    return {
        type: RECEIVE_TODO,
        todoPojo
    }
}

// [{
//         id: 1,
//             title: 'wash car',
//                 body: 'with soap',
//                     done: false
//     },
//     {
//         id: 2,
//             title: 'wash dog',
//                 body: 'with shampoo',
//                     done: true
//     },
// ]