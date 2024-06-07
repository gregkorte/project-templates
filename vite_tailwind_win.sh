#!/bin/bash

echo "Enter your project name (no spaces):"
read -p "> " PROJECT_NAME

mkdir ${PROJECT_NAME} && cd $_

echo "Enter the SSH address for your Github repository:"
read -p "> " REPO_NAME

npm create vite@latest . -- --template react
npm install -D tailwindcss postcss autoprefixer react-router-dom
npx tailwindcss init -p
curl -L -s 'https://raw.githubusercontent.com/vitejs/vite/main/.gitignore' > .gitignore

mkdir ./src/components
mkdir ./src/components/auth
touch ./src/components/auth/Register.jsx
touch ./src/components/auth/Login.jsx
touch ./src/components/auth/Login.css
mkdir ./src/components/services
touch ./src/components/services/userServices.jsx
mkdir ./src/components/views
touch ./src/components/views/ApplicationViews.jsx
touch ./src/components/views/Authorized.jsx

echo '
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
' > ./tailwind.config.js

echo '
@tailwind base;
@tailwind components;
@tailwind utilities;
' > ./src/index.css

echo '
export const getUserByEmail = (email) => {
  return fetch(`http://localhost:8088/users?email=${email}`).then((res) =>
    res.json()
  )
}

export const createUser = (customer) => {
  return fetch("http://localhost:8088/users", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(customer),
  }).then((res) => res.json())
}
' > ./src/components/services/userServices.jsx

echo '
import { useState } from "react"
import { useNavigate } from "react-router-dom"
import "./Login.css"
import { createUser, getUserByEmail } from "../../services/userServices"

export const Register = (props) => {
  let navigate = useNavigate()

  const registerNewUser = () => {
    createUser(customer).then((createdUser) => {
      if (createdUser.hasOwnProperty("id")) {
        localStorage.setItem(
          "${PROJECT_NAME}_user",
          JSON.stringify({
            id: createdUser.id,
          })
        )

        navigate("/")
      }
    })
  }

  const handleRegister = (e) => {
    e.preventDefault()
    getUserByEmail(customer.email).then((response) => {
      if (response.length > 0) {
        // Duplicate email. No good.
        window.alert("Account with that email address already exists")
      } else {
        // Good email, create user.
        registerNewUser()
      }
    })
  }

  return (
    <main style={{ textAlign: "center" }}>
      <form className="form-login" onSubmit={handleRegister}>
        <h1>${PROJECT_NAME}</h1>
        <h2>Please Register</h2>
        <fieldset>
          <div className="form-group">
            <input
              onChange={updateCustomer}
              type="text"
              id="fullName"
              className="form-control"
              placeholder="Enter your name"
              required
              autoFocus
            />
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <input
              onChange={updateCustomer}
              type="email"
              id="email"
              className="form-control"
              placeholder="Email address"
              required
            />
          </div>
        </fieldset>
        <fieldset>
          <div className="form-group">
            <button className="login-btn btn-info" type="submit">
              Register
            </button>
          </div>
        </fieldset>
      </form>
    </main>
  )
}

' > ./src/components/auth/Register.jsx

echo '
import { useState } from "react"
import { Link } from "react-router-dom"
import { useNavigate } from "react-router-dom"
import "./Login.css"
import { getUserByEmail } from "../../services/userService"

export const Login = () => {
  const [email, set] = useState("ryan@ryantanay.com")
  const navigate = useNavigate()

  const handleLogin = (e) => {
    e.preventDefault()

    getUserByEmail(email).then((foundUsers) => {
      if (foundUsers.length === 1) {
        const user = foundUsers[0]
        localStorage.setItem(
          "${PROJECT_NAME}_user",
          JSON.stringify({
            id: user.id,
          })
        )

        navigate("/")
      } else {
        window.alert("Invalid login")
      }
    })
  }

  return (
    <main className="container-login">
      <section>
        <form className="form-login" onSubmit={handleLogin}>
          <h1>Honey Rae Repairs</h1>
          <h2>Please sign in</h2>
          <fieldset>
            <div className="form-group">
              <input
                type="email"
                value={email}
                onChange={(evt) => set(evt.target.value)}
                className="form-control"
                placeholder="Email address"
                required
                autoFocus
              />
            </div>
          </fieldset>
          <fieldset>
            <div className="form-group">
              <button className="login-btn btn-info" type="submit">
                Sign in
              </button>
            </div>
          </fieldset>
        </form>
      </section>
      <section>
        <Link to="/register">Not a member yet?</Link>
      </section>
    </main>
  )
}

' > .src/components/auth/Login.jsx

echo '
import { Navigate, useLocation } from "react-router-dom"

// We can access child components the same way we access props. Child components are passed to our props as a key/value pair where
// children is the key.

export const Authorized = ({ children }) => {
  let location = useLocation()

  // Check if user is logged in. If they are, render the CHILD components (in this case, the ApplicationViews component)
  if (localStorage.getItem("${PROJECT_NAME}_user")) {
    return children
  }
  // If the user is NOT logged in, redirect them to the login page using the Navigate component from react-router-dom
  else {
    return <Navigate to={`/login`} state={{ from: location }} replace />
  }
}

' > ./src/components/views/Authorized.jsx

echo '
import { useEffect, useState } from "react"

export const ApplicationViews = () => {
    const [currentUser, setCurrentUser] = useState({})

    useEffect(() => {
        const localUser = localStorage.getItem("${PROJECT_NAME}_user")
        const userObject = JSON.parse(localUser)

        setCurrentUser(userObject)
    }, [])

  return (
    <div>And yet another React App...</div>
  )
}
' > ./src/components/views/ApplicationViews.jsx

echo '
import { Route, Routes } from "react-router-dom"
import "./App.css"
import { Login } from "./components/auth/Login.jsx"
import { Register } from "./components/auth/Register.jsx"
import { ApplicationViews } from "./views/ApplicationViews.jsx"
import { Authorized } from "./views/Authorized.jsx"

export const App = () => {


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
' > ./src/App.jsx

git init
git checkout -b main
git remote add origin ${REPO_NAME}
git add .
git commit -m "Initial commit"
git push -u origin main

echo "**********************************"
echo ""
echo "Double check your files and Github repository to make sure everything installed correctly."
echo "Run `npm run dev` in your project root (${PROJECT_NAME}) to run your project."
echo ""
echo "**********************************"
