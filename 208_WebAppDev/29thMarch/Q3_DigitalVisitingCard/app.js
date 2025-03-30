

import React from "react";

const VisitingCard = ({ name, image, profession, socialLinks, theme }) => {
  const cardStyle = {
    backgroundColor: theme.background,
    color: theme.text,
    border: `2px solid ${theme.border}`,
    borderRadius: "10px",
    padding: "20px",
    textAlign: "center",
    width: "250px",
    boxShadow: "2px 2px 10px rgba(0,0,0,0.1)",
  };

  return (
    <div style={cardStyle}>
      <img
        src={image}
        alt={name}
        style={{ width: "80px", borderRadius: "50%" }}
      />
      <h3>{name}</h3>
      <p>{profession}</p>
      <div>
        {socialLinks.map((link, index) => (
          <a
            key={index}
            href={link.url}
            target="_blank"
            rel="noopener noreferrer"
            style={{ margin: "5px", textDecoration: "none", color: theme.text }}
          >
            {link.platform}
          </a>
        ))}
      </div>
    </div>
  );
};

const App = () => {
  const cards = [
    {
      name: "John Doe",
      image: "https://via.placeholder.com/80",
      profession: "Software Engineer",
      socialLinks: [
        { platform: "LinkedIn", url: "https://linkedin.com" },
        { platform: "GitHub", url: "https://github.com" },
      ],
      theme: { background: "#f8f9fa", text: "#333", border: "#007bff" },
    },
    {
      name: "Jane Smith",
      image: "https://via.placeholder.com/80",
      profession: "Product Manager",
      socialLinks: [
        { platform: "Twitter", url: "https://twitter.com" },
        { platform: "Dribbble", url: "https://dribbble.com" },
      ],
      theme: { background: "#fff0f5", text: "#d63384", border: "#dc3545" },
    },
    {
      name: "Alex Johnson",
      image: "https://via.placeholder.com/80",
      profession: "Data Scientist",
      socialLinks: [
        { platform: "Kaggle", url: "https://kaggle.com" },
        { platform: "Medium", url: "https://medium.com" },
      ],
      theme: { background: "#e3f2fd", text: "#0d6efd", border: "#0d6efd" },
    },
  ];

  return (
    <div style={{ display: "flex", gap: "20px", justifyContent: "center", marginTop: "20px" }}>
      {cards.map((card, index) => (
        <VisitingCard key={index} {...card} />
      ))}
    </div>
  );
};

export default App;
