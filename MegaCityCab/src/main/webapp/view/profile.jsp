<%@ page session="true" %>
<%@ page import="com.datapackage.dao.RegisterDao, com.datapackage.model.Register" %>

<%
    if (session.getAttribute("uname") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
    String username = (String) session.getAttribute("uname");
    RegisterDao registerDao = new RegisterDao();
    Register user = registerDao.getUserByUsername(username);
    if (user == null) {
        response.sendRedirect("Login.jsp?error=userNotFound");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    
    <style>
        body {
            background-color: #121212;
            color: #e0e0e0;
        }
        .container {
            max-width: 600px;
        }
        .card {
            background-color: #1e1e1e;
            border: 1px solid #333;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
        }
        .form-label {
            color: white;
        }
        .text-center {
            color:white;
        }
        .form-control, .btn {
            background-color: #252525;
            color: #ffffff;
            border: 1px solid #444;
        }
        .form-control:focus {
            background-color: #333;
            color: #fff;
            border-color: #555;
        }
        .btn-primary {
            background-color: #4caf50;
            border-color: #4caf50;
        }
        .btn-primary:hover {
            background-color: #388e3c;
            border-color: #2e7d32;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }
        .btn-danger:hover {
            background-color: #bb2d3b;
            border-color: #b02a37;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-secondary:hover {
            background-color: #5c636a;
            border-color: #545b62;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="card shadow p-4">
            <h2 class="text-center mb-4">Profile Details</h2>
            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success">Profile updated successfully!</div>
            <% } %>
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger">Error updating profile. Please try again.</div>
            <% } %>

            <div class="text-center mb-3">
                <img id="profilePreview" src="<%= user.getProfileImage() %>" width="120" height="120" class="rounded-circle">
            </div>

            <form method="POST" action="<%=request.getContextPath()%>/ProfileServlet" enctype="multipart/form-data" class="mt-3">
                <div class="mb-3">
                    <label class="form-label">Full Name</label>
                    <input type="text" name="fullname" value="<%= user.getName() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <input type="text" name="address" value="<%= user.getAddress() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Contact</label>
                    <input type="text" name="contact" value="<%= user.getContact() %>" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">New Password (leave blank to keep old password)</label>
                    <input type="password" name="password" class="form-control">
                </div>
                <div class="mb-3">
                    <label class="form-label">Profile Image</label>
                    <input type="file" name="profile_image" class="form-control" accept="images/*" id="profileImageInput">
                </div>

                <button type="submit" class="btn btn-primary w-100">Update Profile</button>
            </form>

            <div class="text-center mt-3">
                <a href="home.jsp" class="btn btn-secondary">Back to Home</a>
                <a href="LogoutServlet" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('profileImageInput').addEventListener('change', function(event) {
            let reader = new FileReader();
            reader.onload = function(){
                let output = document.getElementById('profilePreview');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        });
    </script>
</body>
</html>