<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var cnt=1;
	function fn_addFile(){
		$("#d_file").append("<br><input type='file' name='file"+cnt+"' />");
		cnt++;
	}
	
</script>
</head>
<body>
	<form action="/pro_A/board/noticeNew.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="hidden" name="noticeWriter" value="임시로">임시로</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="noticeTitle" maxlength="20">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<input type="text" name="noticeContent" maxlength="5000">
				</td>
			</tr>
			<tr>
				<td>고정</td>
				<td>
					<select name="noticeLevel">
						<option value="0">미고정</option>
						<option value="1">고정</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td id="d_file"></td>
			</tr>
			<tr>
				<td><input type="button" value="파일추가" onClick="fn_addFile()"/>
				<td><input type="submit" value="전송"></td>
			</tr>
					
		</table>
	</form>
</body>
</html>