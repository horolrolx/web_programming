<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_team", "root", "1004");

        // 사용자명과 비밀번호를 검증합니다. 실제로는 비밀번호를 해싱하여 비교해야 합니다.
        String sql = "SELECT id FROM users WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            int userId = rs.getInt("id");

            // 로그인 성공 시 세션에 사용자 정보 저장
            session.setAttribute("userId", userId);
            session.setAttribute("username", username);
            response.sendRedirect("main.jsp");
        } else {
            out.println("Invalid username or password. <a href='login.jsp'>Try again</a>");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
