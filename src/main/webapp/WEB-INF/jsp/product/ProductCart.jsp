<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp" />
<jsp:include page="layout/NewFile.jsp" />

<!DOCTYPE html>
<html>
<head>


<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p />
		<div style="margin: 0 auto; text-align: center">
			<h3>總計${C.price}元</h3>
		</div>
		<div class="row justify-content-center" style="margin-top: 5rem">
			<table class="table" style="background-color: white">
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
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="C" items="${C.productMap}">
						<tr>
							<th scope="row"><c:out value="${C.value.product.product_id}" />
							<td><c:out value="${C.value.product.product_name}" />
							<td><c:out value="${C.value.product.price}" />
							<td><c:out value="${C.value.product.gametype}" />
							<td><c:out value="${C.value.product.minplayer}" />
							<td><c:out value="${C.value.product.maxplayer}" />
							<td><c:out value="${C.value.product.low_age}" />
							<td><img
								src="<c:url value='/Photo/${C.value.product.photourl}'/>"
								style="height: 100px" name="${C.value.product.photourl}"
								id="${C.value.product.photourl}"
								onerror="this.src='${contextRoot}/Photo/nophoto.jpg'" />
							<td><c:out value="${C.value.quantity}" />
							<td><c:out value="${C.value.price}" />
							<td><a
								href="${contextRoot}/products/deleteCartItem?id=${C.value.product.product_id}"><input
									type="button" class="btn btn-primary"
									style="font-size: 1.5rem; margin: 0"
									onclick="return confirm('確認刪除商品?')" value="刪除"></a> <a
								href="${contextRoot}/products/deleteOneCartItem?id=${C.value.product.product_id}"><input
									type="button" class="btn btn-primary"
									style="font-size: 1.5rem; margin: 0"
									onclick="return confirm('確認刪除商品?')" value="整個刪除"></a>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<p></p>
			<a href="${contextRoot}/products/Pay"><input type="button"
				class="btn btn-primary" style="font-size: 1.5rem; margin: 0"
				onclick="return confirm('即將進入結帳畫面')" value="結帳"></a>


		</div>
	</div>
</body>
</html>