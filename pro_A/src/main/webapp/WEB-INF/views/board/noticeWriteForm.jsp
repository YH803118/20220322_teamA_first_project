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
	<h1>공지사항 작성</h1>
	<form action="/pro_A/board/noticeNew.do" name="noticeWForm" onsubmit="return formCheck(this.name, 'notice')"  method="post" enctype="multipart/form-data">
		<table class="tblView">
			<tr>
				<th class="tblViewlbl">작성자</th>
				<td class="tblViewlbl2"> 관리자
					<input type="hidden" name="noticeWriter" value="임시로">
				</td>
				<th class="tblViewlbl">작성일</th>
				<td id="regDate" width="120px"></td>
			</tr>
			<tr>
				<th class="tblViewlbl">제목</th>
				<td class="tblViewWrite">
					<input type="text" name="noticeTitle" maxlength="50">
				</td>
				<th class="tblViewlbl">상단고정</th>
				<td>
					<select name="noticeLevel">
						<option value="0">미고정</option>
						<option value="1">고정</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea rows="20"  name="noticeContent" maxlength="4000"></textarea>
				</td>
			</tr>
			<tr>
				<th style="padding-top:10px;" class="tblViewlbl">첨부파일<br>
					<button style="margin:10px 0 10px 0;" type="button" onclick="w_addFile()">파일추가</button>
				</th>
				<td id="d_file" colspan="3"></td>
			</tr>
		</table>
			<br>
			<input class="dbtn" type="submit" value="작성완료">
			<input class="dbtn" type="reset" value="취소">
			<a href="/pro_A/board/noticeList.do">
			<button class="dbtn" type="button">목록</button></a>
	</form>
</body>
</html>