package com.datapackage.controller;

import java.io.IOException;
import com.datapackage.dao.RegisterDao;
import com.datapackage.model.Register;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

// Servlet for updating user profile
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("view/Login.jsp");
            return;
        }

        RegisterDao registerDao = new RegisterDao();

        // Retrieve user inputs
        String fullName = request.getParameter("fullname");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");

        // Get existing user details
        Register existingUser = registerDao.getUserByUsername(username);

        // Update user object (without modifying password)
        Register updatedUser = new Register(fullName, address, contact, username, existingUser.getPassword());

        // Update the user details in the database
        boolean updated = registerDao.updateUser(updatedUser);

        if (updated) {
            response.sendRedirect("Views/profile.jsp?success=profileUpdated");
        } else {
            response.sendRedirect("Views/profile.jsp?error=updateFailed");
        }
    }
}
