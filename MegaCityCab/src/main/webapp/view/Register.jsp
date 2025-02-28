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
        /* Custom styles for alignment */
        .signup-container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh; /* Full height */
        }
        .signup-image {
            max-width: 100%; /* Makes sure image is responsive */
            border-radius: 10px; /* Optional: Rounds image corners */
            box-shadow: 3px 3px 10px rgba(0,0,0,0.2); /* Optional: Adds shadow */
        }
        .link-style {
            text-decoration: none;
            color: #2196F3;
            font-weight: bold;
            display: block;
            margin-top: 15px;
            text-align: center;
        }
        .link-style:hover {
            color: #0b7dda; /* Darker blue on hover */
        }
      
    </style>
</head>

<body class="container" align="center">
<div class="container">
   <div class="row signup-container">

       <!-- Image Section (Left Side) -->
         <div class="col s12 m5">
            <img src="images/reg.jpg" class="responsive-img signup-image">
         </div>

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
                            <button type="submit" class="btn waves-effect waves-light full-width">Login</button>
                            <button type="reset" class="btn waves-effect waves-light full-width">Clear</button>
                        </form>
                        <br>
                        <p>Already have an account? </p> <a href="Login.jsp" class="link-style">Login</a>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- Materialize JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

</body>
</html>
