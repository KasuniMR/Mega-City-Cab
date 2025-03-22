<%@ page import="java.sql.*, java.io.*, java.net.URLEncoder" %>
<%
    String id = request.getParameter("id");
    String reply = request.getParameter("reply");

    if (id == null || reply == null || reply.trim().isEmpty()) {
        response.sendRedirect("message.jsp?status=error&msg=" + URLEncoder.encode("Invalid input!", "UTF-8"));
        return;
    }

    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mega_city_cab", "root", "Kasuni2003@#$");
         PreparedStatement ps = conn.prepareStatement("UPDATE contactus SET reply = ? WHERE id = ?")) {

        ps.setString(1, reply);
        ps.setInt(2, Integer.parseInt(id));
        int rowsAffected = ps.executeUpdate();

        if (rowsAffected > 0) {
            response.sendRedirect("message.jsp?status=success&msg=" + URLEncoder.encode("Reply sent successfully!", "UTF-8"));
        } else {
            response.sendRedirect("message.jsp?status=error&msg=" + URLEncoder.encode("Failed to send reply!", "UTF-8"));
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("message.jsp?status=error&msg=" + URLEncoder.encode("Database error occurred!", "UTF-8"));
    }
%>
