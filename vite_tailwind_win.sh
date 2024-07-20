#!/bin/bash

echo "Enter your project name (no spaces):"
read -p "> " PROJECT_NAME

mkdir ${PROJECT_NAME}client && cd $_

echo "Enter the SSH address for your Github repository:"
read -p "> " REPO_NAME

npm create vite@latest . -- --template react
npm install -D tailwindcss postcss autoprefixer react-router-dom
npx tailwindcss init -p
curl -L -s 'https://raw.githubusercontent.com/vitejs/vite/main/.gitignore' > .gitignore

mkdir ./src/components
mkdir ./src/components/auth
mkdir ./src/components/services
mkdir ./src/components/nav
touch ./src/components/auth/Login.css
touch ./src/components/auth/Register.jsx
touch ./src/components/auth/Login.jsx
touch ./src/components/services/userServices.jsx
touch ./src/components/ApplicationViews.jsx
touch ./src/components/Authorized.jsx
touch ./src/components/nav/Navbar.jsx
touch ./src/components/nav/Navbar.css

cat <<EOL > ./tailwind.config.js
/** @type {import("tailwindcss").Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
EOL

cat <<EOL > ./src/index.css
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

cat <<EOL > ./src/components/services/userServices.jsx
export const getCurrentUser = () => {
    return fetch("http://localhost:8000/current_user", {
        headers: {
            Authorization: "Token + " " + JSON.parse(localStorage.getItem('${PROJECT_NAME}_token')).token",
            "Content-Type": "application/json"
        }
    }).then(res => res.json())
}
EOL

cat <<EOL > ./src/components/auth/Register.jsx
import React, { useRef, useState } from "react"
import { Link, useNavigate } from "react-router-dom";
import "./Login.css"

export const Register = () => {
    const [email, setEmail] = useState("admina@straytor.com")
    const [password, setPassword] = useState("straytor")
    const [firstName, setFirstName] = useState("Admina")
    const [lastName, setLastName] = useState("Straytor")
    const existDialog = useRef()
    const navigate = useNavigate()

    const handleRegister = (e) => {
        e.preventDefault()
        fetch("http://localhost:8000/register", {
            method: "POST",
            body: JSON.stringify({
                email,
                password,
                first_name: firstName,
                last_name: lastName
            }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(res => res.json())
            .then(authInfo => {
                if (authInfo && authInfo.token) {
                    localStorage.setItem("${PROJECT_NAME}_token", JSON.stringify(authInfo))
                    navigate("/")
                } else {
                    existDialog.current.showModal()
                }
            })
    }

    return (
        <main className="container--login">
            <dialog className="dialog dialog--auth" ref={existDialog}>
                <div>User does not exist</div>
                <button className="button--close" onClick={e => existDialog.current.close()}>Close</button>
            </dialog>

            <section>
                <form className="form--login" onSubmit={handleRegister}>
                    <h1 className="text-4xl mt-7 mb-3">${PROJECT_NAME}</h1>
                    <h2 className="text-xl mb-10">Register new account</h2>
                    <fieldset className="mb-4">
                        <label htmlFor="firstName"> First name </label>
                        <input type="text" id="firstName"
                            value={firstName}
                            onChange={evt => setFirstName(evt.target.value)}
                            className="form-control"
                            placeholder=""
                            required autoFocus />
                    </fieldset>
                    <fieldset className="mb-4">
                        <label htmlFor="lastName"> Last name </label>
                        <input type="text" id="lastName"
                            value={lastName}
                            onChange={evt => setLastName(evt.target.value)}
                            className="form-control"
                            placeholder=""
                            required autoFocus />
                    </fieldset>
                    <fieldset className="mb-4">
                        <label htmlFor="inputEmail"> Email address </label>
                        <input type="email" id="inputEmail"
                            value={email}
                            onChange={evt => setEmail(evt.target.value)}
                            className="form-control"
                            placeholder="Email address"
                            required autoFocus />
                    </fieldset>
                    <fieldset className="mb-4">
                        <label htmlFor="inputPassword"> Password </label>
                        <input type="password" id="inputPassword"
                            value={password}
                            onChange={evt => setPassword(evt.target.value)}
                            className="form-control"
                            placeholder="Password"
                        />
                    </fieldset>
                    <fieldset>
                        <button type="submit" className="button p-3 rounded-md bg-blue-800 text-blue-100">
                            Register
                        </button>
                    </fieldset>
                </form>
            </section>
            <div className="loginLinks">
                <section className="link--register">
                    <Link className="underline text-blue-600 hover:text-blue-800 visited:text-purple-600" to="/login">Already have an account?</Link>
                </section>
            </div>
        </main>
    )
}
EOL

cat <<EOL > ./src/components/auth/Login.jsx
import { useRef, useState } from "react"
import { Link, useNavigate } from "react-router-dom";
import "./Login.css"

export const Login = () => {
    const [email, setEmail] = useState("steve@brownlee.com")
    const [password, setPassword] = useState("brownlee")
    const existDialog = useRef()
    const navigate = useNavigate()

    const handleLogin = (e) => {
        e.preventDefault()
        fetch("http://localhost:8000/login", {
            method: "POST",
            body: JSON.stringify({ email, password }),
            headers: {
                "Content-Type": "application/json"
            }
        })
            .then(res => res.json())
            .then(authInfo => {
                if (authInfo.valid) {
                    localStorage.setItem("${PROJECT_NAME}_token", JSON.stringify(authInfo))
                    navigate("/")
                } else {
                    existDialog.current.showModal()
                }
            })
    }

    return (
        <main className="container--login">
            <dialog className="dialog dialog--auth" ref={existDialog}>
                <div>User does not exist</div>
                <button className="button--close" onClick={e => existDialog.current.close()}>Close</button>
            </dialog>

            <section>
                <form className="form--login" onSubmit={handleLogin}>
                    <h1 className="text-4xl mt-7 mb-3">${PROJECT_NAME}</h1>
                    <h2 className="text-xl mb-10">Please sign in</h2>
                    <fieldset className="mb-4">
                        <label htmlFor="inputEmail"> Email address </label>
                        <input type="email" id="inputEmail"
                            value={email}
                            onChange={evt => setEmail(evt.target.value)}
                            className="form-control"
                            placeholder="Email address"
                            required autoFocus />
                    </fieldset>
                    <fieldset className="mb-4">
                        <label htmlFor="inputPassword"> Password </label>
                        <input type="password" id="inputPassword"
                            value={password}
                            onChange={evt => setPassword(evt.target.value)}
                            className="form-control"
                            placeholder="Password"
                        />
                    </fieldset>
                    <fieldset>
                        <button type="submit" className="button">
                            Sign in
                        </button>
                    </fieldset>
                </form>
            </section>
            <div className="loginLinks">
                <section className="link--register">
                    <Link to="/register">Not a member yet?</Link>
                </section>
            </div>
        </main>
    )
}
EOL

cat <<EOL > ./src/components/Authorized.jsx
import { Navigate, Outlet } from "react-router-dom"
import { NavBar } from "./nav/Navbar.jsx"

export const Authorized = () => {
  if (localStorage.getItem("${PROJECT_NAME}_token")) {
    return <>
      <NavBar />
      <main className="p-4">
        <Outlet />
      </main>
    </>
  }
  return <Navigate to="/login" replace />
}
EOL

cat <<EOL > ./src/components/ApplicationViews.jsx
import { BrowserRouter, Route, Routes } from "react-router-dom"
import { Authorized } from "./Authorized"
import { Login } from "./auth/Login.jsx"
import { Register } from './auth/Register.jsx'
import App from "../App.jsx"


export const ApplicationViews = () => {

    return <BrowserRouter>
        <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />
            <Route element={<Authorized />}>
                <Route path="/" element={<App />} />
            </Route>
        </Routes>
    </BrowserRouter>
}
EOL

cat <<EOL > ./src/App.jsx
import { Route, Routes } from "react-router-dom"
import "./App.css"
import { Login } from "./components/auth/Login.jsx"
import { Register } from "./components/auth/Register.jsx"
import { ApplicationViews } from "./components/views/ApplicationViews.jsx"
import { Authorized } from "./components/views/Authorized.jsx"

function App() {

    return (
        <Routes>
            <Route path="/login" element={<Login />} />
            <Route path="/register" element={<Register />} />

            <Route path="*" element={
                    <Authorized>
                        <ApplicationViews />
                    </Authorized>
                }
            />
        </Routes>
      )
}

export default App
EOL

cat <<EOL > ./src/components/nav/Navbar.jsx
import { NavLink, useNavigate } from "react-router-dom"
import "./Navbar.css"

export const NavBar = () => {
    const navigate = useNavigate()
    return (
        <ul className="navbar pb-10">
            {
                (localStorage.getItem("${PROJECT_NAME}_token") !== null) ?
                <>
                    <li className="navbar__item">
                        <NavLink className="text-left underline text-blue-600 hover:text-purple-700" to={"/"}>Link1</NavLink>
                    </li>
                    <li className="navbar__item">
                        <NavLink to={"/"}>Link2</NavLink>
                    </li>
                    <li className="navbar__item">
                        <button 
                            onClick={() => {
                                localStorage.removeItem("${PROJECT_NAME}_token")
                                navigate('/login')
                            }}
                        >Logout</button>
                    </li>
                </> :
                <>
                    <li className="navbar__item">
                        <NavLink  to={"/login"}>Login</NavLink>
                    </li>
                    <li className="navbar__item">
                        <NavLink to={"/register"}>Register</NavLink>
                    </li>
                </>
            }
        </ul>
    )
}
EOL

git init
git checkout -b main
# git remote add origin ${REPO_NAME}
# git add .
# git commit -m "Initial commit"
# git push -u origin main

echo "**********************************"
echo ""
echo "Double check your files and Github repository to make sure everything installed correctly."
echo "Run _npm run dev_ in your project root (${PROJECT_NAME}client) to run your project."
echo ""
echo "**********************************"
