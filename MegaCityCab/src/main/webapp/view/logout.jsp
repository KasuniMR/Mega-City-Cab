<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate(); // Destroy session
    response.sendRedirect("home.jsp"); // Redirect to home page
%>
