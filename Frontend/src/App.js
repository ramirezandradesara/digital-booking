import "./App.scss";
import React from "react";
import Routing from "./routing/Routing";
// import { Context, Provider } from "./context/Context";

function App() {
  return (
    <div className="App">
      {/* <Provider> */}
      <Routing />
      {/* </Provider> */}
    </div>
  );
}

export default App;
