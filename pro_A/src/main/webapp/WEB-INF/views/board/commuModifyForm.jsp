<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.tblView, .tblView > tr, td {
		border : 1px solid;
		border-collapse: collapse;
		padding: 0px;
	}
	
	textarea {
		border-style : none;
		border:0px;
		padding:0px;
		resize: none;
	}
	
</style>
</head>
<body>
	<h1> 글수정 페이지 </h1>
	<form action="/pro_A/board/commuModify.do" method="post">
		<table class="tblView">
			<tr>
				<th>제목</th>
				<td>
				<input type="text" name="commuTitle" value="${detailDTO.commuTitle }">
				</td>
				<th>글쓴이</th>
				<td>${detailDTO.commuWriter }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">
				<textarea rows="30" cols="80" name="commuContent" maxlength="4000">${detailDTO.commuContent }</textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<a href="/pro_A/board/commuDetail.do?commuNo=${detailDTO.commuNo }&pageNum=${pageNum }"><button type="button">취소</button></a>
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="commuNo" value="${detailDTO.commuNo }">
	</form>
</body>
</html>