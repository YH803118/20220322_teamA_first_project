<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<style>
 	* {
 		box-sizing: border-box;
 		margin:0px auto;
 	}
 	
	#container{
		width: 800px;
		margin: 0px auto;
		text-align: center;
		background-color: #EEEEEE;
	}

	#header {
		height: 160px;
		background-color: lightgreen;
	}	
	#content{
		min-height : 700px;
	}
	#footer {
		clear:both;
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