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
<script type="text/javascript">
	function formCheck(name){
		let form = document.forms[name];
		let title = form["commuTitle"].value;
		let content = form["commuContent"].value;
		if(title=="" || title.length == 0){
			alert("제목이 비어있습니다.");
			return false;
		} else if (content == "" || content.length == 0 ) {
			alert("내용이 비어있습니다.");
			return false;
		} else {
			alert("게시글이 작성되었습니다.");
			return true;
		} 
	}
</script>
</head>
<body>
	<h1> 글수정 페이지 </h1>
	<form action="/pro_A/board/commuModify.do" name="commuModForm"  onsubmit="return formCheck(this.name)"  method="post">
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
		<input type="submit" value="수정완료">
		<a href="/pro_A/board/commuDetail.do?commuNo=${detailDTO.commuNo }&pageNum=${pageNum }"><button type="button">취소</button></a>
		<input type="hidden" name="pageNum" value="${pageNum }">
		<input type="hidden" name="commuNo" value="${detailDTO.commuNo }">
	</form>
</body>
</html>