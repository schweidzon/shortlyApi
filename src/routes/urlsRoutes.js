import { Router } from "express";
import { deleteUserUrl, getUrlById, getUsersRaking, getUsersUrls, redirectToUrl, shortenUrl } from "../controllers/urlControllers.js";
import { authValidation } from "../middlewares/authMid.js";
import { validateSchema } from "../middlewares/validateSchemas.js";
import { shortenUrlSchema } from "../schemas/urlSchemas.js";

const urlRoutes = Router()

urlRoutes.post("/urls/shorten", validateSchema(shortenUrlSchema), authValidation, shortenUrl)
urlRoutes.get("/urls/:id", getUrlById)
urlRoutes.get("/users/me", authValidation, getUsersUrls)
urlRoutes.get("/urls/open/:shortUrl", redirectToUrl)
urlRoutes.delete("/urls/:id", authValidation, deleteUserUrl)
urlRoutes.get("/ranking", getUsersRaking)

export default urlRoutes