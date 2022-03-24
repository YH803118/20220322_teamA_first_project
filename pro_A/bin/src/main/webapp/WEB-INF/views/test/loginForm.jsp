<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
   
    %>
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
	position: relative;
	float:right;
	margin: 30px;
	width: 260px;
	height: 200px;
	background-color:#aaaaaa;
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
.loginInput{
	width:50%;
}
#loginForm{
	width: 100%;
	text-align:center;
	float:left;
}
</style>
</head>
<body>
<c:choose>
<c:when test="${isLogOn=='true' }">
<div>
<h1>로그인</h1>
</div>
</c:when>
<c:otherwise>
<div id="login">
<form action="/pro_A/test/login.do" id="loginForm">
	&nbsp;아이디 &nbsp;&nbsp;: <input type="text" name="id" class="loginInput"><br>
	비밀번호 : <input type="text" name="pwd" class="loginInput"><br>
	<input type="submit" value="로그인">
</form>
</div>
</c:otherwise>
</c:choose>

<div id="calendar"></div>
<div id="notice"></div>
<div id="community"></div>
</body>
</html>