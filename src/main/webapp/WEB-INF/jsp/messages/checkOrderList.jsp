<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<table class="table">
				<thead class="table table-dark">
					<tr>
						<th>編號</th>
						<th>名稱</th>
						<th>價錢</th>
						<th>類型</th>
						<th>最小遊玩人數</th>
						<th>最大遊玩人數</th>
						<th>最適年齡</th>
						<th>圖片</th>
						<th>購買數</th>
						<th>價錢</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="C" items="${orders.orderList}">
						<tr>
							<th scope="row"><c:out value="${C.product.product_id}" />
							<td><c:out value="${C.product.product_name}" />
							<td><c:out value="${C.product.price}" />
							<td><c:out value="${C.product.gametype}" />
							<td><c:out value="${C.product.minplayer}" />
							<td><c:out value="${C.product.maxplayer}" />
							<td><c:out value="${C.product.low_age}" />
							<td><img src="<c:url value='/Photo/${C.product.photourl}'/>"
								style="height: 100px" name="${C.product.photourl}"
								id="${C.product.photourl}" />
							<td><c:out value="${C.quantity}" />
							<td><c:out value="${C.price}" />
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<h3>總計${orders.totalprice}元</h3>
		</div>
	</div>
</body>
</html>