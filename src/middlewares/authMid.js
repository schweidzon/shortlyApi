import bcrypt from 'bcrypt'
import db from '../config/database.js'

export async function authSignUp(req, res, next) {
    const user = req.body
    
    try {
        const checkUserExist = await db.query(`SELECT * FROM users WHERE email = '${user.email}'`)

        if(checkUserExist.rows[0]) return res.sendStatus(409)

        next()
        
    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)
    }

}