<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Retrieve user session
    HttpSession userSession = request.getSession(false);
    String username = (userSession != null) ? (String) userSession.getAttribute("username") : null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - Ridek Taxi Booking</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #121212;
            color: #e0e0e0;
        }
        .navbar, .footer {
            background-color: #1e1e1e;
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important;
        }
        .nav-link:hover {
            color: #4caf50 !important;
        }
        .blog-header {
            background: linear-gradient(to right, #2e7d32, #1b5e20);
            padding: 50px 0;
            text-align: center;
            color: white;
        }
        .card {
            background-color: #1e1e1e;
            color: #e0e0e0;
            border: none;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .btn-success {
            background-color: #4caf50;
            border: none;
        }
        .btn-success:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">MEGA CITY<span class="text-success">CAB</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="booking.jsp">Cars</a></li>
                <li class="nav-item"><a class="nav-link active" href="blog.jsp">Blog</a></li>
                <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>
    
<!-- Blog Header -->
<header class="blog-header">
    <div class="container">
        <h1 class="display-4 fw-bold">OUR BLOG & NEWS​</h1>
        <p class="lead">Stay updated with the latest insights and news about Mega City Cab services.</p>
    </div>
</header>

<!-- Blog Posts Section -->
<main class="container my-5">
    <div class="row">
        <div class="col-md-6">
            <article class="card mb-4">
                <img src="<%=request.getContextPath() + "/images/blog1.jpg"%>" class="card-img-top" alt="Blog Post 1">
                <div class="card-body">
                    <h2 class="card-title">How Ridek is Revolutionizing Taxi Booking</h2>
                    <p class="card-text">Discover how Ridek is transforming the taxi industry with innovation and technology...</p>
                    <a href="post1.jsp" class="btn btn-success">Read More</a>
                </div>
            </article>
        </div>
        <div class="col-md-6">
            <article class="card mb-4">
                <img src="<%=request.getContextPath() + "/images/blog2.jpg"%>" class="card-img-top" alt="Blog Post 2">
                <div class="card-body">
                    <h2 class="card-title">Top 5 Features of Ridek Taxi Service</h2>
                    <p class="card-text">Explore the features that make Ridek a preferred choice for travelers...</p>
                    <a href="post2.jsp" class="btn btn-success">Read More</a>
                </div>
            </article>
        </div>
    </div>
</main>
    
<!-- Footer -->
<footer class="bg-dark text-white py-5 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5 class="fw-bold">CAR<span class="text-success">BOOK</span></h5>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                <div class="d-flex">
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter fa-lg"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook-f fa-lg"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-instagram fa-lg"></i></a>
                </div>
            </div>
            <div class="col-md-3">
                <h5>Information</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">About</a></li>
                    <li><a href="#" class="text-white">Services</a></li>
                    <li><a href="#" class="text-white">Term and Conditions</a></li>
                    <li><a href="#" class="text-white">Best Price Guarantee</a></li>
                    <li><a href="#" class="text-white">Privacy & Cookies Policy</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Customer Support</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">FAQ</a></li>
                    <li><a href="#" class="text-white">Payment Option</a></li>
                    <li><a href="#" class="text-white">Booking Tips</a></li>
                    <li><a href="#" class="text-white">How it works</a></li>
                    <li><a href="#" class="text-white">Contact Us</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Have a Questions?</h5>
                <p><i class="fas fa-map-marker-alt me-2"></i>203 Fake St. Mountain View, San Francisco, California, USA</p>
                <p><i class="fas fa-phone me-2"></i>+2 392 3929 210</p>
                <p><i class="fas fa-envelope me-2"></i>info@yourdomain.com</p>
            </div>
        </div>
        <div class="text-center mt-4">
            <p>Copyright &copy;2025 All rights reserved | This template is made with <i class="fas fa-heart text-danger"></i> by Colorlib</p>
        </div>
    </div>
</footer>

    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
