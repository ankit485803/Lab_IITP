



/*

npx creact-react-app expense-tracker
cd expense-tracker
npm start



npm install chart.js react-chartjs-2

 */



import React, { useState, useEffect } from "react";
import { Pie } from "react-chartjs-2";
import "chart.js/auto";
import "./App.css";

const categories = ["Food", "Travel", "Shopping"];

export default function App() {
  const [expenses, setExpenses] = useState([]);
  const [amount, setAmount] = useState("");
  const [category, setCategory] = useState("Food");
  const [date, setDate] = useState("");
  const [filterCategory, setFilterCategory] = useState("All");

  // Load from localStorage
  useEffect(() => {
    const data = JSON.parse(localStorage.getItem("expenses"));
    if (data) setExpenses(data);
  }, []);

  // Save to localStorage
  useEffect(() => {
    localStorage.setItem("expenses", JSON.stringify(expenses));
  }, [expenses]);

  const handleAdd = () => {
    if (!amount || !date) return alert("Enter amount and date!");
    setExpenses([
      ...expenses,
      { id: Date.now(), amount: parseFloat(amount), category, date },
    ]);
    setAmount("");
    setCategory("Food");
    setDate("");
  };

  const filteredExpenses =
    filterCategory === "All"
      ? expenses
      : expenses.filter((e) => e.category === filterCategory);

  const total = filteredExpenses.reduce((sum, e) => sum + e.amount, 0);

  const categoryTotals = categories.map((cat) => {
    return {
      category: cat,
      total: expenses
        .filter((e) => e.category === cat)
        .reduce((sum, e) => sum + e.amount, 0),
    };
  });

  const pieData = {
    labels: categoryTotals.map((c) => c.category),
    datasets: [
      {
        data: categoryTotals.map((c) => c.total),
        backgroundColor: ["#FF6384", "#36A2EB", "#FFCE56"],
      },
    ],
  };

  return (
    <div className="app">
      <h2>💸 Expense Tracker</h2>

      <div className="form">
        <input
          type="number"
          placeholder="Amount"
          value={amount}
          onChange={(e) => setAmount(e.target.value)}
        />
        <select value={category} onChange={(e) => setCategory(e.target.value)}>
          {categories.map((cat) => (
            <option key={cat}>{cat}</option>
          ))}
        </select>
        <input type="date" value={date} onChange={(e) => setDate(e.target.value)} />
        <button onClick={handleAdd}>Add</button>
      </div>

      <div className="filter">
        <label>Filter by Category: </label>
        <select value={filterCategory} onChange={(e) => setFilterCategory(e.target.value)}>
          <option>All</option>
          {categories.map((cat) => (
            <option key={cat}>{cat}</option>
          ))}
        </select>
      </div>

      <h3>Total: ₹{total.toFixed(2)}</h3>

      <div className="expense-list">
        {filteredExpenses.map((e) => (
          <div className="expense" key={e.id}>
            <span>₹{e.amount}</span>
            <span>{e.category}</span>
            <span>{e.date}</span>
          </div>
        ))}
      </div>

      <div className="chart">
        <h4>Category-wise Spending</h4>
        <Pie data={pieData} />
      </div>
    </div>
  );
}
