<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/style/style.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../resources/js/validate.js"></script>
<title>Insert title here</title>
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
<script type="text/javascript">
	function formCheck(name,boardtype){
		let form = document.forms[name];
		let title = form[boardtype + "Title"].value;
		let content = form[boardtype + "Content"].value;
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
	<h1> 커뮤니티 게시판 글쓰기 구현중.jsp</h1>
	<form action="/pro_A/board/commuNew.do"  name="commuWriteForm" onsubmit="return formCheck(this.name,'commu')" method="post" enctype="multipart/form-data">
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