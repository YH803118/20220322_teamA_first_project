<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	table {
	
		border : 1px solid;
		width : 75%;
		min-width: 500px;
		overflow: hidden;
	}
	ul {
		list-style: none;
	}
	
	ul > li {
		float: left;
	}
	
</style>
</head>
<body>
	<h1> 공지게시판 구현.jsp</h1>
			<a href="/pro_A/board/noticeWriteForm.do"> 글쓰기 </a>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${not empty noticeListTop }">
				<c:forEach var="noticeTop" items="${noticeListTop }" step="1">
					<tr>
						<td>${noticeTop.noticeNo }</td>
						<td>
							<a href="/pro_A/board/noticeDetail.do?noticeNo=${noticeTop.noticeNo }">
							${noticeTop.noticeTitle }</a>
						</td>
						<td>${noticeTop.noticeWriter }</td>
						<td>${noticeTop.noticeRegDate }</td>
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
							<a href="/pro_A/board/noticeDetail.do?noticeNo=${notice.noticeNo }">
						${notice.noticeTitle }</a>
						</td>
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
	<div class="searchBar">
		<form action="#">
			<select>
				<option value="noticeTitle">제목</option>
				<option value="noticeContent">내용</option>
				<input type="text" name="searchContent">
				<input type="submit" value="검색">
			</select>	
		</form>
	</div>
	<div>
		<ul>
			<c:if test="${pageDTO.prev }">
				<li><a href="/pro_A/board/noticeList.do?pageNum=${pageDTO.startPage-1 }">Prev</a></li>
			</c:if>
			
			<c:forEach var="pageNum" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
				<li><a href="/pro_A/board/noticeList.do?pageNum=${pageNum}">${pageNum }</a></li>
			</c:forEach>
			
			<c:if test="${pageDTO.next }">
				<li><a href=""/pro_A/board/noticeList.do?pageNum=${pageDTO.endPage+1 }">Next</a></li>
			</c:if>
		</ul>
	</div>	
	
</body>
</html>