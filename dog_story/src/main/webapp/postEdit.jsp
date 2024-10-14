<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Post</title>
</head>
<body>
    <%
        String postId = request.getParameter("postId");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_team", "root", "1004");
            
            String sql = "SELECT title, content FROM posts WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, postId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
    %>
                <h2>Edit Post</h2>
                <form action="postUpdate.jsp" method="post">
                    <input type="hidden" name="postId" value="<%= postId %>">
                    
                    <label for="title">Title:</label><br>
                    <input type="text" name="title" value="<%= title %>" required><br><br>
                    
                    <label for="content">Content:</label><br>
                    <textarea name="content" required><%= content %></textarea><br><br>
                    
                    <button type="submit">Update</button>
                </form>
    <%
            } else {
                out.println("Post not found.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
    <p><a href="main.jsp">Back to Main Page</a></p>
</body>
</html>
