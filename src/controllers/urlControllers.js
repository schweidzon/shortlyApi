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

export async function getUrlById(req, res) {

    const { id } = req.params

    try {

        const shortUrl = await db.query(`SELECT id, "shortUrl", url FROM urls WHERE id = $1`, [id])

        if (!shortUrl.rows[0]) return res.sendStatus(404)

        res.status(200).send(shortUrl.rows[0])

    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)

    }

}

export async function getUsersUrls(req, res) {

    const token = res.locals.token

    try {
        const user = await db.query(`SELECT users.id, users.name
         FROM sessions JOIN users ON sessions.user_id = users.id  JOIN urls ON user_token = $1 WHERE token = $1 GROUP BY users.id`, [token])
        const usersUrls = await db.query(`SELECT json_agg(json_build_object('id', urls.id, 'shortUrl', urls."shortUrl", 'url', urls.url, 'visitCount', urls."visitCount")) AS "shortenedUrls"
        FROM urls
        WHERE user_token = $1`, [token])

        const totalVistCount = (usersUrls.rows[0].shortenedUrls).reduce((acc, curr) => acc + parseInt(curr.visitCount), 0)
        user.rows[0].visitCount = totalVistCount
        user.rows[0].shortenedUrls = usersUrls.rows[0].shortenedUrls

        res.status(200).send(user.rows[0])

    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)

    }
}

export async function redirectToUrl(req, res) {
    const { shortUrl } = req.params

    try {

        const url = await db.query(`SELECT * FROM urls where "shortUrl" = $1`, [shortUrl])

        if (!url.rows[0]) return res.sendStatus(404)

        await db.query(`UPDATE urls SET "visitCount" = "visitCount" + 1 WHERE id = $1`, [url.rows[0].id])


        res.redirect(url.rows[0].url)
    } catch (error) {
        console.log(error.message)
        return res.status(500).send(error.message)

    }
}