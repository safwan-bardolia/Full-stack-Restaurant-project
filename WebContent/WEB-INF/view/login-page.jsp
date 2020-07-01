<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/validateLogin" method="Post"> 
		User:<input type="text" name="username" />
		pass:<input type="password" name="password"/> 
	</form:form>
</body>
</html>