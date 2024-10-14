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
<title> 4장 연습문제 6번 - 1 </title>
</head>
<body>
	Home > 영화 감상 후 결과
	<hr>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String moviename = request.getParameter("movie_name");
		String rating = request.getParameter("star");
		String review = request.getParameter("review");
	%>
		<p> 재미있게 본 영화 : <%= moviename %>
		<p> 평점 : <%= rating %>
		<p> 소감 : <%= review %>
</body>
</html>