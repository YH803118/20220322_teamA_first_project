<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/style/style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../resources/js/board.js"></script>
<script src="../resources/js/date.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1> 커뮤니티 게시글 작성</h1>
	<form action="/pro_A/board/commuNew.do"  name="commuWriteForm" onsubmit="return formCheck(this.name,'commu')" method="post" enctype="multipart/form-data">
		<table class="tblView">
			<tr>
				<th class="tblViewlbl commu_bgcolor">작성자</th>
				<td class="tblViewlbl2">
					<input type="hidden" name="commuWriter" value="${dto.name }">${dto.name }
					<input type="hidden" name="commuId" value="${dto.id }">
				</td>
				<th class="tblViewlbl commu_bgcolor" >작성일</th>
				<td id="regDate" width="120px"></td>
			</tr>
			<tr>
				<th class="tblViewlbl commu_bgcolor">제목</th>
				<td class="tblViewWrite" colspan="2">
					<input type="text" name="commuTitle" maxlength="50">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20" name="commuContent" maxlength="4000"></textarea>
				</td>
			</tr>
		</table>
		<br>
		<input class="dbtn commu_bgcolor" type="submit" value="작성완료">
		<input class="dbtn commu_bgcolor" type="reset" value="취소">
		<a href="/pro_A/board/commuList.do">
			<button class="dbtn commu_bgcolor" type="button">목록</button>
		</a>
	</form>
</body>
</html>