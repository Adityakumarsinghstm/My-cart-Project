<%@page import="com.learn.mycart.helper.FactoryProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index Page : My Cart</title>

<%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<h1>This is index page</h1>
	<h1>Creation session factory object</h1>


	<%
	out.println(FactoryProvider.getFactory());
	out.println(FactoryProvider.getFactory());
	out.println(FactoryProvider.getFactory());
	%>
</body>
</html>