
/*

npx create-react-app weather-app
cd weather-app

npm start

 */






import React, { useEffect, useState } from "react";
import "./App.css";

export default function App() {
  const [weather, setWeather] = useState([]);
  const [filtered, setFiltered] = useState([]);
  const [search, setSearch] = useState("");

  useEffect(() => {
    fetch("/weatherData.json")
      .then(res => res.json())
      .then(data => {
        setWeather(data);
        setFiltered(data);
      });
  }, []);

  useEffect(() => {
    const filteredData = weather.filter(item =>
      item.city.toLowerCase().includes(search.toLowerCase())
    );
    setFiltered(filteredData);
  }, [search, weather]);

  const getIcon = (condition) => {
    switch (condition) {
      case "Sunny": return "☀️";
      case "Rainy": return "🌧️";
      case "Cloudy": return "☁️";
      case "Stormy": return "⛈️";
      default: return "❓";
    }
  };

  return (
    <div style={{ fontFamily: "Arial", padding: "20px", textAlign: "center" }}>
      <h2>🌤️ Weather Info Cards</h2>
      <input
        type="text"
        placeholder="Search by city..."
        value={search}
        onChange={(e) => setSearch(e.target.value)}
        style={{ padding: "10px", width: "60%", marginBottom: "20px" }}
      />

      <div style={{ display: "flex", flexWrap: "wrap", justifyContent: "center", gap: "20px" }}>
        {filtered.map((item, index) => (
          <div
            key={index}
            style={{
              border: "1px solid #ccc",
              borderRadius: "12px",
              padding: "20px",
              width: "200px",
              boxShadow: "2px 2px 8px rgba(0,0,0,0.1)",
              transition: "0.3s"
            }}
          >
            <h3>{item.city}</h3>
            <p style={{ fontSize: "2rem" }}>{getIcon(item.condition)}</p>
            <p>{item.condition}</p>
            <p>{item.temperature}°C</p>
          </div>
        ))}
      </div>
    </div>
  );
}
