import { Router } from "express";
import { shortenUrl } from "../controllers/urlControllers.js";
import { authValidation } from "../middlewares/authMid.js";
import { validateSchema } from "../middlewares/validateSchemas.js";
import { shortenUrlSchema } from "../schemas/urlSchemas.js";

const urlRoutes = Router()

urlRoutes.post("/urls/shorten", validateSchema(shortenUrlSchema), authValidation, shortenUrl)

export default urlRoutes