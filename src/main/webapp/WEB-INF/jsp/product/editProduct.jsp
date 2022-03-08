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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<h3>請修改資料</h3>

			<form:form class="form" action="${contextRoot}/products/editProduct"
				modelAttribute="P" method="post">
				<table class="table">
					<thead class="table table-light	">
						<tr>
							<th>編號</th>
							<td><form:input path="product_id" readonly="true" /></td>

						</tr>
					</thead>
					<tbody>

						<tr>
							<th>名稱</th>
							<td><form:input path="product_name" /></td>
						</tr>
						<tr>
							<th>價錢</th>
							<td><form:input path="price" /></td>
						</tr>
						<tr>
							<th>類型</th>
							<td><form:input path="gametype" /></td>
						</tr>
						<tr>
							<th>最小遊玩人數</th>
							<td><form:input path="minplayer" /></td>
						</tr>
						<tr>
							<th>最大遊玩人數</th>
							<td><form:input path="maxplayer" /></td>
						</tr>
						<tr>
							<th>最適年齡</th>
							<td><form:input path="low_age" /></td>
						</tr>
						<tr>
							<th>庫存</th>
							<td><form:input path="stock" /></td>
						</tr>
						<tr>
							<th>上下架</th>
							<td><form:select path="sellstatus">狀態
							<form:option value="上架中">上架中</form:option>
									<form:option value="下架中">下架中</form:option>
								</form:select></td>
							<form:input path="photourl" type="hidden" />
						</tr>
						<tr>
							<th>介紹文</th>
							<td><form:textarea path="productintroduce"
									style="width: 300px;height: 200px;" />
						</tr>
					</tbody>
				</table>
				<input class="btn btn-secondary btn-lg btn-block" type="submit"
					name="submit" id="submitBtn" />
				<form:errors path="price" />
				<br>
				<form:errors path="maxplayer" />
				<br>
				<form:errors path="minplayer" />
				<br>
				<form:errors path="low_age" />
				<br>
				<form:errors path="stock" />
				<br>
				<h6>${a}</h6>
			</form:form>
		</div>
	</div>
</body>
</html>