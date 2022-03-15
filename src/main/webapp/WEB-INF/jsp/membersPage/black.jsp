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
<h1>您輸入密碼錯誤三次，已被加入黑名單。起洽線上客服</h1>
<a href="#" 
onclick="window.open('http://localhost:8080/homepage/accountProblem', 'accountService', config='height=800,width=800');">線上客服</a>

<script type="text/javascript">


</script>
</body>
</html>