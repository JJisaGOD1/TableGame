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


<link href="${contextRoot}/css/menu.css" rel="stylesheet" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/forProductPage.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<aside style="position: fixed; right: 30px; top: 120px">
		<table class="table" style="width: 200px; background-color: white;">
			<thead class="table table-dark" style="width: 100px">
				<tr>
					<th>商品名稱</th>
					<th>購買量</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cart.productMap}" var='C'>
					<tr>
						<td style="width: 100px"><c:out
								value="${C.value.product.product_name}" /></td>
						<td style="width: 100px"><c:out value="${C.value.quantity}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</aside>
	<div class="wrap" style="width: 1200px;">
		<div class="content" style="width: 1200px; padding: 5%">
			<c:forEach items="${P.content}" var="P">
				<c:choose>
					<c:when test="${P.sellstatus=='上架中'&&P.stock>10}">
						<div class="card" style="width: 350px; padding: auto">
							<div
								style="max-width: 350px; height: 350px; display: flex; justify-content: center;">
								<a href="${contextRoot}/showImformation?id=${P.product_id}">
									<img src="<c:url value='/Photo/${P.photourl}' />"
									style="width: 250px" alt="picture of food" class="card-img-top"
									onerror="this.src='${contextRoot}/Photo/nophoto.jpg'" />
								</a>
							</div>
							<div class="card-body">
								<h5 class="card-title">
									<c:out value="${P.product_name}" />
								</h5>
								<p class="card-text">
									NT$
									<c:out value="${P.price}" />
								</p>
								<a href="${contextRoot}/addToCart?id=${P.product_id}&quantity=1"
									class="btn btn-primary" onclick="return confirm('是否加入購物車?')">加入一個到購物車</a>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>


	</div>
	<div>


		<div style="display: flex; justify-content: center;">
			<c:forEach var="pageNumber" begin="1" end="${P.totalPages}">

				<c:choose>
					<c:when test="${pageNumber-1==P.number}">
						<!--page.number:取的當前頁面的頁碼-->
						<c:out value="${pageNumber}" />
					</c:when>
					<c:otherwise>
						<a href="${contextRoot}/list?p=${pageNumber}"><c:out
								value="${pageNumber}" /> </a>
					</c:otherwise>
				</c:choose>


				<c:if test="${pageNumber != P.totalPages}">
					<!--顯示|的條件:如果是最後一頁，後面就不顯示-->
						|
					</c:if>
			</c:forEach>
		</div>


	</div>
	<div style="display: flex; justify-content: center;">
		<a href="${contextRoot}/goToCart"><input type="button"
			value="查看購物車"></a>
	</div>
</body>
<script>
	
</script>
</html>