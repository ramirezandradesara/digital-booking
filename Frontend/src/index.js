import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import reportWebVitals from "./reportWebVitals";
import { DataProvider } from "./components/Context/DataContext";
import { DateProvider } from "./components/Context/DateContext";
import { Context, Provider } from "./context/Context";


const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <Provider>
    <DataProvider>
      <DateProvider>
        <App />
      </DateProvider>
    </DataProvider>
  </Provider>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();

