import React from "react";
import { Provider } from "react-redux";
import App from "./app.jsx"

const Root = ({ store }) => {
    return (
        // <div><h1>hey look! the shop is open!</h1></div>
        // <Provider store={props.store}> 
        <Provider store={store}>
           <App/>
        </Provider>
    )
}

export default Root;