<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String name=request.getParameter("name");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/pro_A/test/open.do">
강의명:<input type="text" name="lectName"><br>
교수명:<input type="text" name="name" value="<%=name %>" readonly="readonly"><br>
요일:<input type="text" name="lectDay" size="7"><br>
시간:<input type="text" name="begin" size="2">~<input type="text" name="end" size="2">교시<br>
<input type="submit" value="개설">
</form>
</body>
</html>