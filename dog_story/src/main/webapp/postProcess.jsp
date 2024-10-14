<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File, java.io.IOException, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException, java.util.List" %>
<%@ page import="org.apache.commons.fileupload2.core.DiskFileItemFactory, org.apache.commons.fileupload2.core.AbstractFileUpload, org.apache.commons.fileupload2.core.FileItem" %>
<%
    // 로그인된 사용자 ID 가져오기 (예시)
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String uploadPath = application.getRealPath("/") + "uploads";
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    DiskFileItemFactory factory = new DiskFileItemFactory();
    JakartaServletDiskFileUpload upload = new JakartaServletDiskFileUpload(factory);
    String title = null;
    String content = null;
    String imagePath = null;

    try {
        List<FileItem> items = upload.parseRequest(request);

        for (FileItem item : items) {
            if (item.isFormField()) {
                if ("title".equals(item.getFieldName())) {
                    title = item.getString("UTF-8");
                } else if ("content".equals(item.getFieldName())) {
                    content = item.getString("UTF-8");
                }
            } else {
                if ("image".equals(item.getFieldName())) {
                    String fileName = new File(item.getName()).getName();
                    imagePath = "uploads/" + fileName;
                    File file = new File(uploadPath + File.separator + fileName);
                    item.write(file);
                }
            }
        }

        // 데이터베이스 로직
        Connection conn = null;
        PreparedStatement pstmt = null;
        String dbUrl = "jdbc:mysql://localhost:3306/web_team";
        String dbUser = "root"; // 데이터베이스 사용자 이름
        String dbPassword = "1004"; // 데이터베이스 비밀번호

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String sql = "INSERT INTO posts (user_id, title, content, image_path, created_at) VALUES (?, ?, ?, ?, NOW())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.setString(4, imagePath);
            pstmt.executeUpdate();

            response.sendRedirect("main.jsp");
        } catch (Exception e) {
            out.println("Database Error: " + e.getMessage());
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
