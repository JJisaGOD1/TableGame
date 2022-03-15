<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/dashboard.jsp" />
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">

			<form:form class="form" action="${contextRoot}/products/addProduct"
				modelAttribute="P" method="post">
				<table class="table">
					<thead class="table table-light	">
						<tr>
							<th>編號</th>
							<td><form:input path="product_id" disabled="true" />自動填寫</td>

						</tr>
					</thead>
					<tbody>

						<tr>
							<th>名稱</th>
							<td><form:input path="product_name" /></td>
						</tr>
						<tr>
							<th>價錢</th>
							<td><form:input path="price"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>類型</th>
							<td><form:input path="gametype" /></td>
						</tr>
						<tr>
							<th>最小遊玩人數</th>
							<td><form:input path="minplayer"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>最大遊玩人數</th>
							<td><form:input path="maxplayer"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>最適年齡</th>
							<td><form:input path="low_age"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>庫存</th>
							<td><form:input path="stock"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
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
				<input type="submit" name="submit" />
			</form:form>
		</div>
	</div>
</body>
<script>
	$("form").submit(function() {
		let maxplayer = $(this).parent().find('#maxplayer').val();
		let minplayer = $(this).parent().find('#minplayer').val();
		if (minplayer >= maxplayer) {
			window.alert('最大人數須大於最小人數');
			return false;
		}
		return true;
	});
</script>
</html>