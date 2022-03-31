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
		border : 1px solid;
		min-width: 500px;
		width : 1000px;
		border-collapse: collapse;
		vertical-align: middle;
	}
	
	.tblList > tr, td, th {
		border : 1px solid;
		border-color : black;
		padding: 0px;
	} 
	
	.tblListLabel{
		background-color: maroon;
		color : white;
	}
	
	.navBar {
		align-content: center;
		border: 1px solid;
		width : 1000px;
	}
	
	ul {
		list-style: none;
		display: inline;
	}
	
	ul > li {
		float: left;
		
	}
	
</style>
</head>
<body>
	<h1> 커뮤니티 게시판 구현.jsp</h1>
	<div class="tblBox">
		<a href="/pro_A/board/commuWriteForm.do"><button style="margin-left: 945px; margin-bottom: 10px;">글쓰기</button></a>
		<table class="tblList">
			<tr class="tblListLabel">
				<th width="70px">번호</th>
				<th width="400px">제목</th>
				<th width="100px">작성자</th>
				<th width="100px">작성일</th>
				<th width="100px">조회수</th>
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
		<div class="navBar">
			<ul>
				<c:if test="${pageDTO.prev }">
					<li><a href="/pro_A/board/commuList.do?pageNum=${pageDTO.startPage-1 }">이전</a></li>
				</c:if>
				<c:forEach var="pageNum" begin="${pageDTO.startPage }" end="${pageDTO.endPage }">
					<li><a href="/pro_A/board/commuList.do?pageNum=${pageNum}">${pageNum }</a></li>
				</c:forEach>
				<c:if test="${pageDTO.next }">
					<li><a href="/pro_A/board/commuList.do?pageNum=${pageDTO.endPage+1 }">다음</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</body>
</html>