const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// MySQL Connection Configuration
const db = mysql.createConnection({
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASSWORD || 'netflix_pass',
    database: process.env.DB_NAME || 'netflix_db'
});

db.connect((err) => {
    if (err) throw err;
    console.log('Connected to MySQL Database');
});

// Login Endpoint
app.post('/api/login', (req, res) => {
    const { email, password } = req.body;
    
    // As per your requirement: Validate against DB but allow for testing
    const sql = "SELECT * FROM users WHERE email = ? AND password = ?";
    db.query(sql, [email, password], (err, results) => {
        if (err) return res.status(500).json({ error: err.message });
        
        if (results.length > 0) {
            res.json({ success: true, message: "Login successful!" });
        } else {
            // For testing purposes: "Accept any" logic could be added here
            res.status(401).json({ success: false, message: "Invalid credentials" });
        }
    });
});

app.listen(5000, '0.0.0.0', () => console.log('Backend running on port 5000'));