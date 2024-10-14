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
<title> 4장 연습문제 5번 </title>
</head>
<body>
	<h3> 자기 소개서 폼 작성 </h3>
	<hr>
	<form action="#" method="get">
		<fieldset style="width:300px">
		<legend> 개인 정보 </legend><p>
		닉네임 :
		<input type="text" name="nickname">
		<input type="button" name="duplicheck" value=" 중복검사 "> <br><br>
		성별 : 
		<input type="radio" name="gender"> 남
		<input type="radio" name="gender"> 여 <br><br>
		게임장르 : 
		<input type="checkbox" name="gamegenre1"> 액션
		<input type="checkbox" name="gamegenre2"> 퍼즐
		<input type="checkbox" name="gamegenre3"> 전략
		<input type="checkbox" name="gamegenre4"> 리듬
		<hr>
		혈액형 :
		<select name"bloodtype">
			<option value="choice"> === 선택 === </option>
			<option value="A"> A 형 </option>
			<option value="B"> B 형 </option>
			<option value="O"> O 형 </option>
			<option value="AB"> AB 형 </option>
			<option value="IDK"> 모름 </option>
		</select><br><br>
		자기소개 : <br><br>
		<textarea cols="50" rows="10"></textarea>
		<div align="center">
			<input type="submit" value=" 전송하기 "> &nbsp;
			<input type="reset" value=" 다시작성 ">
		</div>
		</fieldset>
	</form>
</body>
</html>