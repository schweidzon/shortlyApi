import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import authRoutes from './routes/authRoutes.js'
import urlRoutes from './routes/urlsRoutes.js'

dotenv.config()

const PORT  = process.env.PORT || 5000
const app = express()

app.use(express.json())
app.use(cors())

app.use([authRoutes, urlRoutes])

app.listen(PORT, console.log(`Server is running on port ${PORT}`))