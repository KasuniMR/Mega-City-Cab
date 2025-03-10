<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Materialize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Poppins', sans-serif;
        }
        .signup-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .signup-image {
            max-width: 100%;
            border-radius: 10px;
            box-shadow: 3px 3px 15px rgba(0,0,0,0.3);
        }
        .card {
            background: #1e1e1e;
            border-radius: 10px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
        }
        .card-title {
            color: #4caf50;
        }
        .input-field input {
            color: #e0e0e0;
        }
        .input-field label {
            color: #b0b0b0;
        }
        .input-field input:focus + label {
            color: #4caf50 !important;
        }
        .input-field input:focus {
            border-bottom: 2px solid #4caf50 !important;
            box-shadow: none !important;
        }
        .btn {
            background-color: #4caf50;
            width: 100%;
            margin-top: 10px;
        }
        .btn:hover {
            background-color: #388e3c;
        }
        .link-style {
            text-decoration: none;
            color: #4caf50;
            font-weight: bold;
            display: block;
            text-align: center;
        }
        .link-style:hover {
            color: #66bb6a;
        }
    </style>
</head>

<body class="container">
    <div class="container">
        <div class="row signup-container">

            <!-- Signup Card Section (Right Side) -->
            <div class="col s12 m6 offset-m1">
                <div class="card">
                    <div class="card-content">
                        <span class="card-title center-align">Registration Form</span>
                        <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
                            <div class="input-field">
                                <input type="text" id="name" name="name" required>
                                <label for="name">Full Name</label>
                            </div>
                            <div class="input-field">
                                <input type="text" id="address" name="address" required>
                                <label for="address">Address</label>
                            </div>
                            <div class="input-field">
                                <input type="number" id="contact" name="contact" required>
                                <label for="contact">Contact</label>
                            </div>
                            <div class="input-field">
                                <input type="email" id="uname" name="uname" required>
                                <label for="uname">User Name</label>
                            </div>
                            <div class="input-field">
                                <input type="password" id="password" name="password" required>
                                <label for="password">Password</label>
                            </div>
                            <button type="submit" id="register" class="btn waves-effect waves-light">Register</button>
                            <button type="reset" class="btn waves-effect waves-light">Clear</button>
                        </form>
                        <br>
                        <p class="center-align">Already have an account?</p>
                        <a href="Login.jsp" class="link-style">Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Materialize JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>