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
<title> 6장 연습문제 4 - 3</title>
</head>
<body>
	Home > 세션 삭제 후 로그아웃
	<hr>
	<form target="_blank">
	<%
		long last_time = session.getLastAccessedTime();
		long start_time = session.getCreationTime();
		long keping_time = (last_time - start_time) / 60000;
		out.println(" * 로그인 접속시간 : " + keping_time + " 분");
		session.invalidate();
	%>
	</form>
	<hr>
	<p> ~ 로그아웃 하였습니다. ~
</body>
</html>