<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Destroy session
    response.sendRedirect("Login.jsp"); // Redirect to home page
%>
