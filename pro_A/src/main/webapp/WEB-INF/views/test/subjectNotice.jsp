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
	
	.tblBox{
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.tblList {
		border-top: 1px solid;
		border-collapse: collapse;
		margin: 30px;
		width: 740px;
		vertical-align: middle;
	}
	
	
	.tblList > tr, td, th {
		border-bottom : 1px solid black;
		padding: 0px;
	} 
	
	.tblListLabel{
		background-color: skyblue;
		color : white;
	}
	
	.navBar {
		align-content: center;
		border: 1px solid;
		width: 740px;
	}
	
	ul {
		list-style: none;
		display: table;
		margin: 0 auto;
	}
	
	ul > li {
		float: left;
	}
</style>
</head>
<body>
<h1>공지사항 </h1>
	<c:choose>
	<c:when test="${dto.memberType==1 }">
	<div style="float:right; margin:0 30px;">
		<a href="/pro_A/test/noticeWriteForm.do?lectNo=${lectNo }&name=${name}"><button>글쓰기</button></a></div>
	</c:when>
	</c:choose>
	<div class="tblBox">

		
		<table class="tblList">
			<tr class="tblListLabel">
				<th width="40px">번호</th>
				<th>제목</th>
				<th width="80px">작성자</th>
				<th width="100px">작성일</th>
				<th width="50px">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${not empty noticeListTop }">
					<c:forEach var="noticeTop" items="${noticeListTop }" step="1">
						<tr>
							<td><img alt="notice" src="../resources/img/alram.png" width="20px"></td>
							<td>
								<a href="/pro_A/test/noticeDetail.do?noticeNo=${noticeTop.noticeNo }&pageNum=${pageDTO.curPage}">
								${noticeTop.noticeTitle }</a>
							</td>
							<td>${noticeTop.noticeWriter }</td>
							<td>
								<fmt:parseDate value="${noticeTop.noticeRegDate}" var="parseDate" pattern="yyyy-MM-dd"/> 
								<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td>${noticeTop.noticeHit }</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${not empty noticeList  }">
					<c:forEach var="notice" items="${noticeList }" step="1">
						<tr>
							<td>${notice.noticeNo }</td>
							<td>
								<a href="/pro_A/test/noticeDetail.do?noticeNo=${notice.noticeNo }&pageNum=${pageDTO.curPage}">
								${notice.noticeTitle }</a>
							</td>
							<td>${notice.noticeWriter }</td>
							<td>
								<fmt:parseDate value="${notice.noticeRegDate}" var="parseDate" pattern="yyyy-MM-dd"/> 
								<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd"/>
							</td>
							<td>${notice.noticeHit }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">데이터가 없음22</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
</body>
</html>