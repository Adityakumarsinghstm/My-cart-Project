<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "you are not logged in!!");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equals("admin")) {
		session.setAttribute("message", "you are admin!! you can't access this page!!");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>normal user pannel: mycart</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

</body>
</html>