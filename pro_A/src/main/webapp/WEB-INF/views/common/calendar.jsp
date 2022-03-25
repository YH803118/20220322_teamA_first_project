<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	if(strYear != null){
	  year = Integer.parseInt(strYear);
	  month = Integer.parseInt(strMonth);
	}else{}

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
	<table border="1">
		<tr>
			<td colspan="7"><input type="button" value="저번 달" onclick="location.href='/pro_A/test/calendar.do?year=<%=year%>&month=<%=month-1%>'">
			<%=year %>년 <%=month+1 %>월
			<input type="button" value="다음 달" onclick="location.href='/pro_A/test/calendar.do?year=<%=year%>&month=<%=month+1%>'">
			</td>
		</tr>
		<tr>
		<td>일</td>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
		<td>토</td>
		</tr>
		<tr>
		<c:set var="start" value="<%=start %>" />
		<c:forEach var="i" begin="1" end="<%=endDay+start-1 %>" step="1">
			<c:if test="${i >= start }"><td>${i-start+1 }</td></c:if>
			<c:if test="${i%7 == 0 }"></tr><tr></c:if>
			<c:if test="${i < start }"><td></td></c:if>
		</c:forEach>
		</tr>
	</table>
</div>
</form>
</body>
</html>