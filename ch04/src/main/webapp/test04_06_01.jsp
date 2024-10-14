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
	Home > 영화 감상 후 평점
	<hr>
	<form action="test04_06_02.jsp" method="post">
		<fieldset style="width:180px">
			<legend> 영화 평점 </legend><p>
			재미있게 본 영화 : 
			<input type="text" name="movie_name"><br><br>
			평점 : <br><br>
			<input type="radio" name="star" value="★★★★★"> ★★★★★ <br>
			<input type="radio" name="star" value="★★★★☆"> ★★★★☆ <br>
			<input type="radio" name="star" value="★★★☆☆"> ★★★☆☆ <br>
			<input type="radio" name="star" value="★★☆☆☆"> ★★☆☆☆ <br>
			<input type="radio" name="star" value="★☆☆☆☆"> ★☆☆☆☆ <br>
			<hr>
			소감 : <br>
			<textarea name="review" cols="32" rows="3"></textarea>
			<hr>
			<div align="center">
				<input type="submit" value=" 제출하기 "> &nbsp;
				<input type="reset" value=" 다시작성 ">
			</div>
		</fieldset>
	</form>

</body>
</html>