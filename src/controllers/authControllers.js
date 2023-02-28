import db from "../config/database.js";
import bcrypt from 'bcrypt'

export async function signUp(req, res) {
    const user = req.body
    
    const encryptPassword = bcrypt.hashSync(user.password, 10);
    

    try {
        await db.query(`INSERT INTO users (name, email, password) VALUES ('${user.name}', LOWER('${user.email}'), '${encryptPassword}')`);
        return res.sendStatus(201);
    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)
    }
}

export async function signIn(req, res) {    
    const token = res.locals.token
    try {
        const result = await db.query(`SELECT * FROM sessions WHERE token = '${token}'`);
        return res.status(200).send({token: result.rows[0].token});
    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)
        
    }

}