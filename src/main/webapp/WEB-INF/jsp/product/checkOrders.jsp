
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
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<table id="table_id" class="display" style="width: 50vw;font-size:medium;">
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
				<tbody class="tttbody">
					<c:forEach var="P" items="${P.content}">
						<tr>
							<th scope="row"><c:out value="${P.orderId}" />
							<td><c:out value="${P.member.id}" />
							<td><c:out value="${P.member.cusName}" />
							<td><c:out value="${P.totalprice}" />
							<td ><c:out value="${P.processingstatus}" />
							<td>
							<c:if test="${P.processingstatus.equals('未處理')}">
									<a href="${contextRoot}/products/checkPackage?id=${P.orderId}"><input
										type="button" value="確認訂單"></a>
									<a href="${contextRoot}/products/sendPackage?id=${P.orderId}"><input
										type="button"  disabled="disabled" onclick="return confirm('請確認商品是否已送出?')"
										value="確認送貨"></a>
									<a href="${contextRoot}/products/cancelPackage?id=${P.orderId}"><input
										type="button" onclick="return confirm('請確認此單作廢?')"
										value="訂單作廢"></a>
							</c:if>
							<c:if test="${P.processingstatus.equals('處理中')}">
									<a href="${contextRoot}/products/checkPackage?id=${P.orderId}"><input
										type="button"  disabled="disabled" value="確認訂單"></a>
									<a href="${contextRoot}/products/sendPackage?id=${P.orderId}"><input
										type="button" onclick="return confirm('請確認商品是否已送出?')"
										value="確認送貨"></a>
									<a href="${contextRoot}/products/cancelPackage?id=${P.orderId}"><input
										type="button" onclick="return confirm('請確認此單作廢?')"
										value="訂單作廢"></a>
							</c:if>
							<c:if test="${P.processingstatus.equals('已送貨')}">
									<a href="${contextRoot}/products/checkPackage?id=${P.orderId}"><input
										type="button" disabled="disabled" value="確認訂單"></a>
									<a href="${contextRoot}/products/sendPackage?id=${P.orderId}"><input
										type="button" disabled="disabled" onclick="return confirm('請確認商品是否已送出?')"
										value="確認送貨"></a>
									<a href="${contextRoot}/products/cancelPackage?id=${P.orderId}"><input
										type="button" disabled="disabled" onclick="return confirm('請確認此單作廢?')"
										value="訂單作廢"></a>
							</c:if>
							<c:if test="${P.processingstatus.equals('作廢')}">
									<a href="${contextRoot}/products/checkPackage?id=${P.orderId}"><input
										type="button" disabled="disabled" value="確認訂單"></a>
									<a href="${contextRoot}/products/sendPackage?id=${P.orderId}"><input
										type="button" disabled="disabled" onclick="return confirm('請確認商品是否已送出?')"
										value="確認送貨"></a>
									<a href="${contextRoot}/products/cancelPackage?id=${P.orderId}"><input
										type="button" disabled="disabled" onclick="return confirm('請確認此單作廢?')"
										value="訂單作廢"></a>
							</c:if>
							
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('#table_id').DataTable({
			"lengthMenu" : [ [ 5, 10, 25, 50, -1 ], [ 5, 10, 25, 50, "All" ] ],
			"language" : {
				"processing" : "處理中...",
				"loadingRecords" : "載入中...",
				"lengthMenu" : "顯示 _MENU_ 項結果",
				"zeroRecords" : "沒有符合的結果",
				"info" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
				"infoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
				"infoFiltered" : "(從 _MAX_ 項結果中過濾)",
				"infoPostFix" : "",
				"search" : "搜尋:",
				"paginate" : {
					"first" : "第一頁",
					"previous" : "上一頁",
					"next" : "下一頁",
					"last" : "最後一頁"
				},
				"aria" : {
					"sortAscending" : ": 升冪排列",
					"sortDescending" : ": 降冪排列"
				}
			}
		});
	});
</script>
</html>