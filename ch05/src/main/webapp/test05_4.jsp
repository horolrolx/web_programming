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
<title> 5장 연습문제 4번 </title>
<script type="text/javascript">
	function checkFun()
	{
		var f = document.loginForm;
		
		var author = f.author.value;
		var regExpAuthor = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ가-힣|]/;
		
		var email = f.email.value;
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(!regExpAuthor.test(author))
		{
			alert("작성자는 숫자로 시작할 수 없습니다.");
			f.author.focus();
			return false;
		}
		if(!regExpEmail.test(email))
		{
			alert("이메일 형식으로 입력해 주세요.");
			f.email.focus();
			return false;
		}
		else return true;
	}
</script>
</head>
<body>
	Home > 작성자와 이메일 주소 입력
	<hr>
	<form name="loginForm" action="test05_5.jsp" method="post" onsubmit="return checkFun()">
		작성자 : <br>
		<input type="text" name="author"><br><br>
		이메일 : <br>
		<input type="text" name="email"><br><br>
		<input type="submit" value=" 신청하기 ">
	</form>
</body>
</html>