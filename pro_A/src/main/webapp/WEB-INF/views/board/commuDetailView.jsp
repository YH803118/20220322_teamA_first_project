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
<title>상세페이지</title>
</head>
<body>
	<h1> ${detailDTO.commuNo } 게시물 </h1>
	<div class="detialview">
		<div class="cdtbtn_lst">
			<a href="/pro_A/board/commuDetail.do?commuNo=${detailDTO.commuNo }&mod=true&pageNum=${pageNum }"><button type="button">수정</button></a>
			<a href="/pro_A/board/commuDelete.do?commuNo=${detailDTO.commuNo }"><button type="button">삭제</button></a>
			<a href="/pro_A/board/commuList.do?pageNum=${pageNum }"><button type="button">리스트</button></a>
		</div>
			<table class="tblView">
			<tr>
				<th class="tblViewlbl commu_bgcolor">작성자</th>
				<td class="tblViewlbl2">${detailDTO.commuWriter }</td>
				<th class="tblViewlbl commu_bgcolor">작성일</th>
				<td width="120px">
					<fmt:parseDate value="${detailDTO.commuRegDate}" 
					var="parseDate" pattern="yyyy-MM-dd"/> 
					<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th class="tblViewlbl commu_bgcolor">제목</th>
				<td class="tblViewlbl2">${detailDTO.commuTitle }</td>
				<th class="tblViewlbl commu_bgcolor">조회수</th>
				<td>${detailDTO.commuHit }</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20" name="commuContent" readonly="readonly">${detailDTO.commuContent }</textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="replyBox commu_bgcolor">
		<form  action="/pro_A/board/replyNew.do" name="replyForm" onsubmit="return replyCheck(this.name)" method="post">
			<div class="replyWBox">
				<textarea name="replyContent" rows="3" maxlength="1000"></textarea>
				<input class="rbtn commu_bgcolor" type="submit" value="댓글작성">
				<input class="rbtn commu_bgcolor" type="reset" value="취소">
				<input type="hidden" name="commuNo" value="${detailDTO.commuNo }">
				<input type="hidden" name="replyWriter" value="작성자">
				<input type="hidden" name="pageNum" value="${pageNum }">
			</div>
		</form>
	</div>
	<button class="rbtn_view commu_bgcolor" name="replyVbtn" onclick="rp_view(this)">댓글 보기</button>
	<div class="replyList" style="display: none">
		<c:choose>
			<c:when test="${not empty replys }">
				<c:forEach var="reply" items="${replys }">
			<table class="replytbl commu_bgcolor">
			<tr>
				<td width="500px">작성자 : ${reply.replyWriter }</td>
				<td>작성일 : ${reply.replyRegDate }</td>
			</tr>
			<tr>
				<td>
				 <textarea name="replyContent" rows="1" readonly="readonly" >${reply.replyContent }</textarea>
				 <input type="hidden" name="replyNo" value="${reply.replyNo }">
				</td>
				<td style="text-align: center;">
					<button class="rbtn commu_bgcolor" name="replyMod" type="button">수정</button>
					<button class="rbtn commu_bgcolor" name="replyUpdate" type="button" style="display: none;">수정완료</button>
					<button class="rbtn commu_bgcolor" name="replyModCancle" type="button" style="display:none;">취소</button>
					<a href="/pro_A/board/replyDel.do?replyNo=${reply.replyNo }&commuNo=${detailDTO.commuNo }&pageNum=${pageNum}">
					<button class="rbtn commu_bgcolor" name="replyDel" type="button">삭제</button>
					</a>
				</td>
			</tr>
			</table>
				</c:forEach>
			</c:when>
			<c:otherwise>	
				작성된 댓글이 없습니다.
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>