<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Main Page</title>
</head>
<body>
    <h2>Welcome to the Pet Community!</h2>
    <p><a href="post.jsp">Create a new post</a></p>
    <h3>Random Pet Photos</h3>
    
    <div>
        <% 
            // JDBC code to fetch random images from the database
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_team", "root", "1004");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT image_path FROM posts ORDER BY RAND() LIMIT 3");

                while (rs.next()) {
                    String imagePath = rs.getString("image_path");
        %>
                    <img src="<%= imagePath %>" alt="Pet Image" width="200px">
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>

    <h3>Recent Posts</h3>
    <div>
        <% 
            // Display recent posts
            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_team", "root", "1004");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT title, content FROM posts ORDER BY created_at DESC LIMIT 5");

                while (rs.next()) {
                    String title = rs.getString("title");
                    String content = rs.getString("content");
        %>
                    <div>
                        <h4><%= title %></h4>
                        <p><%= content %></p>
                    </div>
        <%
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>

    <p><a href="logout.jsp">Logout</a></p>
</body>
</html>
