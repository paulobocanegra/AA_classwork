import React from "react"
import ReactDOM from "react-dom"
import configureStore from "./store/store.js"
import Root from "./components/root"
import {receiveTodo, receiveTodos} from "./actions/todo_actions"
// const App = ()=>(

// )



document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const store = configureStore();
    ReactDOM.render(<Root store={store} />,root);
    window.store = store;
    window.receiveTodo = receiveTodo;
    window.receiveTodos = receiveTodos;
})