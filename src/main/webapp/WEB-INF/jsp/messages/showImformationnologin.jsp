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
			<form action="${contextRoot}/addToCart" method="get">
				<table class="table">
					<thead class="table table-dark">
						<tr>
							<th>編號</th>
							<th scope="row"><input name="id"
								value="<c:out value="${P.product_id}" />" readonly="readonly">
						</tr>
					</thead>
					<tbody>

						<tr>
							<th>名稱</th>
							<td><c:out value="${P.product_name}" />
						</tr>
						<tr>
							<th>價錢</th>
							<td><c:out value="${P.price}" />
						</tr>
						<tr>
							<th>類型</th>
							<td><c:out value="${P.gametype}" />
						</tr>
						<tr>
							<th>最小遊玩人數</th>
							<td><c:out value="${P.minplayer}" />
						</tr>
						<tr>
							<th>最大遊玩人數</th>
							<td><c:out value="${P.maxplayer}" />
						</tr>
						<tr>
							<th>最適年齡</th>
							<td><c:out value="${P.low_age}" />
						</tr>
						<tr>
							<th>圖片</th>
							<td><img src="<c:url value='/Photo/${P.photourl}'/>"
								style="height: 100px" name="${P.photourl}" id="${P.photourl}" />
						</tr>

						<tr>
							<th>介紹</th>
							<td><c:out value="${P.productintroduce}" />
						</tr>


					</tbody>
				</table>
			</form>
			<a href="${contextRoot}/viewProductsnologin"><input type="button"
				value="回商品總覽"></a>
		</div>
		<div class="row justify-content-center">
			<div class="col-9"></div>
		</div>
	</div>
</body>
</html>