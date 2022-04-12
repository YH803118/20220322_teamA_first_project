<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/style/style.css">
</head>
<body>
	<h1> ${detailDTO.noticeNo }번 게시물 </h1>
	<table class="tblView">
		<tr>
			<th class="tblViewlbl">작성자</th>
			<td class="tblViewlbl2">${detailDTO.noticeWriter }</td>
			<th class="tblViewlbl">작성일</th>
			<td width="120px">
				<fmt:parseDate value="${detailDTO.noticeRegDate}" 
				var="parseDate" pattern="yyyy-MM-dd"/> 
				<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>
		<tr>
			<th class="tblViewlbl">제목</th>
			<td class="tblViewlbl2">${detailDTO.noticeTitle }</td>
			<th class="tblViewlbl">조회수</th>
			<td>${detailDTO.noticeHit } </td>
		</tr>
		<tr>
			<td colspan="4">
				<textarea rows="20" name="noticeContent" readonly="readonly">${detailDTO.noticeContent }</textarea>
			</td>
		</tr>
		<tr>
			<th class="tblViewlbl">첨부파일</th>
			<td colspan="3">
			<c:if test="${not empty noticeFiles  }">
				<c:forEach var="files" items="${ noticeFiles}">
					<a href="/pro_A/board/noticeDownload.do?noticeFileName=${files.noticeFileName }">${files.originalFileName }</a><br>
				</c:forEach>
			</c:if>
			</td>
		</tr>
	</table>
	<c:if test="${isLogon == true && dto.memberType == 2  }">
	<div class="btn_lst">
		<a href="/pro_A/board/noticeDetail.do?noticeNo=${detailDTO.noticeNo }&mod=true&pageNum=${pageNum }"><button class="dbtn">수정</button></a>
		<a href="/pro_A/board/noticeDelete.do?noticeNo=${detailDTO.noticeNo }"><button class="dbtn">삭제</button></a>
		<a href="/pro_A/board/noticeList.do?pageNum=${pageNum }"><button class="dbtn">리스트</button></a>
	</div>
	</c:if>
</body>
</html>