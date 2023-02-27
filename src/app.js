import express from 'express'
import cors from 'cors'
import dotenv from 'dotenv'
import authRoutes from './routes/authRoutes.js'

dotenv.config()

const PORT  = process.env.PORT || 5000
const app = express()

app.use(express.json())
app.use(cors())

app.use([authRoutes])

app.listen(PORT, console.log(`Server is running on port ${PORT}`))