module.exports=(app)=>{

    const express=require('express');

    const ROUTER=express.Router();
    const  BookController=require('./Book-controller');
    //const UserController=require('./user-controller');

    ROUTER.get('/books',BookController.findAll);

    ROUTER.get('/books/:id',BookController.findByPk);
    ROUTER.post('/books/add',BookController.create);
    ROUTER.put('/books/update/:id',BookController.update);
    ROUTER.delete('/books/delete/:id',BookController.delete);

    //ROUTER.post('/books/add',(req,resp)=>{BookController.create  });

    //ROUTER.put('/books/update/:id',(req,resp)=>{  });

    //ROUTER.delete('/bookss/delete/:id',(req,resp)=>{    });

    //Router.post('/persons/add',PersonControllor.create);
    //PUT url: http://localhost:3500/app/persons/update/:id
    //Router.put('/persons/update/:id',PersonControllor.update);
    //DELETE url: http://localhost:3500/app/persons/delete/:id
    //Router.delete('/persons/delete/:id',PersonControllor.update);  




    app.use('/app',ROUTER);

}