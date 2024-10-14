<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<%
    // 로그인 여부 확인
    Integer userid = (Integer) session.getAttribute("userId");
    if (userid == null) {
        // 로그인하지 않은 사용자는 로그인 페이지로 리디렉션
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Post</title>
</head>
<body>
    <h2>Create a New Post</h2>
    <form action="postProcess.jsp" method="post" enctype="multipart/form-data">
        <label for="title">Title:</label><br>
        <input type="text" name="title" id="title" required><br><br>

        <label for="content">Content:</label><br>
        <textarea name="content" id="content" required></textarea><br><br>

        <label for="image">Upload Image:</label><br>
        <input type="file" name="image" id="image" accept="image/*"><br><br>

        <button type="submit">Submit</button>
    </form>
    <p><a href="main.jsp">Back to Main Page</a></p>
</body>
</html>
