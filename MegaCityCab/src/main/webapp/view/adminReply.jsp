<%@ page session="true" %>
<%@ page import="com.datapackage.dao.RegisterDao, com.datapackage.model.Register" %>

<%
    if (session.getAttribute("uname") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    String uname = (String) session.getAttribute("uname");
    RegisterDao dao = new RegisterDao();
    Register usr = dao.getUserByUsername(uname);
    if (usr == null) {
        response.sendRedirect("Login.jsp?error=userNotFound");
        return;
    }
    String userMessage = (usr.getMessage() != null && !usr.getMessage().isEmpty()) ? usr.getMessage() : "No message submitted.";
    String adminReply = (usr.getAdminReply() != null && !usr.getAdminReply().isEmpty()) ? usr.getAdminReply() : "No reply from admin yet.";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Reply</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #121212;
            color: #ffffff;
            font-family: Arial, sans-serif;
        }
        .card {
            background-color: #1e1e1e;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #f8f9fa;
        }
        .btn-secondary {
            background-color: #343a40;
            border-color: #495057;
        }
        .btn-secondary:hover {
            background-color: #495057;
            border-color: #6c757d;
        }
        .back-button {
            display: inline-block;
            background: #ff9800;
            color: white;
            padding: 10px 20px;
            border-radius: 25px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            box-shadow: 0px 5px 15px rgba(255, 152, 0, 0.4);
        }
        .back-button:hover {
            background: #e68900;
            box-shadow: 0px 8px 20px rgba(255, 152, 0, 0.6);
            transform: translateY(-3px);
        }
        .back-button i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">User Message and Admin Reply</h2>
        <div class="card p-4 text-light">
            <p><strong>Your Message:</strong></p>
            <p class="text-warning"><%= userMessage %></p>
            <hr class="border-light">
            <p><strong>Admin's Response:</strong></p>
            <p class="text-info"><%= adminReply %></p>
        </div>
        
    <!-- Back Button -->
    <div class="container mt-3">
        <a href="profile.jsp" class="back-button"><i class="fas fa-arrow-left"></i> Back to Profile</a>
    </div>
    
    </div>
</body>
</html>
