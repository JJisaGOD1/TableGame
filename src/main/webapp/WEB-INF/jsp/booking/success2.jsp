<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>成功</title>
<style>
body{
background-image:url(BookingPhoto/body.jpg);
background-repeat: no-repeat;
background-size: 100%;
}
</style>
</head>
<body>
<div align="center">
<h1>${booking.user.cusName} ~訂位成功</h1>
<h3>訂位資訊已寄送至您的電子信箱</h3>




</div>
</body>
</html>