<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/style/style.css">
<title>Insert title here</title>
</head>
<body>
	<h1> 공지사항 게시판 </h1>
		<a href="/pro_A/board/noticeWriteForm.do">
			<button class="wbtn">게시글 작성</button>
		</a>
	<div class="tblBox">
		<table class="tblList">
			<tr class="tblListLabel">
				<th width="40px">번호</th>
				<th>제 목</th>
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
								<a href="/pro_A/board/noticeDetail.do?noticeNo=${noticeTop.noticeNo }&pageNum=${pageDTO.curPage}">
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
								<a href="/pro_A/board/noticeDetail.do?noticeNo=${notice.noticeNo }&pageNum=${pageDTO.curPage}">
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
						<td colspan="5">데이터가 없음</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<div class="searchBar">
			<form action="/pro_A/board/noticeSearch.do" method="post">
				<select name="searchType">
					<option value="noticeTitle">제목</option>
					<option value="noticeContent">내용</option>
				</select>
					<input type="text" name="searchContent" maxlength="50">
					<input type="submit" value="검색">	
			</form>
		</div>
		<div class="navBar">
			<ul>
				<c:if test="${pageDTO.prev }">
					<li><a href="/pro_A/board/noticeList.do?pageNum=${pageDTO.startPage-1 }">&lt;</a></li>
				</c:if>
				<c:forEach var="pageNum" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
					<li><a href="/pro_A/board/noticeList.do?pageNum=${pageNum}">${pageNum }</a></li>
				</c:forEach>
				<c:if test="${pageDTO.next }">
					<li><a href="/pro_A/board/noticeList.do?pageNum=${pageDTO.endPage+1 }">&gt;</a></li>
				</c:if>
			</ul>
		</div>	
	</div>
</body>
</html>