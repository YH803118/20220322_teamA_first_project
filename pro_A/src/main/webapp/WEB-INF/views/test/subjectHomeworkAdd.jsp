<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("utf-8"); 
	String lectNo = request.getParameter("subjectNo");
%>
<c:set var="lectNo" value="<%=lectNo %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br><input type='file' name='file"+cnt+"' />");
		cnt++;
	}
	
</script>
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
		height: 600px;
		margin: 10px;
		background-color: #eee;
	}
	textarea{
		width:520px;
		height:400px;
		margin:10px;
	}
</style>
</head>
<body>

<div id="subjectContent">
	<div id="subjectHomework">
	<form action="/pro_A/test/homeworkAdd.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td colspan="2">제목 : <input type="text" name="title"></td>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content">내용</textarea></td>
			</tr>
			<tr>
				<td colspan="2">기간 : <input type="date" name="endDate"></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td id="d_file"></td>
			</tr>
			<tr>
				<td><input type="button" value="파일추가" onClick="fn_addFile()"/></td>
				<td>
				<input type="hidden" name="lectNo" value="${lectNo}">
				<input type="hidden" name="subjectNo" value="${lectNo}">
				<input type="hidden" name="type" value="${dto.memberType}">
				<input type="submit" value="전송"></td>
			</tr>
		</table>
		</form>
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