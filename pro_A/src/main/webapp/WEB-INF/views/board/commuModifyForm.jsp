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
	<h1> ${detailDTO.commuNo }번 게시글 수정 </h1>
	<form action="/pro_A/board/commuModify.do" name="commuModForm" onsubmit="return formCheck(this.name, 'commu')"  method="post">
		<table class="tblView">
			<tr>
				<th class="tblViewlbl commu_bgcolor">작성자</th>
				<td class="tblViewlbl2">
					<input type="hidden" name="commuWriter" value="${dto.name }">${dto.name }
					<input type="hidden" name="commuId" value="${dto.id }">
				<td width="120px">
					<fmt:parseDate value="${detailDTO.commuRegDate}" 
					var="parseDate" pattern="yyyy-MM-dd"/> 
					<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			<tr>
				<th class="tblViewlbl commu_bgcolor">제목</th>
				<td class="tblViewlbl2">
					<input type="text" name="commuTitle" value="${detailDTO.commuTitle }" maxlength="50">
				</td>
				<th class="tblViewlbl commu_bgcolor">조회수</th>
				<td>${detailDTO.commuHit }</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20" name="commuContent" maxlength="4000">${detailDTO.commuContent }</textarea>
				</td>
			</tr>
		</table>
		<input class="dbtn commu_bgcolor" type="submit" value="수정완료">
		<a href="/pro_A/board/commuDetail.do?commuNo=${detailDTO.commuNo }&pageNum=${pageNum }">
			<button class="dbtn commu_bgcolor" type="button">취소</button>
		</a>
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="commuNo" value="${detailDTO.commuNo }">
	</form>
</body>
</html>