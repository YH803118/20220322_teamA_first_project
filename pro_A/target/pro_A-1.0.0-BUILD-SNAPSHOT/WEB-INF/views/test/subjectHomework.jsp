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
	#subjectHomework{
		width: 540px;
		height: 600px;
		margin: 10px;
		background-color: #eee;
	}
</style>
</head>
<body>
<div id="subjectContent">
	<div id="subjectHomework">
		<table>
			<tr>
				<td width="80%" align="left">과제</td>
				<td>
					<c:if test="${dto.memberType eq 1}">
						<a href="/pro_A/test/subjectHomeworkAdd.do?subjectNo=${lectNo }"><button>과제등록</button></a>
					</c:if>
				</td>
			</tr>
			<c:forEach var="homework" items="${homeworkList }">
			<tr>
				<td  align="left">${homework.title }	</td>
				<td>${fn:split(homework.endDate, ' ')[0] } </td>		
			</tr>
			</c:forEach>
		</table>
	</div>	
</div>
<div id="subjectMenu">
	<table>
	<tr><th>
		<a href="#">${lectName }</a>
	</th></tr>
	<tr><td><a href="/pro_A/test/subjectNotice.do?subjectNo=${lectNo }&type=${dto.memberType}">공지사항</a></td></tr>
	<tr><td><a href="/pro_A/test/subjectHomework.do?subjectNo=${lectNo }&type=${dto.memberType}">과제</a></td></tr>
	</table>
</div>
</body>
</html>