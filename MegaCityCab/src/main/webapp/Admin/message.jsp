<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Messages</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #212529;
            color: white;
            font-family: 'Poppins', sans-serif;
        }
        .container {
            margin-top: 40px;
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        .back-btn {
            background-color: #28a745;
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            margin-bottom: 20px;
        }
        .back-btn:hover {
            background-color: #218838;
        }
        .search-input {
            width: 50%;
            padding: 10px;
            margin: 20px auto;
            display: block;
            border: 2px solid #007bff;
            border-radius: 5px;
            font-size: 16px;
            background-color: #1e1e1e;
            color: white;
        }
    </style>
    <script>
        function searchTable() {
            let input = document.getElementById("searchInput").value.toLowerCase();
            let rows = document.querySelectorAll("tbody tr");

            rows.forEach(row => {
                let name = row.cells[1].textContent.toLowerCase();
                let email = row.cells[2].textContent.toLowerCase();
                
                if (name.includes(input) || email.includes(input)) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        }
    </script>
</head>
<body>
    <div class="container">
        <!-- Back Button -->
        <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp" class="back-btn">⬅ Back to Dashboard</a>
        
        <h2 class="text-center mt-3">📋 Messages</h2>

        <!-- Search Input -->
        <input type="text" id="searchInput" class="search-input" onkeyup="searchTable()" placeholder="Search by Name or Email">
        
        <div class="table-container mt-4">
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Submitted At</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mega_city_cab", "root", "Kasuni2003@#$");

                            stmt = conn.createStatement();
                            String sql = "SELECT id, name, email, message, submitted_at FROM contactus ORDER BY submitted_at DESC";
                            rs = stmt.executeQuery(sql);

                            if (!rs.isBeforeFirst()) {
                    %>
                        <tr>
                            <td colspan="5" class="text-center">🚫 No messages found.</td>
                        </tr>
                    <%
                            }

                            while (rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("name") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("message") %></td>
                            <td><%= rs.getTimestamp("submitted_at") %></td>
                        </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
