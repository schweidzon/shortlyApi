import joi from 'joi'

export const shortenUrlSchema = joi.object( {
    url: joi.string().regex(/^https?:\/\/[a-z0-9\-]+\.[a-z]+(?:\.[a-z]+)?\/?.*$/i).required()
})