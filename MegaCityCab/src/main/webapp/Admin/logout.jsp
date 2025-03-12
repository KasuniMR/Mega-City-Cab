<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Invalidate the current session
    session.invalidate();

    // Redirect to login page
    response.sendRedirect("AdminLogin.jsp");
%>
