<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
#login {
	position: relative;
	top: 0;
	float: right;
	margin: 0 30px;
	padding: 30px 0;
	width: 260px;
	height: 200px;
	background-color: #aaaaaa;
	line-height: 200%;
}

#notice {
	top: 500px;
	background-color: lightgreen;
	margin: 30px;
	width: 450px;
	height: 120px;
	left: 0;
}

#community {
	background-color: green;
	width: 450px;
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
<div id="login">
		<form action="/pro_A/test/login.do" id="loginForm">
			<c:choose>
				<c:when test="${isLogon=='true' }">
				${dto.id }님 환영합니다.<br>
					<c:choose>
						<c:when test="${dto.memberType==1 }">
							<a href="/pro_A/test/openForm.do?name=${dto.name }"><input
								type="button" value="강좌개설"></a>
						</c:when>
					</c:choose>
				</c:when>
				<c:otherwise>
	&nbsp;아이디 &nbsp;&nbsp;: <input type="text" name="id" class="loginInput">
					<br>
	비밀번호 : <input type="password" name="pwd" class="loginInput">
					<br>
					<input type="submit" value="로그인">
					<a href="/pro_A/test/memberForm.do"><input type="button"
						value="회원가입"></a>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	<c:set var="yearMonth" value="<%=yearMonth%>" />
	<div id="calendarFrm">
		<table>
			<tr>
				<td colspan="7"><input type="button" value="저번 달"
					onclick="location.href='${contextPath }/test/loginForm.do?year=<%=year%>&month=<%=month-1%>'">
					<%=year%>년 <%=month + 1%>월 <input type="button" value="다음 달"
					onclick="location.href='${contextPath }/test/loginForm.do?year=<%=year%>&month=<%=month+1%>'">
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
							</c:if> <c:set var="day" value="${yearMonth }${date }" />
							<c:set var="doneLoop" value="true" />
							<c:set var="noSchedule" value="true" />
							
							<c:forEach var="sche" items="${calendarList }">
								<c:if test="${doneLoop}">
									<c:if test="${sche.scheduleDate eq day }">
										<a	href="${contextPath }/test/loginForm.do?schedule=${sche.schedule }"
											id="scheduleOn">${i-start+1 }*</a>
											<c:set var="noSchedule" value="false"/>
											<c:set var="doneLoop" value="false" />
									</c:if>
								</c:if>
							</c:forEach>
								<c:if test="${noSchedule eq true }">
									<a href="#">	${i-start+1 }</a>
								</c:if></td>
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
	
	<div id="notice">
	<table>
		<tr>
			<td>공지사항</td>
			<td><a href="${contextPath }/board/noticeList.do">전체보기</a></td>
		</tr>
		<c:forEach var="notice" items="${noticeList }">
		<tr>
			<td>${notice.noticeTitle }	</td>
			<td>${fn:split(notice.noticeRegDate, ' ')[0] } </td>		
		</tr>
		</c:forEach>
	</table>
	</div>
	<div id="community"></div>
</body>
</html>