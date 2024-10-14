<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Comments</title>
</head>
<body>
    <h2>Comments</h2>
    
    <form action="commentProcess.jsp" method="post">
        <input type="hidden" name="postId" value="<%= request.getParameter("postId") %>">
        
        <label for="comment">Add a comment:</label><br>
        <textarea name="comment" id="comment" required></textarea><br>
        
        <button type="submit">Submit</button>
    </form>
    
    <h3>Existing Comments</h3>
    <div>
        <% 
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String postId = request.getParameter("postId");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "1004");
                
                // Fetch comments for the specific post
                String sql = "SELECT id, username, comment, created_at FROM comments WHERE post_id = ? ORDER BY created_at DESC";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, postId);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int commentId = rs.getInt("id");
                    String username = rs.getString("username");
                    String comment = rs.getString("comment");
                    Timestamp createdAt = rs.getTimestamp("created_at");
        %>
                    <div style="border: 1px solid #ccc; margin-bottom: 10px; padding: 5px;">
                        <p><strong><%= username %></strong> - <%= createdAt %></p>
                        <p><%= comment %></p>
                        
                        <form action="deleteComment.jsp" method="post" style="display: inline;">
                            <input type="hidden" name="commentId" value="<%= commentId %>">
                            <input type="hidden" name="postId" value="<%= postId %>">
                            <button type="submit">Delete</button>
                        </form>
                    </div>
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
    
    <p><a href="main.jsp">Back to Main Page</a></p>
</body>
</html>
