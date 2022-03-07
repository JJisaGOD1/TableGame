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
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h1>訂位成功</h1>
<table>
<tr><td>人數：${booking.several}</tr>
<tr><td>訂位日期：<fmt:formatDate pattern="yyyy/MM/dd EEEE" value="${booking.reservation_date}"/></td></tr>
<tr><td>時間：${booking.period}</td></tr>
<tr><td>桌號：${booking.number}</td></tr>
<tr><td>備註：${booking.remark}</td></tr>

</table>
</div>
</body>
</html>