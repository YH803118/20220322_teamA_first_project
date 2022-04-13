<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<br>
<br>
<br>
<form action="/pro_A/test/modForm.do">
아이디:<input type="text" name="id" readonly="readonly" value="${dto.id }"><br>
비밀번호:<input type="password" name="pwd" value="${dto.pwd }"><br>
이름:<input type="text" name="name" value="${dto.name }"><br>
이메일:<input type="email" name="email" value="${dto.email }"><br>
<input type="hidden" name="command" value="mod"><br>
<input type="submit" value="수정">
</form>
</body>
</html>