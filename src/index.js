const express = require('express');
const cors = require('cors');

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

const mysql = require('mysql2/promise');
let connection;

mysql
  .createConnection({
    host: 'localhost',
    database: 'netflix',
    user: 'root',
    password: 'Irene1',
  })
  .then((conn) => {
    connection=conn;
    connection
    .connect()
    .catch((err) => {
    console.error('Error de conexion: ' + err.stack);
    })
    
    
    .catch((err) => {
    console.error('Error en la query: ' + err.stack);
    });
    })

    server.get('/movies', function(req,res){
      connection
      .query('SELECT * FROM movies')
      .then(([results, fields]) => {
        res.json({success: true, movies: results});
      })
      .catch((err) => {
        throw err;
      });
    })