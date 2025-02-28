package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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

        if (registerDao.validateUser(uname, password)) {
            HttpSession session = request.getSession();
            session.setAttribute("uname", uname);
            response.sendRedirect("view/home.jsp");
        } else {
            response.sendRedirect("view/Login.jsp?error=invalid");
        }
	}

}