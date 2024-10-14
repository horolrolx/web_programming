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
<title> 7장 연습문제 4 - 1 </title>
</head>
<body>
	Home > 로그인 폼 화면
	<hr>
	<form name="loginForm" action="test07_04_2.jsp" method="post">
		<fieldset style="width:260px">
			<legend> 아이디로 로그인 </legend><p>
			<table>
			<tr height="30">
				<td align="right">아이디&nbsp;</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr height="30">
				<td align="right">비밀번호&nbsp;</td>
				<td><input type="password" name="passwd"></td>
			</tr>
			<tr height="50">
				<td></td>
				<td><input type="submit" value=" >> 로그인 >> "></td>
			</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>