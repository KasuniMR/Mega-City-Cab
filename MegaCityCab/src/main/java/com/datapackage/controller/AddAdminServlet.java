package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import com.datapackage.dao.AddAdminDao;
import com.datapackage.model.AddAdmin;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate username (only letters, min length 3)
        if (!Pattern.matches("[a-zA-Z]{3,}", username)) {
            request.setAttribute("errorMessage", "Invalid username! Only letters allowed, min 3 characters.");
            request.getRequestDispatcher("Admin/AddAdmin.jsp").forward(request, response);
            return;
        }
        
        // Validate email format
        if (!Pattern.matches("^[A-Za-z0-9+_.-]+@(.+)$", email)) {
            request.setAttribute("errorMessage", "Invalid email format!");
            request.getRequestDispatcher("Admin/AddAdmin.jsp").forward(request, response);
            return;
        }
        
        // Validate password (min length 6, at least one number & one special character)
        if (!Pattern.matches("^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,}$", password)) {
            request.setAttribute("errorMessage", "Password must be at least 6 characters long, include one number and one special character!");
            request.getRequestDispatcher("Admin/AddAdmin.jsp").forward(request, response);
            return;
        }

        AddAdminDao addAdminDao = new AddAdminDao();
        boolean added = addAdminDao.AddAdmin(username, email, password);

        if (added) {
            // Fetch updated list from the database after successful addition
            List<AddAdmin> updatedAdminList = addAdminDao.getAllAdmins();
            HttpSession session = request.getSession();
            session.setAttribute("adminList", updatedAdminList);
            session.setAttribute("successMessage", "Admin added successfully!");
            response.sendRedirect("Admin/AddAdmin.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to add admin!");
            request.getRequestDispatcher("Admin/AddAdmin.jsp").forward(request, response);
        }
    }
}