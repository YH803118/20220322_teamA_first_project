<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#calendar {
	margin: 30px;
	width: 450px;
	height: 330px;
	background-color: red;
}

#login {
	float:right;
	margin: 30px;
	width: 260px;
	height: 200px;
	background-color:blue;
}

#notice {
	background-color: lightgreen;
	margin: 30px;
	width: 450px;
	height: 120px;
	left:0;
}

#community{
	background-color: green;
	width: 450px;
	height: 120px;
	margin: 30px;
	left:0;
}
</style>
</head>
<body>
<div id="login">
<form action="/pro_A/test/login.do">
	아이디 : <input type="text" name="id"><br>
	비밀번호 : <input type="text" name="pwd"><br>
	<input type="submit" value="로그인">
</form>
</div>
<div id="calendar"></div>
<div id="notice"></div>
<div id="community"></div>
</body>
</html>