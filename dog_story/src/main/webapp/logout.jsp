<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 세션을 무효화하여 로그아웃 처리
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
