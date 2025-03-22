package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Cookie;

import java.io.IOException;

import com.datapackage.dao.RegisterDao;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;  
    private RegisterDao registerDao;

    @Override
    public void init() throws ServletException {
        registerDao = new RegisterDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");

        if (registerDao.validateUser(uname, password)) {
            // Create a session for logged-in users
            HttpSession session = request.getSession();
            session.setAttribute("uname", uname);

            // Handle "Remember Me" functionality with cookies
            Cookie userCookie = new Cookie("uname", rememberMe != null ? uname : "");
            userCookie.setMaxAge(rememberMe != null ? 7 * 24 * 60 * 60 : 0); // Set for 7 days or delete
            userCookie.setPath("/"); // Make cookie accessible across the application
            response.addCookie(userCookie);

            response.sendRedirect("view/home.jsp");
        } else {
            response.sendRedirect("view/Login.jsp?error=invalid");
        }
    }
}
