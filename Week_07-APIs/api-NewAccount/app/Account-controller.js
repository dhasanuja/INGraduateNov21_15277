const db=require('../db/models');//index.js=>db

const Account=db.Account;

// 1. select * from Accounts => findAll

exports.findAll=(req,resp)=>{

    Account.findAll()

        .then(data=>resp.json(data))

        .catch(err=>{

            resp.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });

};

// 2. seelct * from Accounta where id=?=>findByPK

exports.findByPk=(req,resp)=>{

    const id=parseInt(req.params.id);

    Account.findByPk(id)

        .then(data=>resp.json(data))

        .catch(err=>{

            resp.status(500)

                .send({message:err.message||

                `Something went wrong`})

        });

};

//3.//  INSERT INTO public."Accounts"(
// id, "firstName", "lastName", "createdAt", "updatedAt")
// VALUES (?, ?, ?, ?, ?);
exports.create = (req, resp) => {
    if(!req.body.accno){
        resp.status(400).send({
            message: "Content can not be empty!"
        });
        return;
    }
    const newAccount={
        accno: req.body.accno,
        accaname: req.body.accaname,
        balance:req.body.balance,
        createdAt:new Date(),
        updatedAt:new Date()
    }
    Account.create(newAccount)
        .then(data=>{resp.send(data);})
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Some error Creating new Account data"
            })
        })
}

//4.// UPDATE public."Account"
// 	SET id=?, "firstName"=?, "lastName"=?, "createdAt"=?, "updatedAt"=?
// 	WHERE <condition>;
exports.update = (req, resp) => {
    const id = req.params.id;

    Account.update(req.body, { where: { id: id } })
        .then(num => {
            if (num == 1) {
            resp.send({
                message: `Account with id ${id} updated successfully.`
            });
            } else {
            resp.send({
                message: `Cannot update Account with id=${id}. Maybe Book was not found or req.body is empty!`
            });
            }
        })
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Some error retriving Book data"
            })
        })
}
// DELETE FROM public."Account"
// 	WHERE <condition>;
exports.delete = (req, resp) => {
    const id = req.params.id;
    Account.destroy({ where: { id: id } })
        .then(num => {
            if (num == 1) {
                resp.send({ message: `Account with id=${id} deleted successfully!` });
            } else {
                resp.send({ message: `Cannot delete Account with id=${id}. Maybe Account was not found!` });
            }
        })
        .catch((err) => {
            resp.status(500).send({
                message: err.message || " Could not delete Account with id=" + id
            })
        })
}