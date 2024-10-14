<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String commentId = request.getParameter("commentId");
    String postId = request.getParameter("postId");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "1004");
        
        String sql = "DELETE FROM comments WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, commentId);
        pstmt.executeUpdate();

        response.sendRedirect("comment.jsp?postId=" + postId);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>