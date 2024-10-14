<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    * {
    	font-family: 'AppleGothic';
    }
</style>
<html>
<head>
<meta charset="UTF-8">
<title> 6장 연습문제 4 - 2</title>
</head>
<body>
	Home > 로그인 접속 완료
	<hr>
	<form action="test06_05.jsp" method="post">
		<%
			String u_id = request.getParameter("id");
			String u_pw = request.getParameter("pw");
			if(u_id.equals("송창석") && u_pw.equals("20204364"))
			{
				session.setAttribute("memberId", u_id);
				session.setAttribute("memberPw", u_pw);
				
				out.println("[ " + u_id + " ]님이 입장하였습니다. ");
			}
		%>
		<hr>
		<input type="submit" value=" Logout ">
	</form>
</body>
</html>