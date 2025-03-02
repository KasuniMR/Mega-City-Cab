<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <title>Car Rental - Home</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">CAR<span class="text-success">BOOK</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="booking.jsp">Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="#blog">Blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact</a></li>
                     <% if (username != null) { %>
                        <li class="nav-item"><a class="nav-link fw-bold" href="profile.jsp">Welcome, <%= username %></a></li>
                        <li class="nav-item"><a class="nav-link text-danger" href="logout.jsp">Logout</a></li>
                    <% } else { %>
                        <li class="nav-item"><a class="nav-link text-primary" href="${pageContext.request.contextPath}/view/Login.jsp">Login</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Hero Section -->
    <section class="hero d-flex align-items-center">
        <div class="container text-center">
            <h1 class="display-4">Fast & Easy Way To Rent A Car</h1>
            <p class="lead">Choose your car and book online within minutes.</p>
            <a href="#booking" class="btn btn-primary btn-lg">Book Now</a>
        </div>
    </section>
    
    <!-- Booking Section -->
    <section class="container mt-5">
        <div class="row">
            <div class="col-md-6 p-4 bg-primary text-white rounded">
                <h3>Make Your Trip</h3>
                <form>
                    <div class="mb-3">
                        <label class="form-label">Pick-up Location</label>
                        <input type="text" class="form-control" placeholder="City, Airport, Station, etc">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Drop-off Location</label>
                        <input type="text" class="form-control" placeholder="City, Airport, Station, etc">
                    </div>
                    <div class="row mb-3">
                        <div class="col">
                            <label class="form-label">Pick-up Date</label>
                            <input type="date" class="form-control">
                        </div>
                        <div class="col">
                            <label class="form-label">Drop-off Date</label>
                            <input type="date" class="form-control">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Rent A Car Now</button>
                </form>
            </div>
        </div>
    </section>
    
    <!-- Featured Vehicles Section -->
    <section class="container mt-5">
        <h2 class="text-center fw-bold">Featured Vehicles</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <img src="<%=request.getContextPath() + "/images/cars1.jpeg" %>" class="card-img-top" alt="Car 1">
                    <div class="card-body text-center">
                        <h5 class="card-title">Mercedes Grand Sedan</h5>
                        <p class="text-muted">Chevrolet</p>
                        <p class="text-primary fw-bold">$500/day</p>
                        <a href="#" class="btn btn-primary">Book now</a>
                        <a href="#" class="btn btn-success">Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <img src="<%=request.getContextPath() + "/images/cars2.jpeg" %>" class="card-img-top" alt="Car 2">
                    <div class="card-body text-center">
                        <h5 class="card-title">Mercedes Grand Sedan</h5>
                        <p class="text-muted">Chevrolet</p>
                        <p class="text-primary fw-bold">$500/day</p>
                        <a href="#" class="btn btn-primary">Book now</a>
                        <a href="#" class="btn btn-success">Details</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <img src="<%=request.getContextPath() + "/images/cars3.jpeg" %>" class="card-img-top" alt="Car 3">
                    <div class="card-body text-center">
                        <h5 class="card-title">Mercedes Grand Sedan</h5>
                        <p class="text-muted">Chevrolet</p>
                        <p class="text-primary fw-bold">$500/day</p>
                        <a href="#" class="btn btn-primary">Book now</a>
                        <a href="#" class="btn btn-success">Details</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
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
