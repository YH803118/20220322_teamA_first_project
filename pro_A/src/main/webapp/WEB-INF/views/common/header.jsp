<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#menu {
	width: 710px;
	height: 30px;
	position: relative;
	left: 30px;
	top: 130px;
}
#menu ul li{
	position: relative;
	left: 30px;
	float:left;
	vertical-align: middle;
	line-height: 30px;
	background-color: #2d2d2d;
	text-align:center;
	list-style: none;
}
#menu li a{
	display:block;
	color:#fff;
	text-decoration: none;
	padding: 0px 40px;
}
#menu li:hover > a{
	background:#aaaaaa;
	color:black;
}
</style>
</head>
<body><div id="menu">
<ul>
	<li><a href="#">공지사항</a></li>
	<li><a href="#">질의응답</a></li>
	<li><a href="#">자료실</a></li>
	<li><a href="#">커뮤니티</a></li>
</ul>
</div>
</body>
</html>