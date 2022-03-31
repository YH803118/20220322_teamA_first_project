<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	<form action="/pro_A/board/commuNew.do" method="post" enctype="multipart/form-data">
		<table class="tblForm">
			<tr>
				<td>작성자</td>
				<td><input type="hidden" name="commuWriter" value="세션로그인아이디">세션로그인아이디로</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="commuTitle" maxlength="100" style="width:567px;">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea rows="30" cols="80" name="commuContent" maxlength="4000"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="작성완료">
				<a href="/pro_A/board/commuList.do"><button type="button">목록</button></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>