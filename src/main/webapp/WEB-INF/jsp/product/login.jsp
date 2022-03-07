<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">

			<form:form class="form" action="${contextRoot}/login"
				modelAttribute="Member" method="post">
				<table class="table">
					<thead class="table table-light	">
						<tr>
							<th>名稱</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><form:input path="customerName" /></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" name="submit" />
			</form:form>
		</div>
	</div>
</body>
</html>