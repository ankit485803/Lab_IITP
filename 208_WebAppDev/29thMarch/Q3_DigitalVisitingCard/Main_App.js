

// this is our main page of Backend app.js



import React from 'react';



// Card Component
const Card = ({ name, image, profession, socialLinks, bgColor, textColor }) => {
  const cardStyle = {
    backgroundColor: bgColor,
    color: textColor,
    borderRadius: '15px',
    padding: '20px',
    margin: '10px',
    width: '250px',
    textAlign: 'center',
    boxShadow: '0 4px 8px rgba(0,0,0,0.2)',
    fontFamily: 'Arial, sans-serif',
  };

  const imgStyle = {
    width: '100px',
    height: '100px',
    borderRadius: '50%',
    objectFit: 'cover',
    marginBottom: '10px',
  };

  const linkStyle = {
    margin: '5px',
    textDecoration: 'none',
    color: textColor,
    fontWeight: 'bold',
  };

  return (
    <div style={cardStyle}>
      <img src={image} alt="Profile" style={imgStyle} />
      <h3>{name}</h3>
      <p>{profession}</p>
      <div>
        {socialLinks.map((link, index) => (
          <a key={index} href={link.url} style={linkStyle} target="_blank" rel="noreferrer">
            {link.platform}
          </a>
        ))}
      </div>
    </div>
  );
};




// App Component - Parent
const App = () => {
  const cardData = [
    {
      name: "Ankit Kumar",
      image: "https://avatars.githubusercontent.com/u/147314785?v=4",
      profession: "Student at IIT Patna",
      socialLinks: [
        { platform: "GitHub", url: "https://github.com/ankit485803" },
        { platform: "LinkedIn", url: "https://linkedin.com/in/ankit127iitp" },
      ],
      bgColor: "#ffdde1",
      textColor: "#333",
    },
    {
      name: "Rishi Kumar",
      image: "https://i.pravatar.cc/100?img=2",
      profession: "Frontend Developer, Student @ CodeKids",
      socialLinks: [
        { platform: "Twitter", url: "https://twitter.com/rishi" },
        { platform: "GitHub", url: "https://github.com/rishi" },
      ],
      bgColor: "#d0f0fd",
      textColor: "#004466",
    },
    {
      name: "Jyoti Verma",
      image: "https://i.pravatar.cc/100?img=3",
      profession: "UI/UX Designer",
      socialLinks: [
        { platform: "Behance", url: "https://behance.net/jyoti" },
        { platform: "Dribbble", url: "https://dribbble.com/jyoti" },
      ],
      bgColor: "#e0ffe0",
      textColor: "#006600",
    },
  ];

  const containerStyle = {
    display: 'flex',
    justifyContent: 'center',
    flexWrap: 'wrap',
    padding: '20px',
  };

  return (
    <div style={containerStyle}>
      {cardData.map((data, index) => (
        <Card key={index} {...data} />
      ))}
    </div>
  );
};

export default App;



// after this we run three comman in termainal 

// npx create-react-app digital-card-app
// cd digital-card-app
// npm start
