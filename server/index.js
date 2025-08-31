const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const testRoute = require('./routes/testRoute')

const app = express();
const PORT = process.env.PORT || 5050;

app.use(cors());
app.use(express.json());

// API routes
app.get('/api/health', (req, res) => {
  res.json({ message: 'Server is running! 🚀' });
});

app.use('/api/test', testRoute)

app.use(express.static(path.join(__dirname, 'public')));
app.get('/{*path}', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// if (process.env.NODE_ENV === 'production') {
//   app.use(express.static(path.join(__dirname, 'public')));
//   app.get('/{*path}', (req, res) => {
//     res.sendFile(path.join(__dirname, 'public', 'index.html'));
//   });
// }

app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on port ${PORT}`);
});