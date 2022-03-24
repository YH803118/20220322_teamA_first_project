<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 공지게시판 구현.jsp</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${not empty noticeList  }">
				<c:forEach var="notice" items="${noticeList }" step="1">
					<tr>
						<td>${notice.noticeNo }</td>
						<td>${notice.noticeTitle }</td>
						<td>${notice.noticeWriter }</td>
						<td>${notice.noticeRegDate }</td>
						<td>${notice.noticeHit }</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">데이터가 없음</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>