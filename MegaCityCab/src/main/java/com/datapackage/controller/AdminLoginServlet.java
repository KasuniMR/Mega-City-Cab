package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Pattern;
import com.datapackage.dao.AddAdminDao;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate that username contains only letters
        if (!Pattern.matches("[a-zA-Z]+", username)) {
            request.setAttribute("errorMessage", "Username must contain only letters!");
            request.getRequestDispatcher("Admin/AdminLogin.jsp").forward(request, response);
            return;
        }

        AddAdminDao adminDao = new AddAdminDao();
        int validationCode = adminDao.validateAdminWithDetails(username, password);

        switch (validationCode) {
        case 1: // Successful login
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("successMessage", "Login successful! Welcome, " + username + "!");
            response.sendRedirect("Admin/AdminHome.jsp");
            break;
        case 2: // Correct username, wrong password
            request.setAttribute("errorMessage", "Incorrect password! Please try again.");
            request.getRequestDispatcher("Admin/AdminLogin.jsp").forward(request, response);
            break;
        case 3: // Wrong username, correct password
            request.setAttribute("errorMessage", "Username not found! Please check and try again.");
            request.getRequestDispatcher("Admin/AdminLogin.jsp").forward(request, response);
            break;
        default: // Both incorrect
            request.setAttribute("errorMessage", "Invalid credentials! Please enter correct username and password.");
            request.getRequestDispatcher("Admin/AdminLogin.jsp").forward(request, response);
            break;
        }
    }
}