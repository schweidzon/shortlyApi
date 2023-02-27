import { Router } from "express";
import { signUp } from "../controllers/authControllers.js";
import { authSignUp } from "../middlewares/authMid.js";
import { validateSchema } from "../middlewares/validateSchemas.js";
import { signUpSchema } from "../schemas/authSchemas.js";

const authRoutes = Router()

authRoutes.get("/signup",validateSchema(signUpSchema),authSignUp, signUp)

export default authRoutes