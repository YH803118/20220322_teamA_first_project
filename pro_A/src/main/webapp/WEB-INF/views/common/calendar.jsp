<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();
	String StrYear = request.getParameter("year");
	String StrMonth = request.getParameter("month");
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	cal.set(year, month, 1);
	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.

	Calendar todayCal = Calendar.getInstance();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");

	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="calendarFrm" id="calendarFrm" action="" method="post">
<div id="content" >
	<table>
		<tr>
			<td><input type="button" value="저번 달" onclick="location.href='year=<%=year%>&month=<%=month-1%>'"></td>
			<td><%=year %>년 <%=month %>월</td>
			<td><input type="button" value="다음 달" onclick="location.href='year=<%=year%>&month=<%=month+1%>'"></td>
		</tr>
	</table>
</div>
</form>
</body>
</html>