import { Router } from "express";
import { shortenUrl } from "../controllers/urlConstrollers.js";
import { authValidation } from "../middlewares/authMid.js";
import { validateSchema } from "../middlewares/validateSchemas.js";
import { shortenUrlSchema } from "../schemas/urlSchemas.js";

const urlRoutes = Router()

urlRoutes.post("/url/shorten", authValidation, validateSchema(shortenUrlSchema), shortenUrl)

export default urlRoutes