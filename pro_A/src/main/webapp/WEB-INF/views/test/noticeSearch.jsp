<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

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
		background-color: #F08080;
		color : white;
	}
	
	.navBar {
		align-content: center;
		border: 1px solid;
		width : 740px;
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
	<h1> 검색 결과 구현.jsp</h1>
	<div style="float:right; margin:0 30px;"><a href="/pro_A/test/commuWriteForm.do"><button>글쓰기</button></a></div>
	<div class="tblBox">
		<table class="tblList">
			<tr class="tblListLabel">
				<th width="70px">번호</th>
				<th width="400px">제목</th>
				<th width="100px">작성자</th>
				<th width="100px">작성일</th>
				<th width="100px">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${not empty noticeListTop }">
					<c:forEach var="noticeTop" items="${noticeListTop }" step="1">
						<tr>
							<td><img alt="notice" src="../resources/img/alram.png" width="20px"></td>
							<td>
								<a href="/pro_A/test/noticeDetail.do?noticeNo=${noticeTop.noticeNo }">
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
				<c:when test="${not empty searchList  }">
					<c:forEach var="notice" items="${searchList }" step="1">
						<tr>
							<td>${notice.noticeNo }</td>
							<td>
								<a href="/pro_A/test/noticeDetail.do?noticeNo=${notice.noticeNo }">
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
			<form action="/pro_A/test/noticeSearch.do" method="post">
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
					<li><a href="/pro_A/test/noticeSearch.do?pageNum=${pageDTO.startPage-1 }&searchType=${searchType}&searchContent=${searchContent}">이전</a></li>
				</c:if>
				<c:forEach var="pageNum" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
					<li><a href="/pro_A/test/noticeSearch.do?pageNum=${pageNum}&searchType=${searchType}&searchContent=${searchContent}">${pageNum }</a></li>
				</c:forEach>
				<c:if test="${pageDTO.next }">
					<li><a href="/pro_A/test/noticeSearch.do?pageNum=${pageDTO.endPage+1 }&searchType=${searchType}&searchContent=${searchContent}">다음</a></li>
				</c:if>
			</ul>
		</div>	
	</div>
</body>
</html>