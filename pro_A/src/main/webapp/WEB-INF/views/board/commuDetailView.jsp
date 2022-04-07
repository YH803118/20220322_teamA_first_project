<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/style/style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../resources/js/board.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1> 상세페이지 내용 </h1>
	<div class="detialview">
		<div class="cdtbtn_lst">
			<a href="/pro_A/board/commuDetail.do?commuNo=${detailDTO.commuNo }&mod=true&pageNum=${pageNum }"><button type="button">수정</button></a>
			<a href="/pro_A/board/commuDelete.do?commuNo=${detailDTO.commuNo }"><button type="button">삭제</button></a>
			<a href="/pro_A/board/commuList.do?pageNum=${pageNum }"><button type="button">리스트</button></a>
		</div>
			<table class="tblView">
			<tr>
				<th class="tblViewlbl">작성자</th>
				<td class="tblViewlbl2">${detailDTO.commuWriter }</td>
				<th class="tblViewlbl">작성일</th>
				<td width="120px">
					<fmt:parseDate value="${detailDTO.commuRegDate}" 
					var="parseDate" pattern="yyyy-MM-dd"/> 
					<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th class="lblViewlbl">제목</th>
				<td class="lblViewlbl2">${detailDTO.commuTitle }</td>
				<th class="lblViewlbl">조회수</th>
				<td>${detailDTO.commuHit }</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20" name="commuContent" readonly="readonly">${detailDTO.commuContent }</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="replyBox">
		<form  action="/pro_A/board/replyNew.do" name="replyForm" onsubmit="return replyCheck(this.name)" method="post">
			<div class="replyWBox">
				<textarea name="replyContent" rows="3" maxlength="1000"></textarea>
				<input class="rbtn" type="submit" value="댓글작성">
				<input class="rbtn" type="reset" value="취소">
				<input type="hidden" name="commuNo" value="${detailDTO.commuNo }">
				<input type="hidden" name="replyWriter" value="작성자">
				<input type="hidden" name="pageNum" value="${pageNum }">
			</div>
		</form>
	</div>
	<button class="rbtn_view">댓글 보기</button>
	<div class="replyList">
		<table>
		<c:choose>
			<c:when test="${not empty replys }">
				<c:forEach var="reply" items="${replys }">
			<tr>
				<td> ${reply.replyWriter }</td>
				<td>  ${reply.replyRegDate } </td>
			</tr>
			<tr>
				<td>
				 <textarea rows="2">${reply.replyContent }</textarea>
				</td>
				<td>
				</td>
			</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>	
				작성된 댓글이 없습니다.
			</c:otherwise>
		</c:choose>
		</table>
	</div>
</body>
</html>