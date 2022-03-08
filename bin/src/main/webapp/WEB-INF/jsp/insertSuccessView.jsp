<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="membersPage/layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertCustomerSuccessView</title>
</head>
<body>
<h1>InsertCustomerSuccessView</h1>
<h2>歡迎加入會員,${customer.cusName }</h2>
<a href="${contextRoot}/"><button  type="button" class="btn btn-primary">回首頁</button></a>
</body>
</html>