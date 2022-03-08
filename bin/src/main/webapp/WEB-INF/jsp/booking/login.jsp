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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>會員登入</h2>
 <form method="post" action="${contextRoot}/login">
<table>
<tr><td>帳號<input type="text"  name="username"><br>
<tr><td>密碼<input type="password"  name="password"><br>

<input type="submit" name="submit1" value="確定送出">
</table>
</form>
</div>
</body>
</html>