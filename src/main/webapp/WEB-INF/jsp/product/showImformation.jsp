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
<style type="text/css">
th {
	width: 50px
}
</style>
<link href="${contextRoot}/css/forProductPage.css" rel="stylesheet">
<meta charset="UTF-8">
<title>View Messages Page</title>
</head>
<body>
	<div class="container">
		<p />
		<div
			style="display: inline-block; position: fixed; left: 10vw; top: 10vw;">
			<img src="<c:url value='/Photo/${P.photourl}'/>"
				style="max-width: 20vw;" name="${P.photourl}" id="${P.photourl}"
				onerror="this.src='${contextRoot}/Photo/nophoto.jpg'" />
		</div>
		<div
			style="position: fixed; left: 40vw; width: auto; top: 10vw; display: inline-block; right: 5vw; max-height: 50vw">

			<form action="${contextRoot}/products/addToProductCart" method="get">
				<table class="table" style="background-color: white;width: 50vw;font-size: medium;">
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
							<th>介紹</th>
							<td><c:out value="${P.productintroduce}" />
						</tr>

						<th>欲購買數量</th>
						<td><select name="quantity">
								<option value="1">1
								<option value="2">2
								<option value="3">3
								<option value="4">4
								<option value="5">5
								<option value="6">6
								<option value="7">7
								<option value="8">8
								<option value="9">9
								<option value="10">10
						</select>
						</tr>
						<tr>
							<th>操作</th>
							<td><input type="submit" class="btn btn-primary" value="加入購物車"></td>
						</tr>
					</tbody>
				</table>
			</form>
			<a href="${contextRoot}/products/list"><input type="button" class="btn btn-primary"
				value="回購物列表"></a>
		</div>
		<div class="row justify-content-center">
			<div class="col-9"></div>
		</div>
	</div>
</body>
</html>