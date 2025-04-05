
// do two command to setup before run 

//npx create-react-app real-time-counter
// cd real-time-counte
// npm start



// and only just replace with real-time-counter\src\App.js file and App.css files








import React, { useState } from "react";
import "./App.css";

function App() {
  const [count, setCount] = useState(0);
  const [theme, setTheme] = useState("light");

  const toggleTheme = () => {
    setTheme(theme === "light" ? "dark" : "light");
  };

  const increment = () => setCount(count + 1);
  const decrement = () => count > 0 && setCount(count - 1);
  const reset = () => setCount(0);

  const isDark = theme === "dark";

  return (
    <div className={`app ${theme}`}>
      <h1 className="counter-value">{count}</h1>
      <p className="message">
        {count === 0 ? "You’ve reached zero!" : "Keep counting!"}
      </p>

      <div className="buttons">
        <button onClick={increment}>+</button>
        <button onClick={decrement} disabled={count === 0}>-</button>
        <button onClick={reset}>Reset</button>
      </div>

      <button className="theme-toggle" onClick={toggleTheme}>
        Switch to {isDark ? "Light" : "Dark"} Theme
      </button>
    </div>
  );
}

export default App;
