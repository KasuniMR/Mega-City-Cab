<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    String fileName = request.getParameter("file");
    if (fileName == null || fileName.trim().isEmpty()) {
        response.sendRedirect("Checkout.jsp?error=NoInvoice");
        return;
    }
    String filePath = request.getContextPath() + "/bills/" + fileName;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Download Invoice</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/bookingstyle.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #121212;
            color: #e0e0e0;
            text-align: center;
            margin: 50px;
        }
        .container {
            background: #1e1e1e;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
            max-width: 450px;
            margin: auto;
        }
        .btn {
            display: block;
            padding: 12px;
            margin: 15px 0;
            text-decoration: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            text-align: center;
        }
        .btn-download {
            background-color: #4caf50;
        }
        .btn-download:hover {
            background-color: #388e3c;
        }
        .btn-back {
            background-color: #007bff;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📄 Download Your Invoice</h1>
        <p>Your invoice has been generated successfully!</p>
        
        <a href="<%= filePath %>" class="btn btn-download" download>📥 Download Invoice</a>
        <a href="Checkout.jsp" class="btn btn-back">⬅️ Back</a>
    </div>
</body>
</html>
