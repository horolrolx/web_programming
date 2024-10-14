<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String comment = request.getParameter("comment");
    String postId = request.getParameter("postId");
    String username = "defaultUser"; // 실제 구현에서는 로그인한 사용자의 이름을 가져와야 합니다.

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "1004");
        
        String sql = "INSERT INTO comments (post_id, username, comment, created_at) VALUES (?, ?, ?, NOW())";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, postId);
        pstmt.setString(2, username);
        pstmt.setString(3, comment);
        pstmt.executeUpdate();

        response.sendRedirect("comment.jsp?postId=" + postId);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>