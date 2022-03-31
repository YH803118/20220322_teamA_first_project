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
			<td>${detailDTO.commuTitle }</td>
			<th>글쓴이</th>
			<td>${detailDTO.commuWriter }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">
				<textarea rows="30" cols="80" name="noticeContent" readonly="readonly">${detailDTO.commuContent }</textarea>
			</td>
		</tr>
	</table>
	<div style="margin-top: 10px;">
		<a href="/pro_A/board/commuDetail.do?commuNo=${detailDTO.commuNo }&mod=true&pageNum=${pageNum }"><button>수정</button></a>
		<a href="/pro_A/board/commuDelete.do?commuNo=${detailDTO.commuNo }"><button>삭제</button></a>
		<a href="/pro_A/board/commuList.do?pageNum=${pageNum }"><button>리스트</button></a>
	</div>
</body>
</html>