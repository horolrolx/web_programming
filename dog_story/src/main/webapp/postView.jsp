<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Post</title>
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
            
            String sql = "SELECT title, content, image_path, created_at FROM posts WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, postId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String imagePath = rs.getString("image_path");
                Timestamp createdAt = rs.getTimestamp("created_at");
    %>
                <h2><%= title %></h2>
                <p><%= content %></p>
                <p>Posted on: <%= createdAt %></p>
                <%
                    if (imagePath != null && !imagePath.isEmpty()) {
                %>
                    <img src="<%= imagePath %>" alt="Post Image" width="300px">
                <%
                    }
                %>
                <form action="postEdit.jsp" method="get">
                    <input type="hidden" name="postId" value="<%= postId %>">
                    <button type="submit">Edit</button>
                </form>
                <form action="postDelete.jsp" method="post">
                    <input type="hidden" name="postId" value="<%= postId %>">
                    <button type="submit">Delete</button>
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
