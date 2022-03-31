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
	<form action="/pro_A/board/noticeModify.do" method="post" enctype="multipart/form-data">
		<table class="tblView">
			<tr>
				<th>제목</th>
				<td>${detailDTO.noticeTitle }
					<input type="hidden" name="noticeTitle" value="${detailDTO.noticeTitle }">
				</td>
				<th>글쓴이</th>
				<td>${detailDTO.noticeWriter }
					<input type="hidden" name="noticeWriter" value="${detailDTO.noticeWriter }">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3">
				<textarea rows="30" cols="80" name="noticeContent" maxlength="4000">${detailDTO.noticeContent }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td colspan="3">
				<c:if test="${not empty noticeFiles  }">
					<c:forEach var="files" items="${ noticeFiles}" varStatus="i" step="1">
						<input type="file" name="file${i }" value="${files.noticeFileName }" >${files.originalFileName }<br>
					</c:forEach>
				</c:if>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<a href="/pro_A/board/noticeDetail.do?noticeNo=${detailDTO.noticeNo }&pageNum=${pageNum }"><button type="button">취소</button></a>
	</form>
</body>
</html>