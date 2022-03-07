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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2>不好意思，目前以下商品庫存不足，請另行選購或是減少購買數量後再試試</h2>
		<div class="row justify-content-center">
			<table class="table">
				<thead class="table table-dark">
					<tr>
						<th>編號</th>
						<th>名稱</th>
						<th>價錢</th>
						<th>類型</th>
						<th>圖片</th>
						<th>目前庫存</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="P" items="${P}">

						<tr>
							<th scope="row"><c:out value="${P.value.product_id}" />
							<td><c:out value="${P.value.product_name}" />
							<td><c:out value="${P.value.price}" />
							<td><c:out value="${P.value.gametype}" />
							<td><img src="<c:url value='/Photo/${P.value.photourl}'/>"
								style="height: 100px" name="${P.value.photourl}"
								id="${P.value.photourl}" />
							<td><c:out value="${P.value.stock}" />
						</tr>

					</c:forEach>
				</tbody>
			</table>
			<a href="${contextRoot}/goToCart"><input type="button"
				value="回到購物車"></a>
		</div>
	</div>
</body>
</html>