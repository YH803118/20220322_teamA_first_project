<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/pro12/test/modMember.do">
이름:<input type="text" name="id" readonly="readonly"><br>
비밀번호:<input type="password" name="pwd"><br>
이름:<input type="text" name="name"><br>
이메일:<input type="email" name="email"><br>
<input type="hidden" name="command" value="mod"><br>
<input type="submit" value="수정">
</form>
</body>
</html>