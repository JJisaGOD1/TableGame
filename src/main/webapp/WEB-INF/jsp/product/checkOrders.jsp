<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/dashboard.jsp" />

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
			<table class="table">
				<thead class="table table-dark">
					<tr>
						<th>訂單編號</th>
						<th>顧客Id</th>
						<th>顧客名</th>
						<th>訂單總金額</th>
						<th>處理狀態</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="P" items="${P.content}">
						<tr>
							<th scope="row"><c:out value="${P.orderId}" />
							<td><c:out value="${P.member.id}" />
							<td><c:out value="${P.member.cusName}" />
							<td><c:out value="${P.totalprice}" />
							<td><c:out value="${P.processingstatus}" />
							<td><a
								href="${contextRoot}/products/checkPackage?id=${P.orderId}"><input
									type="button" value="確認訂單"></a> <a
								href="${contextRoot}/products/sendPackage?id=${P.orderId}"><input
									type="button" onclick="return confirm('請確認商品是否已送出?')"
									value="確認送貨"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script>
	
</script>
</html>