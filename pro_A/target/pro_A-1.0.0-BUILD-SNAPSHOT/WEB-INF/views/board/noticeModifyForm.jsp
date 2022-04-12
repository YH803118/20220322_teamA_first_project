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
	<h1> ${detailDTO.noticeNo } 게시글 수정</h1>
	<form action="/pro_A/board/noticeModify.do"  name="modForm" onsubmit="return formCheck(this.name, 'notice')" method="post" enctype="multipart/form-data">
		<table class="tblView_mod">
			<tr>
				<th class="tblViewlbl">작성자</th>
				<td class="tblViewlbl2">${detailDTO.noticeWriter }
				<input type="hidden" name="noticeWriter" value="${detailDTO.noticeWriter }">
				</td>
				<th class="tblViewlbl">작성일</th>
				<td width="120px">
					<fmt:parseDate value="${detailDTO.noticeRegDate}" 
							var="parseDate" pattern="yyyy-MM-dd"/> 
					<fmt:formatDate value="${parseDate }" pattern="yyyy-MM-dd"/>
				</td>
			<tr>
				<th class="tblViewlbl">제목</th>
				<td class=tblViewWrite>
				<input type="text" name="noticeTitle" value="${detailDTO.noticeTitle }" maxlength="50">
				</td>
				<th class="tblViewlbl">조회수</th>
				<td>${detailDTO.noticeHit }</td>
			</tr>
			<tr>
				<td colspan="4">
				<textarea rows="20" name="noticeContent" maxlength="4000">${detailDTO.noticeContent }</textarea>
			</td>
			</tr>
			<tr>
				<th style="padding-top:10px;" class="tblViewlbl">첨부파일<br>
				<button style="margin:10px 0 10px 0;" type="button" onclick="mod_addFile()">파일추가</button>
				</th>
				<td class="fileT" colspan="3">
				<c:choose>
					<c:when test="${not empty noticeFiles  }">
						<ul class="fileList">
							<c:forEach var="files" items="${ noticeFiles}" varStatus="i" step="1">
								<li>${files.originalFileName } 
									<input type="hidden" name="saveFile" value=${files.originalFileName }> 
									<button type="button" name="btn${i.count }" onclick="fn_delFile(this)">삭제</button>
								</li>
							</c:forEach>
						</ul>
					</c:when>
					<c:otherwise>
						첨부파일이 없습니다.
					</c:otherwise>
				</c:choose>
				</td>
			</tr>
		</table>
		<div class="btn_lst">
			<input class="dbtn" type="hidden" name="noticeNo" value="${detailDTO.noticeNo }">
			<input class="dbtn" type="submit" value="수정완료">
			<a href="/pro_A/board/noticeDetail.do?noticeNo=${detailDTO.noticeNo }&pageNum=${pageNum }">
			 <button class="dbtn" type="button">취소</button>
			</a>
		</div>
	</form>
</body>
</html>