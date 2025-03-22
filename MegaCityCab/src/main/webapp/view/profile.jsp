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

    // If the user has no custom profile image, use default
    String profilePic = (user.getProfileImage() == null || user.getProfileImage().isEmpty())
                        ? "images/default.png"
                        : user.getProfileImage();
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
            max-width: 900px;
            display: flex;
        }
        .sidebar {
        width: 280px;
        background: linear-gradient(135deg, #1f1f1f, #292929);
        padding: 25px;
        border-right: 1px solid #444;
        position: fixed;
        height: 100vh;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 5px 0 10px rgba(0, 0, 0, 0.2);
	    }
	    .sidebar img {
	        width: 120px;
	        height: 120px;
	        border-radius: 50%;
	        border: 3px solid #4caf50;
	        margin-bottom: 15px;
	        transition: transform 0.3s ease;
	    }
	    .sidebar img:hover {
	        transform: scale(1.1);
	    }
	    .sidebar h4 {
	        color: #4caf50;
	        margin-bottom: 10px;
	    }
	    .sidebar p {
	        color: #ccc;
	        text-align: center;
	        font-size: 14px;
	    }
	    .sidebar .nav-links {
	        list-style: none;
	        padding: 0;
	        margin-top: 20px;
	        width: 100%;
	    }
	    .sidebar .nav-links li {
	        width: 100%;
	        margin: 10px 0;
	    }
	    .sidebar .nav-links a {
	        display: block;
	        padding: 12px;
	        background: #252525;
	        color: #fff;
	        text-align: center;
	        text-decoration: none;
	        border-radius: 5px;
	        transition: background 0.3s;
	    }
	    .sidebar .nav-links a:hover {
	        background: #4caf50;
	    }
	    .admin-reply {
	        display: none;
	        color: #4caf50;
	        text-align: center;
	        margin-top: 10px;
	        transform: translateY(-20px);
	        opacity: 0;
	        transition: all 0.5s ease;
	    }
	    .admin-reply.show {
	        display: block;
	        transform: translateY(0);
	        opacity: 1;
	    }
	    .admin-reply-btn {
	        background: #4caf50;
	        border: none;
	        color: white;
	        padding: 10px;
	        border-radius: 5px;
	        cursor: pointer;
	        margin-top: 10px;
	    }
	    .admin-reply-btn:hover {
	        background: #3e8e41;
	    
	    }
        .main-content {
            margin-left: 270px;
            width: 80%;
            padding: 20px;
        }
        .card {
            background-color: #1e1e1e;
            border: 1px solid #333;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);
        }
        .form-label, .text-center {
            color: white;
        }
        .form-control, .btn {
            background-color: #252525;
            color: #ffffff;
            border: 1px solid #444;
        }
        .btn-primary {
            background-color: #4caf50;
            border-color: #4caf50;
        }
    </style>
</head>
<body>
    <div class="sidebar">
    <h3>Welcome</h3>
    <img src="<%= request.getContextPath() + "/" + profilePic %>" alt="Profile Image">
    <h4><%= user.getUname() %></h4>
    <button class="admin-reply-btn" onclick="showAdminReply()">Show Admin Reply</button>
    <p id="adminReply" class="admin-reply"><%= (user.getAdminReply() != null && !user.getAdminReply().isEmpty()) ? user.getAdminReply() : "No reply from admin yet." %></p>
    <ul class="nav-links">
        <li><a href="home.jsp">Home</a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
</div>

<script>
    function showAdminReply() {
        let reply = document.getElementById('adminReply');
        reply.classList.add('show');
    }
</script>

        <div class="main-content">
            <div class="card shadow p-4">
                <h2 class="text-center mb-4">Profile Details</h2>
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
            </div>
        </div>
    </div>

    <script>
        document.getElementById('profileImageInput').addEventListener('change', function(event) {
            let reader = new FileReader();
            reader.onload = function(){
                let output = document.querySelector(".sidebar img");
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        });
    </script>
</body>
</html>