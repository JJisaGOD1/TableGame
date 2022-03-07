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
<title>View Messages Page</title>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<table class="table">
				<thead class="table table-dark">
					<tr>
						<th>紀錄編號</th>
						<th>商品編號</th>
						<th>庫存</th>
						<th>變更日期</th>
						<th>變更事件</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="P" items="${listPI}">
						<tr>
							<th scope="row"><c:out value="${P.productinformationId}" />
							<td><c:out value="${P.productid_id}" />
							<td><c:out value="${P.stock}" />
							<td><c:out value="${P.changedate}" />
							<td><c:out value="${P.history}" />
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>