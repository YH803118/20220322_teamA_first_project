<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/style/style.css">
<title>커뮤니티 게시판</title>
</head>
<body>
	<h1> 커뮤니티 게시판</h1>
	<c:if test="${isLogon == true }">
	<a href="/pro_A/board/commuWriteForm.do"><button class="wbtn commu_bgcolor">글쓰기</button></a>
	</c:if>
	<div class="tblBox">
		<table class="tblList">
			<tr class="tblListLabel commu_bgcolor">
				<th width="40px">번호</th>
				<th>제 목</th>
				<th width="80px">작성자</th>
				<th width="100px">작성일</th>
				<th width="50px">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${not empty commuList  }">
					<c:forEach var="commu" items="${commuList }" step="1">
						<tr>
							<td>${commu.commuNo }</td>
							<td>
								<a href="/pro_A/board/commuDetail.do?commuNo=${commu.commuNo }&pageNum=${pageDTO.curPage }">
									${commu.commuTitle } 
									<c:if test="${commu.replyCnt > 0 }">
										&nbsp;&nbsp; ${commu.replyCnt }
									</c:if>
								</a>
							</td>
							<td>${commu.commuWriter }</td>
							<td>
								${commu.commuRegDate }
							</td>
							<td>${commu.commuHit }</td>
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
			<form action="/pro_A/board/commuSearch.do" method="post">
				<select name="searchType">
					<option value="commuTitle">제목</option>
					<option value="commuContent">내용</option>
				</select>
					<input type="text" name="searchContent" maxlength="50">
					<input type="submit" value="검색">	
			</form>
		</div>
		
		<div class="navBar_c">
			<ul>
				<c:if test="${pageDTO.prev }">
					<li><a href="/pro_A/board/commuList.do?pageNum=${pageDTO.startPage-1 }">이전</a></li>
				</c:if>
				<c:forEach var="pageNum" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
					<li><a class="${pageDTO.curPage == pageNum ? 'pageActive' : '' }" href="/pro_A/board/commuList.do?pageNum=${pageNum}">${pageNum }</a></li>
				</c:forEach>
				<c:if test="${pageDTO.next }">
					<li><a href="/pro_A/board/commuList.do?pageNum=${pageDTO.endPage+1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>