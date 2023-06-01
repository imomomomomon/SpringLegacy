<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<P>  The time on the server is ${serverTime}. </P>
<h1><a href="${pageContext.request.contextPath}/page/login">go Login</a></h1>
<h1><a href="${pageContext.request.contextPath}/page/list">go List</a></h1>
<h1><a href="${pageContext.request.contextPath}/page/ajax-test">go Test</a></h1>
</body>
</html>
