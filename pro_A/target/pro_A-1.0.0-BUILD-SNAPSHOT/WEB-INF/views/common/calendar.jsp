<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page import="java.util.Calendar"%>

<%
Calendar cal = Calendar.getInstance();
String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if (strYear != null) {
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
} else {
}

if (month > 11) {
	month = 0;
	year++;
} else if (month < 0) {
	month = 11;
	year--;
}

cal.set(year, month, 1);
int startDay = cal.getMinimum(java.util.Calendar.DATE);
int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
int newLine = 0;

//오늘 날짜 저장.

Calendar todayCal = Calendar.getInstance();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String stringToday = sdf.format(todayCal.getTime());

SimpleDateFormat sdfYM = new SimpleDateFormat("yyyy-MM-");
String yearMonth = sdfYM.format(cal.getTime());
//int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
%>

<%
String schedule = request.getParameter("schedule");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#calendarFrm table {
	width: 450px;
	height: 330px;
	background-color: gray;
}

#calendarFrm a {
	display: block;
	color: black;
	text-decoration: none;
	text-align: center;
}

#calendarFrm td:hover>a {
	color: #fff;
	background-color: #2E2E2E;
}

#scheduleOn {
	background-color: #aaaaaa;
}
</style>
</head>
<body>
	<c:set var="yearMonth" value="<%=yearMonth%>" />
	<form name="calendarFrm" id="calendarFrm" action="" method="post">
		<div id="content">
			<table>
				<tr>
					<td colspan="7"><input type="button" value="저번 달"
						onclick="location.href='${contextPath }/test/calendar.do?year=<%=year%>&month=<%=month-1%>'">
						<%=year%>년 <%=month + 1%>월 
						<input type="button" value="다음 달"
						onclick="location.href='${contextPath }/test/calendar.do?year=<%=year%>&month=<%=month+1%>'">
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
					<c:set var="start" value="<%=start%>" />
					<c:forEach var="i" begin="1" end="<%=endDay + start - 1%>" step="1">
						<c:if test="${i >= start }">
							<td><c:set var="date" value="${i-start+1 }" /> <c:if
									test="${(i-start+1)<10 }">
									<c:set var="date" value="${'0' += (i-start+1) }" />
								</c:if> <c:set var="day" value="${yearMonth }${date }" /> <c:set
									var="doneLoop" value="false" /> <c:forEach var="sche"
									items="${calendarList }">
									<c:choose>
										<c:when test="${sche.scheduleDate eq day }">
											<a
												href="${contextPath }/test/calendar.do?schedule=${sche.schedule }"
												id="scheduleOn">${i-start+1 }*</a>
										</c:when>
										<c:when test="${not doneLoop }">
											<c:set var="doneLoop" value="true" />
										</c:when>
										<c:otherwise>
											<a href="#">${i-start+1 }</a>
										</c:otherwise>
									</c:choose>
								</c:forEach></td>
						</c:if>
						<c:if test="${i%7 == 0 }">
				</tr>
				<tr>
					</c:if>
					<c:if test="${i < start }">
						<td></td>
					</c:if>
					</c:forEach>
				</tr>
				<tr>
					<td colspan="7"><c:set var="schedule" value="<%=schedule%>" />
						${schedule }<br> <c:forEach var="sche"
							items="${calendarList }">
							<c:if test="${schedule eq sche.schedule }">
					${sche.scheduleDetail }
				</c:if>
						</c:forEach></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>