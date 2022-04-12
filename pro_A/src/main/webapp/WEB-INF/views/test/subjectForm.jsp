<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#subjectMenu{
		margin:30px;
		width:150px;
		height: 800px;
		background-color: gray;
	}
	#subjectContent{
		width:560px;
		height: 800px;
		margin: 0 30px 0 0;
		float:right;
		background-color: gray;
	}
</style>
</head>
<body>
<div id="subjectContent">
	<div id="subjectNotice">
		<%-- <table>
			<tr>
				<td width="80%" align="left">공지사항</td>
				<td><a href="/pro_A/test/subjectNotice.do?subjectNo=${lectNo }">전체보기</a></td>
			</tr>
			<c:forEach var="notice" items="${noticeList }">
			<tr>
				<td  align="left">${notice.noticeTitle }	</td>
				<td>${fn:split(notice.noticeRegDate, ' ')[0] } </td>		
			</tr>
			</c:forEach>
		</table>
	</div>
	<div id="subjectHomework">
		<table>
			<tr>
				<td width="80%" align="left">과제</td>
				<td><a href="/pro_A/test/subjectHomework.do?subjectNo=${lectNo }">전체보기</a></td>
			</tr>
			<c:forEach var="homework" items="${homework }">
			<tr>
				<td  align="left">${homework.Title }	</td>
				<td>${fn:split(homework.endDate, ' ')[0] } </td>		
			</tr>
			</c:forEach>
		</table> --%>
	</div>	
</div>
<div id="subjectMenu">
	<table>
	<tr><th>
		<a href="#">${lectName }</a>
	</th></tr>

	<tr><td><a href="/pro_A/test/subjectNotice.do?lectNo=${lectNo }&type=${dto.memberType}">공지사항</a></td></tr>

	<tr><td><a href="/pro_A/test/subjectNotice.do?subjectNo=${lectNo }&type=${dto.memberType}">공지사항</a></td></tr>
	<tr><td><a href="/pro_A/test/subjectHomework.do?subjectNo=${lectNo }&type=${dto.memberType}">과제</a></td></tr>
	</table>
</div>
</body>
</html>