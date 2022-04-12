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
	<h1> 상세페이지 내용 </h1>
	<table class="tblView">
		<tr>
			<th>제목</th>
			<td>${detailDTO.noticeTitle }</td>
			<th>글쓴이</th>
			<td>${detailDTO.noticeWriter }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">
				<textarea rows="30" cols="80" name="noticeContent" readonly="readonly">${detailDTO.noticeContent }</textarea>
			</td>
		</tr>
	</table>
	<c:choose>
	<c:when test="${dto.memberType==1 }">
	<div style="margin-top: 10px;">
		<a href="/pro_A/test/noticeDetail.do?noticeNo=${detailDTO.noticeNo }&mod=true&pageNum=${pageNum }"><button>수정</button></a>
		<a href="/pro_A/test/noticeDelete.do?noticeNo=${detailDTO.noticeNo }"><button>삭제</button></a>
		<a href="/pro_A/test/noticeList.do?pageNum=${pageNum }"><button>리스트</button></a>
	</div>
	</c:when>
	</c:choose>
</body>
</html>