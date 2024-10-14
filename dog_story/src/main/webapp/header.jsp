<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer userId = (Integer) session.getAttribute("userId");
    String username = (String) session.getAttribute("username");
%>
<header>
    <h1>Pet Community</h1>
    <nav>
        <ul>
            <li><a href="main.jsp">Home</a></li>
            <% if (userId != null) { %>
                <li>Welcome, <%= username %>!</li>
                <li><a href="post.jsp">Create Post</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            <% } else { %>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            <% } %>
        </ul>
    </nav>
</header>
