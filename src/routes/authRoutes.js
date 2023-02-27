import { Router } from "express";
import { signIn, signUp } from "../controllers/authControllers.js";
import  { authSignUp ,authSignIn} from "../middlewares/authMid.js";
import { validateSchema } from "../middlewares/validateSchemas.js";
import { signInSchema, signUpSchema } from "../schemas/authSchemas.js";

const authRoutes = Router()

authRoutes.get("/signup",validateSchema(signUpSchema),authSignUp, signUp)
authRoutes.get("/signin",validateSchema(signInSchema), authSignIn, signIn)

export default authRoutes