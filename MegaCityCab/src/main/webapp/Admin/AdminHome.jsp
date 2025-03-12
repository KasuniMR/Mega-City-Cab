<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    String adminUsername = (String) session.getAttribute("username");
    if (adminUsername == null) {
        response.sendRedirect("AdminLogin.jsp"); // Redirect if not logged in
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>

    <!-- Bootstrap & Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #181818;
            color: #fff;
        }
        .sidebar {
            width: 260px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #222;
            padding-top: 20px;
            transition: all 0.3s;
            overflow: hidden;
        }
        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }
        .sidebar ul li {
            padding: 15px;
            text-align: left;
            transition: all 0.3s;
        }
        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 16px;
        }
        .sidebar ul li a:hover {
            background-color: #444;
            border-radius: 5px;
            padding-left: 15px;
        }
        .sidebar ul li i {
            font-size: 18px;
        }
        .main-content {
            margin-left: 270px;
            padding: 20px;
            transition: margin-left 0.3s;
        }
        .card {
            background-color: #252525;
            color: #fff;
            border: none;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .charts {
            margin-top: 20px;
            background: #222;
            padding: 20px;
            border-radius: 10px;
        }
        .toggle-btn {
            position: absolute;
            top: 15px;
            left: 270px;
            font-size: 24px;
            cursor: pointer;
            transition: left 0.3s;
        }
        .collapsed .sidebar {
            width: 80px;
        }
        .collapsed .sidebar ul li a span {
            display: none;
        }
        .collapsed .main-content {
            margin-left: 100px;
        }
        .collapsed .toggle-btn {
            left: 90px;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <h2 class="text-center text-white">Admin</h2>
        <ul>
            <li><a href="#"><i class="fas fa-home"></i> <span>Dashboard</span></a></li>
            <li><a href="AddAdmin.jsp"><i class="fas fa-user-shield"></i> <span>Manage Admin</span></a></li>
            <li><a href="manageBooking.jsp"><i class="fas fa-book"></i> <span>Manage Booking</span></a></li>
            <li><a href="manageCars.jsp"><i class="fas fa-car"></i> <span>Manage Car</span></a></li>
            <li><a href="manageDrivers.jsp"><i class="fas fa-user-tie"></i> <span>Manage Drivers</span></a></li>
            <li><a href="message.jsp"><i class="fas fa-comments"></i> <span>Message Box</span></a></li>
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> <span>Logout</span></a></li>
        </ul>
    </div>

    <!-- Toggle Sidebar Button -->
    <div class="toggle-btn" id="toggle-btn">
        <i class="fas fa-bars"></i>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Welcome to Admin Dashboard</h1>

        <!-- Statistics Cards -->
        <div class="row mt-4">
            <div class="col-md-3">
                <div class="card p-3 text-center">
                    <h3><i class="fas fa-rupee-sign"></i> Total Sales</h3>
                    <p class="fs-4">Rs.5,000</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3 text-center">
                    <h3><i class="fas fa-box"></i> Total Orders</h3>
                    <p class="fs-4">500</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3 text-center">
                    <h3><i class="fas fa-shopping-cart"></i> Cabs Sold</h3>
                    <p class="fs-4">200</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3 text-center">
                    <h3><i class="fas fa-user-plus"></i> New Customers</h3>
                    <p class="fs-4">50</p>
                </div>
            </div>
        </div>

        <!-- Sales Chart -->
        <div class="charts mt-4">
            <canvas id="salesChart" width="1000" height ="500"></canvas>
        </div>
    </div>

    <!-- Toggle Sidebar Script -->
    <script>
        document.getElementById('toggle-btn').addEventListener('click', function () {
            document.body.classList.toggle('collapsed');
        });

        var ctx = document.getElementById('salesChart').getContext('2d');
        var salesChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Sales ($)',
                    data: [3000, 4000, 3500, 5000, 4500, 6000],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });
    </script>

</body>
</html>
