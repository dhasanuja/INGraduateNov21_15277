const db=require('../db/models');//index.js=>db

const Book=db.Book;

// 1. select * from users => findAll

exports.findAll=(req,resp)=>{

    Book.findAll()

        .then(data=>resp.json(data))

        .catch(err=>{

            resp.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });

};

// 2. seelct * from users where id=?=>findByPK

exports.findByPk=(req,resp)=>{

    const id=parseInt(req.params.id);

    Book.findByPk(id)

        .then(data=>resp.json(data))

        .catch(err=>{

            resp.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });

};

//3.//  INSERT INTO public."People"(
// id, "firstName", "lastName", "createdAt", "updatedAt")
// VALUES (?, ?, ?, ?, ?);
exports.create = (req, resp) => {
    if(!req.body.bookname){
        resp.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }
    const newBook={
        bookname: req.body.bookname,
        authorname: req.body.authorname,
        createdAt:new Date(),
        updatedAt:new Date()
    }
    Book.create(newBook)
        .then(data=>{resp.send(data);})
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Some error Creating new Person data"
            })
        })
}

//4.// UPDATE public."People"
// 	SET id=?, "firstName"=?, "lastName"=?, "createdAt"=?, "updatedAt"=?
// 	WHERE <condition>;
exports.update = (req, resp) => {
    const id = req.params.id;

    Book.update(req.body, { where: { id: id } })
        .then(num => {
            if (num == 1) {
            resp.send({
                message: `Book with id ${id} updated successfully.`
            });
            } else {
            resp.send({
                message: `Cannot update Book with id=${id}. Maybe Book was not found or req.body is empty!`
            });
            }
        })
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Some error retriving Book data"
            })
        })
}
// DELETE FROM public."People"
// 	WHERE <condition>;
exports.delete = (req, resp) => {
    const id = req.params.id;
    Book.destroy({ where: { id: id } })
        .then(num => {
            if (num == 1) {
                resp.send({ message: `Book with id=${id} deleted successfully!` });
            } else {
                resp.send({ message: `Cannot delete Book with id=${id}. Maybe Book was not found!` });
            }
        })
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Could not delete Book with id=" + id
            })
        })
}