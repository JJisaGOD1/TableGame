<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="membersPage/layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form-2">
				<h3>重設密碼</h3>
				<%-- 			<form:form action="pwdSubmit" method="post" --%>
				<%-- 					class="login100-form validate-form" modelAttribute="pwdForm" />  --%>
				<form action="${contextRoot}/pwdSubmit" id="pwdSubmit" method="Post"
					modelAttribute="pwdForm">
					<div id="errorMessge" class="alert alert-danger hidden"></div>
					<div class="form-group">
						<input type="text" name="email" class="form-control"
							placeholder="Email" required />
					</div>
  					 <div class="form-group"> 
						<input type="password" name="pwd" class="form-control"
							placeholder="新密碼" required /> 
					</div>
<%-- 					<div class="form-group"> -->
<!-- 						<input type="password" name="pwd" class="form-control" -->
<!-- 							placeholder="確認新密碼" required />  -->
<!-- 					</div>  --%>
					<div class="form-group">

						<button class="login100-form-btn">送出</button>
					</div>

				</form>
			</div>
		</div>
	</div>
</html>