package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.datapackage.dao.AddAdminDao;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
        String password = request.getParameter("password");

        AddAdminDao adminDao = new AddAdminDao();
        boolean isValid = adminDao.validateAdmin(username, password);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("Admin/AdminHome.jsp");
        } else {
        	request.setAttribute("errorMessage", "Invalid credentials!");
            request.getRequestDispatcher("Admin/AdminLogin.jsp").forward(request, response);
        }

    }
	

}