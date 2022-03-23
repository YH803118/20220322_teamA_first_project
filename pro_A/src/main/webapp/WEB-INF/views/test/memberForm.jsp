<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/pro_A/test/addMember.do" method="post">
		<h1 style="text-align:center;">회원가입</h1>
		<table style="margin:auto;">
			<tr>
				<td width="	200">아이디</td>
				<td width="400"><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"></td>
			</tr>
			<tr>
				<td>
				<input type="radio" name="memberType" value="0">학생 
				<input type="radio" name="memberType" value="1">교수
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center;">
					<input type="submit" value="회원가입">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>