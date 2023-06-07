<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Home</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/ajax.js"></script>
	<script type="text/javascript">
		let str = "The time on the server is ";
		$(function () {
			activeTime = setInterval(function () {
				getCartList();
			},1000);
		});
		function getCartList() {
			ajax_UrlPlusParam(
					'${pageContext.request.contextPath}/getTime',
					function (data) {
						$('P#p_time').text(str + data);
					},
					'GET'
			);
		}
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>
<P id="p_time"></P>
<h1><a href="${pageContext.request.contextPath}/page/login">go Login</a></h1>
<h1><a href="${pageContext.request.contextPath}/page/list">go List</a></h1>
<h1><a href="${pageContext.request.contextPath}/page/ajax-test">go Test</a></h1>
</body>
</html>
