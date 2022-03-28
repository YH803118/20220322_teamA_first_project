<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 상세페이지 내용 </h1>
	<table border="1px solid">
		<tr>
			<td>제목</td>
			<td>${detailDTO.noticeTitle }</td>
			<td>글쓴이</td>
			<td>${detailDTO.noticeWriter }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">${detailDTO.noticeContent }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td></td>
		</tr>
	</table>

</body>
</html>