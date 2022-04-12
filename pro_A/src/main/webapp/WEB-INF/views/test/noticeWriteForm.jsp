<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
</script>
<style type="text/css">

	.tblForm, .tblForm > tr, td {
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
	<form action="/pro_A/test/noticeNew.do" method="post">
		<table class="tblForm">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="noticeWriter" value="${dto.name }" readonly="readonly"></td>
				<td><input type="hidden" name="lectNo" value="${lectNo }"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
				
					<input type="text" name="noticeTitle" maxlength="100" style="width:567px;">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="30" cols="80" name="noticeContent" maxlength="4000"></textarea>
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
				<td colspan="2"><input type="submit" value="전송"></td>
			</tr>
					
		</table>
	</form>
</body>
</html>