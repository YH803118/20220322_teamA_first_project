<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page import="java.util.Calendar"%>

<%
Calendar cal = Calendar.getInstance();
Calendar selDay = Calendar.getInstance();
String strSelDay = "";

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdfYM = new SimpleDateFormat("yyyy-MM-");

String strYear = request.getParameter("year");
String strMonth = request.getParameter("month");
String strDate = request.getParameter("date");

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH);
int date = cal.get(Calendar.DATE);

if (strYear != null && strDate == null) {
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
} else if(strDate != null){
	year = Integer.parseInt(strYear);
	month = Integer.parseInt(strMonth);
	date = Integer.parseInt(strDate);
	
	selDay.set(year,month,date);
	strSelDay = sdf.format(selDay.getTime());
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

String stringToday = sdf.format(todayCal.getTime());

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
#notice {
	top: 600px;
	background-color: lightgreen;
	margin: 30px;
	width: 740px;
	height: 120px;
	left: 0;
}

#community {
	background-color: green;
	width: 740px;
	height: 120px;
	margin: 30px;
	left: 0;
}

.loginInput {
	width: 50%;
}

#loginForm {
	width: 100%;
	text-align: center;
	float: left;
}

#calendarFrm table {
	margin: 30px;
	top: 160px;
	width: 740px;
	height: 500px;
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
<form action="/pro_A/test/addSchedule.do" method="post">
	<c:set var="yearMonth" value="<%=yearMonth%>" />
	<div id="calendarFrm">
		<table>
			<tr>
				<td colspan="7"><input type="button" value="저번 달"
					onclick="location.href='${contextPath }/test/managerForm.do?year=<%=year%>&month=<%=month-1%>'">
					<%=year%>년 <%=month + 1%>월 <input type="button" value="다음 달"
					onclick="location.href='${contextPath }/test/managerForm.do?year=<%=year%>&month=<%=month+1%>'">
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
						<td><c:set var="date" value="${i-start+1 }" /> 
						<c:if test="${(i-start+1)<10 }">
							<c:set var="date" value="${'0' += (i-start+1) }" />
						</c:if> 
							<c:set var="day" value="${yearMonth }${date }" /> 
							<c:set var="doneLoop" value="true" />
							<c:set var="noSchedule" value="true" />
							
							<c:forEach var="sche" items="${calendarList }">
								<c:if test="${doneLoop}">
									<c:if test="${sche.scheduleDate eq day }">
										<a	href="${contextPath }/test/managerForm.do?schedule=${sche.schedule }"
											id="scheduleOn">${i-start+1 }*</a>
											<c:set var="noSchedule" value="false"/>
											<c:set var="doneLoop" value="false" />
									</c:if>
								</c:if>
							</c:forEach>
								<c:if test="${noSchedule eq true }">
									<a href="${contextPath }/test/managerForm.do?year=<%=year%>&month=<%=month%>&date=${i-start+1}">
									${i-start+1 }</a>
								</c:if>
							</td>
					</c:if>
					<c:if test="${i%7 == 0 }">	
						</tr><tr>
					</c:if>
					<c:if test="${i < start }">
						<td></td>
					</c:if>
				</c:forEach>
			</tr>
			<c:set var="schedule" value="<%=schedule%>" />
			<c:choose>
			<c:when test="${schedule eq null }">
			<tr>
				<td colspan="7">
				<%=strSelDay %>&nbsp;
				<input type="text" name="schedule">
				<input type="hidden" name="scheduleDate" value="<%=strSelDay %>">
				<input type="submit" value="추가">
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			<tr>
				<td colspan="7">
					${schedule }<br> 
					<c:forEach var="sche" items="${calendarList }">
						<c:if test="${schedule eq sche.schedule }">
							${sche.scheduleDetail }
						</c:if>
					</c:forEach></td>
			</tr>
			</c:otherwise>
			</c:choose>
		</table>
	</div>

	<div id="notice">
	<table>
		<tr>
			<td colspan="2">공지사항</td>
			<td><a href="${contextPath }/board/noticeList.do">전체보기</a></td>
		</tr>
		<c:forEach var="notice" items="${noticeList }">
		<tr>
			<td>${notice.noticeTitle }	</td>
			<td>${fn:split(notice.noticeRegDate, ' ')[0] } </td>	
			<td><a href="${contextPath }/test/delNotice?noticeNo=${notice.noticeNo }">삭제</a></td>	
		</tr>
		</c:forEach>
	</table>
	</div>
	<div id="community"></div>
</form>
</body>
</html>