<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
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
    
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #121212;
            color: #e0e0e0;
        }
        .navbar {
            background: #1e1e1e;
        }
        .navbar-brand, .nav-link {
            color: white !important;
        }
        .hero {
            background: linear-gradient(to right, #2e7d32, #1b5e20);
            height: 40vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
        }
        .btn-primary {
            background: #4caf50;
            border: none;
        }
        .btn-primary:hover {
            background: #388e3c;
        }
        .card {
            background: #1e1e1e;
            color: #e0e0e0;
            border: none;
        }
        .footer {
            background: #1e1e1e;
            padding: 30px 0;
            color: #e0e0e0;
        }
        .stat-box {
        background: #1e1e1e;
        color: #e0e0e0;
        transition: transform 0.3s ease-in-out;
    }
    .stat-box:hover {
        transform: translateY(-5px);
    }
    .stat-box i {
        opacity: 0.8;
    }
   .testimonial-card {
        background: #ffffff;
        padding: 20px;
        width: 300px;
        border-radius: 12px;
        text-align: center;
        transition: transform 0.3s ease-in-out, box-shadow 0.3s;
        cursor: pointer;
    }

    .testimonial-card:hover {
        transform: translateY(-5px);
        box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
    }

    .testimonial-card.featured {
        background: #1e2a47;
        color: #ffffff;
        transform: scale(1.05);
    }

    .testimonial-img {
        width: 70px;
        height: 70px;
        border-radius: 50%;
        margin-top: 15px;
        border: 3px solid #ddd;
    }

    .btn-warning {
        border-radius: 30px;
        font-weight: bold;
        padding: 10px 25px;
    }

    @media (max-width: 768px) {
        .testimonial-card {
            width: 100%;
        }
    }
    .review {
    color:white;
    
    } .box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f8f9fc;
            padding: 20px;
        }

        .blog-section {
            max-width: 1200px;
            margin: auto;
        }

        .blog-header {
            text-align: left;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .blog-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
        }

        .featured-blog {
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            overflow: hidden;
        }

        .featured-blog img {
            width: 100%;
            border-radius: 10px;
        }

        .blog-content {
            padding: 15px 0;
        }

        .blog-grid .blog-item {
            background: white;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .blog-item img {
            width: 100%;
            border-radius: 10px;
        }

        .blog-date {
            color: gray;
            font-size: 12px;
            margin: 5px 0;
        }

        .blog-title {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
        }

        @media (max-width: 768px) {
            .blog-grid {
                grid-template-columns: 1fr;
            }
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
                    <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="booking.jsp">Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                </ul>
            </div>
        </div>
    </nav>
    
    <!-- Hero Section -->
    <section class="hero">
        <div class="container text-center">
            <h1>Fast & Easy Way To Rent A Car</h1>
            <p class="lead">Choose your car and book online within minutes.</p>
            <a href="booking.jsp" class="btn btn-primary btn-lg">Book Now</a>
        </div>
    </section>
    
    <!-- Services Section -->
    <section class="container py-5">
        <h2 class="text-center fw-bold">What We Offer</h2>
        <p id="service" class="text-center ">Explore our best-in-class car rental services tailored to your needs.</p>
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card shadow-sm p-4 text-center">
                    <i class="fas fa-car fa-3x mb-3"></i>
                    <h5 class="fw-bold">Car Rental</h5>
                    <p>Choose from a wide range of well-maintained vehicles for your trips.</p>
                    <a href="services.jsp" class="btn btn-success">Read More</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm p-4 text-center">
                    <i class="fas fa-user-tie fa-3x mb-3"></i>
                    <h5 class="fw-bold">Chauffeur Services</h5>
                    <p>Professional drivers to ensure a safe and comfortable ride.</p>
                    <a href="services.jsp" class="btn btn-success">Read More</a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm p-4 text-center">
                    <i class="fas fa-tools fa-3x mb-3"></i>
                    <h5 class="fw-bold">Car Maintenance</h5>
                    <p>Reliable car servicing to keep your vehicle in top condition.</p>
                    <a href="services.jsp" class="btn btn-success">Read More</a>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Blog Posts Section -->
<main class="container my-5">
    <div class="row">
        <div class="col-md-6">
            <article class="card mb-4">
                <img src="<%=request.getContextPath() + "/images/blog3.jpg"%>" class="card-img-top" alt="Blog Post 1">
                <div class="card-body">
                    <h2 class="card-title">3 Easy Steps To Rent A Car With A Debit Card</h2>
                    <p class="card-text">Lorem ipsum dolor sit amet, consec adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
                    Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi...</p>
                    <a href="blog.jsp" class="btn btn-success">Read More</a>
                </div>
            </article>
        </div>
        <div class="col-md-6">
            <article class="card mb-4">
                <img src="<%=request.getContextPath() + "/images/blog4.jpg"%>" class="card-img-top" alt="Blog Post 2">
                <div class="card-body">
                    <h2 class="card-title">The Easiest Car Rental With Several Stages</h2>
                    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                     quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat....</p>
                    <a href="blog.jsp" class="btn btn-success">Read More</a>
                </div>
            </article>
        </div>
    </div>
</main>
    
        <!-- Statistics Section -->
<section class="container my-5">
    <div class="row text-center">
        <div class="col-md-3">
            <div class="stat-box shadow-lg p-4 rounded">
                <i class="fas fa-users fa-3x text-success"></i>
                <h2 class="counter mt-3" data-target="1500">0</h2>
                <p class="fw-bold">Happy Customers</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-box shadow-lg p-4 rounded">
                <i class="fas fa-car fa-3x text-warning"></i>
                <h2 class="counter mt-3" data-target="200">0</h2>
                <p class="fw-bold">Number of Cars</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-box shadow-lg p-4 rounded">
                <i class="fas fa-building fa-3x text-primary"></i>
                <h2 class="counter mt-3" data-target="50">0</h2>
                <p class="fw-bold">Car Centers</p>
            </div>
        </div>
        <div class="col-md-3">
            <div class="stat-box shadow-lg p-4 rounded">
                <i class="fas fa-road fa-3x text-danger"></i>
                <h2 class="counter mt-3" data-target="500000">0</h2>
                <p class="fw-bold">Total Kilometers</p>
            </div>
        </div>
    </div>
</section>

<!-- JavaScript for Counter Animation -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const counters = document.querySelectorAll(".counter");
        const speed = 200; 

        counters.forEach(counter => {
            const updateCount = () => {
                const target = +counter.getAttribute("data-target");
                const count = +counter.innerText;
                const increment = target / speed;

                if (count < target) {
                    counter.innerText = Math.ceil(count + increment);
                    setTimeout(updateCount, 20);
                } else {
                    counter.innerText = target;
                }
            };
            updateCount();
        });
    });
</script>

<!-- Customer Reviews Section -->
<section class="container my-5 text-center">
    <h2 class="fw-bold">WHAT CUSTOMER SAY ABOUT US</h2>
    <p id="review" >Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et.</p>

    <div class="row mt-4 justify-content-center">
        <!-- Testimonial 1 -->
        <div class="col-md-3">
            <div class="testimonial-box shadow-sm p-4 rounded">
                <p class="fst-italic">"Volutpat diam ut venenatis. Convallis aenean et tortor at risus. Nec nam aliquam sem et tortor."</p>
                <img src="<%=request.getContextPath() + "/images/cus.jpg"%>" class="testimonial-img mt-3" alt="Customer 1">
                <h5 class="mt-2">SPIKE WARREN</h5>
                <p class="">Our Customer</p>
            </div>
        </div>

        <!-- Testimonial 2 (Highlighted) -->
        <div class="col-md-3">
            <div class="testimonial-box featured p-4 rounded">
                <p class="fst-italic">"Volutpat diam ut venenatis. Convallis aenean et tortor at risus. Nec nam aliquam sem et tortor."</p>
                <img src="<%=request.getContextPath() + "/images/cus1.jpg"%>" class="testimonial-img mt-3" alt="Customer 2">
                <h5 class="mt-2">BENTLEY BURTON</h5>
                <p class="">Our Customer</p>
            </div>
        </div>

        <!-- Testimonial 3 -->
        <div class="col-md-3">
            <div class="testimonial-box shadow-sm p-4 rounded">
                <p class="fst-italic">"Volutpat diam ut venenatis. Convallis aenean et tortor at risus. Nec nam aliquam sem et tortor."</p>
                <img src="<%=request.getContextPath() + "/images/cus2.jpg"%>" class="testimonial-img mt-3" alt="Customer 3">
                <h5 class="mt-2">MALLORY RODRIQUEZ</h5>
                <p class="">Our Customer</p>
            </div>
        </div>
    </div>

    <a href="#" class="btn btn-warning mt-4">ALL REVIEW →</a>
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
