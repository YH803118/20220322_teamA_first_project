<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#menu {
		width:100%;
		display:flex;
		position : absolute;
		margin-top:130px;
		background-color: #2d2d2d;
}

#menu ul {
	justify-content : center;
	position: relative;
}

#menu ul li{
	left: 30px;
	float:left;
	vertical-align: middle;
	line-height: 30px;
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
<body>
	<div id="menu">
	<ul>
		<li><a href="/pro_A/board/noticeList.do">공지사항</a></li>
		<li><a href="#">질의응답</a></li>
		<li><a href="#">자료실</a></li>
		<li><a href="#">커뮤니티</a></li>
	</ul>
	</div>
	<c:choose>
	<c:when test="${isLogOn=='true' }">
		<a href="/pro_A/member/modMember.do?id=${member.id }"><h3>${member.id }</h3></a>
		<a href="/pro_A/member/logout.do"><h3>로그아웃</h3></a>
	</c:when>
</c:choose>
</body>
</html>