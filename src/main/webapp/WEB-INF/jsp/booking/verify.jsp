<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />  
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>訂位系統</title>
</head>
<body>
<tr><td>確認手機號碼<input type="text"  name="name"><a href="addNew"><input type="button" name="booking" value="訂位" ></a>
<tr><td>簡訊驗證碼<input type="text"  name="sms"><a href="addNew"><input type="button" name="booking" value="訂位" ></a>

<input type="submit" name="submit1" value="確定送出">

</body>
</html>