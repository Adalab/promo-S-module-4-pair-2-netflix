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
mysql
  .createConnection({
    host: 'localhost',
    database: 'netflix',
    user: 'root',
    password: 'Irene1',
  })
  .then(connection => {
    connection
    .connect()
    .catch((err) => {
    console.error('Error de conexion: ' + err.stack);
    })
    .then(() => {
    return connection.query('SELECT * FROM movies');
    })
    .then(([results, fields]) => {
    results.forEach((result) => {
    console.log(result);
    });
    })
    .catch((err) => {
    console.error('Error en la query: ' + err.stack);
    });
    })

    app.get('/', function(req,res){
     // VAMOS AQUÍ. NECESITAMOS HHACER UN ENDPOINT PARA QUE IMPRIMA, LO DE DESPUÉS ESTÁ HECHO PERO ESTO FALTABA. sOLO EL ENDPOINT
    })