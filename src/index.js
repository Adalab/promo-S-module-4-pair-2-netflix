const express = require('express');
const cors = require('cors');
const path = require ('path');

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
    password: '@PW2q^G$7$',
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

    // server.get('/movies', function(req,res){
    //   connection
    //   .query('SELECT * FROM movies')
    //   .then(([results, fields]) => {
    //     res.json({success: true, movies: results});
    //   })
    //   .catch((err) => {
    //     throw err;
    //   });
    // })

    server.get('/movies', function (req, res){
      const select= req.query.genre
      const sort=req.query.sort
      let sql;
      console.log(req.query);

      //condicional para las distintas posibilidades de seleccion por genero y de ordenacion, ascendente o descendente
     
      if(select==='')   {        
        if(sort==='asc'){
          sql =`SELECT * FROM movies ORDER BY title ASC`;
        }else if(sort==='desc'){
          sql =`SELECT * FROM movies ORDER BY title DESC`;
        }
      }else if(select!==''){
        if(sort==='asc'){
          sql =`SELECT * FROM movies WHERE genre LIKE ? ORDER BY title ASC`;
        }else if(sort==='desc'){
          sql =`SELECT * FROM movies WHERE genre LIKE ? ORDER BY title DESC`;
        }
      }
      
      connection
      .query(sql, [select])
      .then(([results, fields]) => {
        res.json(results);
      })
      .catch((err) => {
        throw err;
      });
    })
    

    //Login de la pagina
    
    server.post('/login', function (req, res) {
      connection
    .query('SELECT * FROM users WHERE email = ? AND password = ?;', [req.body.email, req.body.password])
    .then(([results, fields]) => {
      // Devolvemos el resultado de la query:
      console.log(results)
      if (results.length === 1) {
        res.json({
          success: true,
          userId: results[0].idUSer
        });
      } else {
        res.json({
          success: false,
          errorMessage: "Usuaria/o no encontrada/o"
        });
      }
    })
    .catch((err) => {
      throw err;
    });
});

//Configurar servidor de estaticos

const staticServerPath = './src/public-react';
server.use (express.static(staticServerPath));

//Configurar servidor de estaticos para fotos

const staticImagesPathWeb = './src/public-movies-images';
server.use (express.static(staticImagesPathWeb));

//Endpoint para motor de plantillas

server.get('/movie/:id', (req, res) => {
  const URLParams = req.params.id;
  console.log(URLParams);

  connection
  .query('SELECT * FROM movies WHERE id = ?', [URLParams])
  
  .then(([foundMovie, fields]) => {
        console.log(foundMovie);
        res.json(foundMovie);
      })
      .catch((err) => {
        throw err;
      });
  

});