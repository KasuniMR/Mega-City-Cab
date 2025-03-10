<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page import="com.datapackage.dao.BookingDao" %>
<%@ page import="com.datapackage.model.Booking" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body { background-color: #212529; color: white; font-family: 'Poppins', sans-serif; }
        .container { margin-top: 40px; }
        .table-container { background: white; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); }
        .table th { background-color: #007bff; color: white; text-align: center; }
        .table td { text-align: center; vertical-align: middle; }
        .btn-danger:hover { background-color: #b30000; }
        .back-btn { background-color: #28a745; padding: 10px 20px; border-radius: 5px; color: white; text-decoration: none; }
        .back-btn:hover { background-color: #218838; }
    </style>
</head>
<body>
    <div class="container">
        <a href="<%= request.getContextPath() %>/Admin/AdminHome.jsp" class="btn back-btn">⬅ Back to Dashboard</a>
        <h2 class="text-center mt-3">📋 Manage Bookings</h2>
        <div class="table-container mt-4">
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Customer Email</th>
                        <th>Car</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>From Location</th>
                        <th>To Location</th>
                        <th>Price</th>
                        <th>Payment</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% BookingDao bookingDao = new BookingDao();
                       List<Booking> bookings = bookingDao.getAllBookings();
                       if (bookings.isEmpty()) { %>
                        <tr>
                            <td colspan="11" class="text-center">🚫 No bookings found.</td>
                        </tr>
                    <% } else {
                        for (Booking booking : bookings) { %>
                        <tr>
                            <td><%= booking.getId() %></td>
                            <td><%= booking.getUserEmail() %></td>
                            <td><%= booking.getCarName() %></td>
                            <td><%= booking.getStartDate() %></td>
                            <td><%= booking.getEndDate() %></td>
                            <td><%= booking.getFromLocation() %></td>
                            <td><%= booking.getToLocation() %></td>
                            <td>Rs. <%= booking.getTotalPrice() %></td>
                            <td><%= booking.getPaymentMethod() %></td>
                            <td>
                                <% if (booking.getStatus().equals("Pending")) { %>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <% } else if (booking.getStatus().equals("Confirmed")) { %>
                                    <span class="badge bg-success">Confirmed</span>
                                <% } else { %>
                                    <span class="badge bg-danger">Cancelled</span>
                                <% } %>
                            </td>
                            <td>
                                <% if (booking.getStatus().equals("Pending")) { %>
                                    <form method="post" action="<%=request.getContextPath()%>/UpdateBookingServlet">
                                        <input type="hidden" name="bookingId" value="<%= booking.getId() %>">
                                        <button type="submit" name="action" value="confirm" class="btn btn-success btn-sm">Confirm</button>
                                        <button type="submit" name="action" value="cancel" class="btn btn-danger btn-sm">Cancel</button>
                                    </form>
                                <% } else { %>
                                    <button class="btn btn-secondary btn-sm" disabled>Action Taken</button>
                                <% } %>
                            </td>
                        </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
