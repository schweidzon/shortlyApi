import db from "../config/database.js";
import bcrypt from 'bcrypt'

export async function signUp(req, res) {
    const user = req.body
    const encryptPassword = bcrypt.hashSync(user.password, 10)
    

    try {
        await db.query(`INSERT INTO users (name, email, password) VALUES ('${user.name}', LOWER('${user.email}'), '${encryptPassword}')`)
        res.sendStatus(201) 
    } catch (error) {
        console.log(error)
    }
}

export async function signIn(req, res) {    
    const token = res.locals.token
    try {
        const result = await db.query(`SELECT * FROM sessions WHERE token = '${token}'`)
        res.status(200).send(result.rows[0].token)
    } catch (error) {
        
    }

}