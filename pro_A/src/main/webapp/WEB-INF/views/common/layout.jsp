<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<style>
	#container{
		width: 100%;
		height: 1100px;
		margin: 50px auto;
		text-align: center;
		background-color: #EEEEEE;
	}	
	#header {
		width: 100%;
		height: 160px;
		background-color: lightgreen;
	}	
	#content{
		padding-bottom: 150px;
	}
	#footer {
		position:absolute;
		top: 1000px;
		width: 800px;
		height: 150px;
		background-color: #bcbcbc
	}
</style>
</head>
<body>
<div id="container">
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div id="content">
		<tiles:insertAttribute name="body" />
	</div>
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>