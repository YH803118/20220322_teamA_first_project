<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<td colspan="3">
			<c:if test="${not empty noticeFiles  }">
				<c:forEach var="files" items="${ noticeFiles}">
					<a href="/pro_A/board/noticeDownload.do?noticeFileName=${files.noticeFileName }">${files.originalFileName }</a>
					<a href="/pro_A/board/noticeFileDel.do?noticeNo=${detailDTO.noticeNo }&noticeFileName=${files.noticeFileName }"><button>삭제</button></a><br>
				</c:forEach>
			</c:if>
			</td>
		</tr>
	</table>
	<a href="/pro_A/board/noticeDelete.do?noticeNo=${detailDTO.noticeNo }"><button>삭제</button></a>
	<a href="/pro_A/board/noticeModify.do?noticeNo=${detailDTO.noticeNo }"><button>수정</button></a>
</body>
</html>