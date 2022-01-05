const express = require('express');
const server = express();
const port=3000;
const cors=require('cors');
const { response } = require('express');


const CORS_OPTIONS= {

    origin: 'http://localhost:4200',

    optionsSuccessStatus: 200 

  }

  server.use(express.json());

  server.use(express.urlencoded({extended:true}));
  server.use(cors(CORS_OPTIONS));
  const USERS=[
      {
          id:1,userName:"Anuja"
      },
      {
        id:2,userName:"dhas"
    }
  ];


  server.get('/',(req,resp)=>{
    resp.send("express is working");

});

server.get('/users',(req,resp)=>{
    resp.setHeader("Content-Type","application/json");
    resp.send(USERS);

});

server.listen(port,()=>{

    console.log("http://localhost:3000 started ");

});