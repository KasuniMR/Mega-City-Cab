<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
            font-family: 'Poppins', sans-serif;
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
        .container {
            max-width: 1100px;
            margin: 10px auto;
        }
        .checkout-container {
            background: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
        }
        .table {
            color: #e0e0e0;
        }
        .table th {
            background-color: #4caf50;
            color: white;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        input, select {
            width: 100%;
            padding: 12px;
            margin-top: 8px;
            border: 1px solid #555;
            border-radius: 5px;
            font-size: 16px;
            background: #222;
            color: #e0e0e0;
        }
        .btn-checkout {
            background: #4caf50;
            color: white;
            font-size: 18px;
            padding: 14px;
            width: 100%;
            border-radius: 5px;
            border: none;
            transition: all 0.3s ease-in-out;
            cursor: pointer;
        }
        .btn-checkout:hover {
            background: #388e3c;
        }
        .btn-back {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 15px;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
        .loading-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 9999;
            text-align: center;
        }
        .spinner {
            border: 5px solid rgba(0, 123, 255, 0.3);
            border-top: 5px solid #4caf50;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            animation: spin 1s linear infinite;
            margin: 10px auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
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
    </div>
</nav>

<header>
    <h1 class="text-center">💳 Checkout & Confirm Booking</h1>
</header>
<div class="text-start mb-3">
            <a href="Addcart.jsp" class="btn btn-back">⬅️ Back</a>
        </div>

<%
    List<String[]> cart = (List<String[]>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p class="text-center">🛒 Your cart is empty. <a href="Booking.jsp" class="text-success">Browse Cars</a></p>
<%
    } else {
        double totalPrice = 0;
%>

<div class="container">
    <div class="checkout-container">
        <h2 class="text-center">📋 Booking Summary</h2>
        
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Car</th>
                    <th>Price (Rs/Day)</th>
                    <th>Seats</th>
                    <th>Transmission</th>
                    <th>Fuel</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (String[] car : cart) {
                        totalPrice += Double.parseDouble(car[1]);
                %>
                <tr>
                    <td><%= car[0] %></td>
                    <td>Rs. <%= car[1] %></td>
                    <td><%= car[2] %></td>
                    <td><%= car[3] %></td>
                    <td><%= car[4] %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <h3 class="text-end">Total Price: Rs. <%= totalPrice %></h3>
    </div>
    
    <div class="checkout-container mt-4">
        <form action="ProcessBooking.jsp" method="post" onsubmit="showLoading()">
            <label>📍 From Location:</label>
            <input type="text" name="fromLocation" required placeholder="Enter pickup location">
            
            <label>📍 To Location:</label>
            <input type="text" name="toLocation" required placeholder="Enter destination">
            
            <label>📅 Select Booking Dates:</label>
            <input type="date" name="startDate" required>
            <input type="date" name="endDate" required>
            
            <label>💳 Select Payment Method:</label>
            <select name="paymentMethod" required>
                <option value="Cash">Cash</option>
                <option value="Card">Credit/Debit Card</option>
            </select>
            
            <label>📧 Enter Your Email (For Invoice):</label>
            <input type="email" name="email" required placeholder="example@gmail.com">
            
            <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
            
            <button type="submit" class="btn-checkout">✅ Confirm & Generate Invoice</button>
        </form>
    </div>
</div>

    <!-- Footer -->
<footer class="bg-dark text-white py-5 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5 class="fw-bold">MEGA CITY<span class="text-success">CAB</span></h5>
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
            <p>Copyright &copy;2025 All rights reserved | This template is made with <i class="fas fa-heart text-danger"></i> by Kasuni</p>
        </div>
    </div>
</footer>


<div class="loading-overlay" id="loading">
    <div class="text-center">
        <div class="spinner"></div>
        <p>Processing Your Booking...</p>
    </div>
</div>

<script>
    function showLoading() {
        document.getElementById("loading").style.display = "block";
    }
</script>

<% } %>

</body>
</html>