<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("utf-8"); 
	String lectNo = request.getParameter("subjectNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../resources/js/board.js"></script>
<style>
	#subjectMenu{
		margin:30px;
		width:150px;
		height: 800px;
		background-color: gray;
	}
	#subjectContent{
		width:560px;
		height: 800px;
		margin: 0 30px 0 0;
		float:right;
		background-color: gray;
	}
	#subjectHomework{
		width: 540px;
		margin: 10px;
		background-color: #eee;
	}
	#textarea{
		width:520px;
		height:360px;
		margin:10px;
	}
	#studentTextarea{
		width:520px;
		height:150px;
		margin:10px;
	}
</style>
</head>
<body>

<div id="subjectContent">
	<div id="subjectHomework">
	<table>
		<tr>
			<th colspan="2">제목 : ${homeworkDTO.title }</th>
		</tr>	
		<tr>
			<td colspan="2">
				<textarea id="textarea">${homeworkDTO.content }</textarea>
			</td>
		</tr>
		<tr>
			<td>제출기한</td>
			<td>${homeworkDTO.endDate }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
			<c:if test="${not empty homeworkFiles  }">
				<c:forEach var="files" items="${homeworkFiles}">
					<a href="/pro_A/test/homeworkDownload.do?homeworkFileName=${files.homeworkFileName }">${files.originalFileName }</a><br>
				</c:forEach>
			</c:if>
			</td>
		</tr>
	</table>
	<hr>
	<c:choose>
		<c:when test="${dto.memberType eq 1 }">
		<table>
			<tr><td>제출여부</td></tr>
			
			<c:forEach var="student" items="${studentList}">
			<c:set var="doneLoop" value="true" />
				<c:if test="${doneLoop}">
				<tr>
					<td>${student.name }</td>
					<c:forEach var="submitList" items="${submitList }">
						<c:if test="${student.id == submitList.id }">
							<td>제출완료</td>
							<tr>
								<td>${submitList.content }</td>
								<td>첨부파일</td>
								<td>
								<c:if test="${not empty submitFiles  }">
									<c:forEach var="files" items="${submitFiles}">
										<c:if test="${student.id == files.id }">
										<a href="/pro_A/test/homeworkSubmit.do?submitFileName=${files.submitFileName }">${files.originalFileName }</a><br>
										</c:if>
									</c:forEach>
								</c:if>
								</td>
							</tr>
							<c:set var="doneLoop" value="false" />
						</c:if>
					</c:forEach>
					<c:if test="${doneLoop == true }"><td>미제출</td></c:if>
				</tr>
				</c:if>
			</c:forEach>
		</table>
		</c:when>
		<c:otherwise>
		<c:set var="submitOk" value="false" />
		<c:forEach var="submitList" items="${submitList }">
			<c:if test="${dto.id == submitList.id }">
				<table>
					<tr>
						<td>${submitList.content }</td>
						<td>첨부파일</td>
						<td>
						<c:if test="${not empty submitFiles  }">
							<c:forEach var="files" items="${submitFiles}">
								<c:if test="${student.id == files.id }">
								<a href="/pro_A/test/homeworkSubmit.do?submitFileName=${files.submitFileName }">${files.originalFileName }</a><br>
								</c:if>
							</c:forEach>
						</c:if>
						</td>
					</tr>
				</table>
				<c:set var="submitOk" value="true" />
			</c:if>
		</c:forEach>
		<c:if test="${submitOk == false }">
			<form action="/pro_A/test/homeworkSubmit.do" method="post" enctype="multipart/form-data">
					<table>
					<tr>
						<td colspan="2">
							<textarea name="content" id="studentTextarea">내용</textarea>
						</td>
					</tr>
					<tr>
						<th style="padding-top:10px; width:30%;" class="tblViewlbl">첨부파일<br>
							<button style="margin:10px 0 10px 0;" type="button" onclick="w_addFile()">파일추가</button>
						</th>
						<td id="d_file"></td>
					</tr>
						<tr><td colspan="2">
						<input type="hidden" name="id" value="${dto.id }">
						<input type="submit" value="제출"></td></tr>
					</table>
						<input type="hidden" name="homeworkNo" value="${homeworkDTO.homeworkNo }">
						<input type="hidden" name="lectNo" value="${lectNo }">
				</form>
		</c:if>
		</c:otherwise>
	</c:choose>
	</div>	
</div>
<div id="subjectMenu">
	<table>
	<tr><th>
		<a href="#">${lectName }</a>
	</th></tr>
	<tr><td><a href="/pro_A/test/subjectNotice.do?subjectNo=${lectNo }&type=${dto.memberType}">공지사항</a></td></tr>
	<tr><td><a href="/pro_A/test/subjectHomework.do?subjectNo=${lectNo }&type=${dto.memberType}">과제</a></td></tr>
	</table>
</div>
</body>
</html>