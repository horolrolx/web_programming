<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String postId = request.getParameter("postId");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_team", "root", "1004");
        
        String sql = "DELETE FROM posts WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, postId);
        pstmt.executeUpdate();

        response.sendRedirect("main.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>