
const express = require('express');
const { Pool } = require('pg');

const app = express();

// Database connection details
const pool = new Pool({
  user: 'postgres',
  password: 'postgres',
  host: 'rds-postgres.cppgpj9bgk45.us-east-1.rds.amazonaws.com',
  database: 'nhl_players',
  port: 5432,
});

// Define a GET endpoint to retrieve data from the database
//app.get('/api/data', async (req, res) => {
//  try {
//    const client = await pool.connect();
//    const result = await client.query('SELECT * FROM players');
//    res.json(result.rows);
//    client.release();
//  } catch (err) {
//    console.error('Error executing query', err);
    //res.status(500).json({ error: 'Internal Server Error' });
  //}
//});

app.get('/api/records', (req, res) => {
  pool.query('select * from players', (err, result) => {
    if (err) {
      console.error('Error executing query', err);
      res.status(500).json({ error: 'Internal server error' });
    } else {
      res.json(result.rows);
    }
  });
});


// Start the server
const port = 3000;
app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
