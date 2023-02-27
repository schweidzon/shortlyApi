import bcrypt from 'bcrypt'
import db from '../config/database.js'
import { v4 as uuidV4 } from "uuid"

export async function authValidation(req, res, next) {
    const user = req.body

    const { authorization } = req.headers
   

    const token = authorization?.replace("Bearer ", "")
   

    if (!token) return res.sendStatus(401)

    res.locals.token = token

    

    try {
        const checkSession = await db.query(`SELECT * FROM sessions WHERE token = '${token}'`)
       

        if (!checkSession.rows[0]) return res.sendStatus(401)

        const checkUserExist = await db.query(`SELECT * FROM users WHERE id = $1`, [checkSession.rows[0].user_id])

        if (!checkUserExist.rows[0]) return res.sendStatus(401)

      

        next()
    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)

    }
}

export async function authSignUp(req, res, next) {
    const user = req.body

    try {
        const checkUserExist = await db.query(`SELECT * FROM users WHERE email = '${user.email}'`)

        if (checkUserExist.rows[0]) return res.sendStatus(409)

        next()

    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)
    }

}


export async function authSignIn(req, res, next) {
    const user = req.body
    console.log(user)

    const token = uuidV4()

    res.locals.token = token

    try {

        const checkUserExist = await db.query(`SELECT * FROM users WHERE email = '${user.email.toLowerCase()}'`)


        if (!checkUserExist.rows[0]) return res.status(401).send("Usuário ou senha incorretos")

        const checkPassword = bcrypt.compareSync(user.password, checkUserExist.rows[0].password)


        if (!checkPassword) return res.status(401).send("Usuário ou senha incorretos")

        await db.query(`INSERT INTO sessions (user_id, token) VALUES ('${checkUserExist.rows[0].id}', '${token}')`)

        next()

    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)

    }

}