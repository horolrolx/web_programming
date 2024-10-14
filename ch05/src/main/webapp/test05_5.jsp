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
<title> 5장 연습문제 5번 </title>
</head>
<body>
	<%
		String author = request.getParameter("author");
		String email = request.getParameter("email");
	%>
	<p> 작성자 : <%= author %>
	<p> 이메일 : <%= email %>
</body>