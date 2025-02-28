package com.datapackage.controller;


import com.datapackage.dao.RegisterDao;
import com.datapackage.model.Register;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RegisterDao registerDao;
    
    public void init() throws ServletException {
        registerDao = new RegisterDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form data
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");

        

        // Create user object
        Register user = new Register(name,address,contact,uname,password);

        if (registerDao.userExists(uname)) {
            response.sendRedirect("Views/Register.jsp?error=userExists");
        } else {
            boolean isRegistered = registerDao.registerUser(user);
            if (isRegistered) {
                response.sendRedirect("view/Login.jsp");
            } else {
                response.sendRedirect("view/Register.jsp?error=registrationFailed");
            }
        }
    }
}
