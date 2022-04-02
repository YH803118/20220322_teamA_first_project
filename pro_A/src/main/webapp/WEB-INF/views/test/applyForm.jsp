<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
     <%
     request.setCharacterEncoding("utf-8");
     %>
     <%String id = request.getParameter("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
window.onload=function(){
	let chkli='';

}
function put(event){
	let taget =event.target;
	if(taget.checked)
		{
		chkli=event.target.value;
		}
	else{
		chkli='';
	}
}
function add(){
	let lst=document.getElementById('lst');
	let li =document.createElement('tr');
	let input1=document.createElement('input');
	let form1=document.getElementById('applist');
	input1.setAttribute("type","hidden");
	input1.setAttribute("name","lect");
	input1.setAttribute("value",chkli);
	li.innerText=chkli;
	lst.appendChild(li);
	form1.appendChild(input1);
}
</script>
</head>
<body>
<table border="1"  align="center"  width="80%">
<tr>
<td>강의명</td>
<td>교수명</td>
<td>수업일</td>
</tr>
 <c:forEach var="lect" items="${lectList}" >     
   <tr align="center">
      <td><input type="radio" value="${lect.lectName } ${lect.name } ${lect.lectDay} ${lect.begin }~${lect.end}"
       onclick="put(event)" name="sel">${lect.lectName}</td>
      <td>${lect.name}</td>
      <td>${lect.lectDay} ${lect.begin }~${lect.end }</td>
    </tr>
  </c:forEach>
</table>
<br>

<input type="button" value="추가" onclick="add()">
 <br>
  <br>
  <br>
  <br>
  <form action="/pro_A/test/apply.do" id="applist">
  <table id="lst" border="1"  align="center">
  
  </table>
  <input type="submit" value="신청">
  <input type="hidden" name="id" value="<%=id %>">
</form>
</body>
</html>