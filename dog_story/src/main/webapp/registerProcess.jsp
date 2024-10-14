<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String email = request.getParameter("email");

    if (!password.equals(confirmPassword)) {
        out.println("Passwords do not match. <a href='register.jsp'>Try again</a>");
        return;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // JDBC 연결 설정
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_team", "root", "1004");

        // 사용자명이 이미 존재하는지 확인
        String checkUserSql = "SELECT id FROM users WHERE username = ?";
        pstmt = conn.prepareStatement(checkUserSql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            out.println("Username already exists. <a href='register.jsp'>Try again</a>");
        } else {
            // 비밀번호는 실제로는 해싱하여 저장해야 합니다.
            String hashedPassword = password; // 실제로는 해시 함수 사용 (예: BCrypt)

            String sql = "INSERT INTO users (username, password, email, created_at) VALUES (?, ?, ?, NOW())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, hashedPassword);
            pstmt.setString(3, email);
            pstmt.executeUpdate();

            // 회원가입 성공 시, 성공 페이지로 이동
            response.sendRedirect("registerSuccess.jsp");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
