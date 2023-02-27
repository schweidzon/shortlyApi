import { nanoid } from "nanoid";
import db from "../config/database.js";

export async function shortenUrl(req, res) {

    const { url } = req.body

    const token = res.locals.token

    const shortUrl = nanoid()
    console.log(shortUrl)


    try {

        const urlInsertion = await db.query(`INSERT INTO urls (user_token, url, "shortUrl") VALUES ($1, $2, $3) RETURNING id`, [token, url, shortUrl])

        res.status(201).send({ id: urlInsertion.rows[0].id, shortUrl })

    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)

    }

}