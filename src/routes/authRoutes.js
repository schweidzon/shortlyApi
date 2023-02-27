import { Router } from "express";
import { signIn, signUp } from "../controllers/authControllers.js";
import  { authSignUp ,authSignIn} from "../middlewares/authMid.js";
import { validateSchema } from "../middlewares/validateSchemas.js";
import { signInSchema, signUpSchema } from "../schemas/authSchemas.js";

const authRoutes = Router()

authRoutes.post("/signup", signUp)
authRoutes.post("/signin",validateSchema(signInSchema), authSignIn, signIn)

export default authRoutes