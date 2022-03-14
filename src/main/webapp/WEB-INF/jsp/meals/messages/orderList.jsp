<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/dashboard.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #E3E6E6">

<div class="container" align="center">
<br><br>
<!-- 		<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">點餐列表</h1> -->
		
		
		
		
		
		
		<div style="border-radius: 10px;background-color: white; overflow:hidden; width: 70vw; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
		<table class="table" style="background-color: white;">
		<thead class="thead-dark"><h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">點餐列表</h1></thead>
		<thead class="thead-dark" style="height: 2rem">
			<tr>
				<th scope="col">點餐編號</th>
				<th scope="col">桌號</th>
				<th scope="col">人數</th>
				<th scope="col">日期</th>
				<th scope="col">總計</th>
				<th scope="col">訂單狀態</th>
				<th scope="col">付款狀態</th>
				<th scope="col"></th>
			</tr>
		</thead>
<!-- 		<tbody id="tablebody"> -->
				<tbody>
					 <c:forEach items="${orderPage.content}" var="order">
						<tr scope="row">
<%-- 							<td><c:out value="${order.orderId}" /></td> --%>
							<th scope="row"><p>${order.orderId}</p></th>
							<td><c:out value="${order.tableNum}" /></td>
							<td><c:out value="${order.peopleNum}" /></td>
							<td><c:out value="${order.orderDate}" /></td>
							<td><c:out value="${order.totalprice}" /></td>
							<td><c:out value="${order.processState}" /></td>
							<td><c:out value="${order.paymentState}" /></td>
							<td>
							<a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteOrder?orderId=${order.orderId}"><button type="button" class="btn btn-danger">刪除</button></a>

							<a href="${contextRoot}/editOrder?orderId=${order.orderId}"><button type="button" class="btn btn-success">修改</button></a>
							
<%-- 							<a href="${contextRoot}/checkOrderDetail?orderId=${order.orderId}"><button type="button" class="btn btn-success">查看明細</button></a> --%>
							
							<input type="button" class="edit btn btn-success" value="查看明細" data-toggle="modal" data-target="#checkOrderDetail">
						</tr>
					</c:forEach>
				</tbody>
		</table>
</div>
		
		
		

		<script>
			function del() {
				if (confirm("確實要刪除嗎？")) {
					alert("已經刪除！");
				} else {
					alert("已經取消了刪除操作");
				}

			}
		</script>

<%-- 		<h3>共${page.size()}筆食物資料</h3> --%>
<!-- 				size():Collection Object (ArrayList, Set, etc) — 取得集合物件相關大小 -->


			<!--新增按鈕 -->
			<a href="${contextRoot}/addFood"><input type="button" value="新增" class="myButton"></a>			
<!-- ==========================================顯示頁數========================================== -->
			<div class="row justify-content-center">
			<div class="col-9">
			
				<c:forEach var="pageNumber" begin="1" end="${orderPage.totalPages}">

					<c:choose>
						<c:when test="${orderPage.number != pageNumber -1}">

							
							<a href="${contextRoot}/orderList?p=${pageNumber}"><c:out
									value="${pageNumber}" /> </a>
						</c:when>

						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>

					<c:if test="${pageNumber != orderPage.totalPages}">
			|
			</c:if>

				</c:forEach>
			</div>
		</div>
		

		
<nav aria-label="Page navigation" class="text-center">

    <ul class="pagination" id="page">

    </ul>

</nav>

<!-- ==========================================顯示頁數(以上)========================================== -->
		


<div class="modal fade" id="checkOrderDetail" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel"
							style="font-weight: 600;">歷史紀錄</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!--彈窗內部-->


						<table class="table">
							<thead class="table table-dark">
								<tr>
									<th>訂單編號</th>
									<th>餐點</th>
									<th>價格</th>
									<th>分類</th>
									<th>圖片</th>
									<th>數量</th>
									<th>小計</th>

								</tr>
							</thead>
							<tbody class="checkOrderDetailTable">

							</tbody>
						</table>
						<p></p>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">關閉</button>

						</div>
					</div>
				</div>
			</div>


		</div>




</div>

<script>
$(".checkOrderDetail").click(function() {
	let id = $(this).parent().parent().parent().find("p").html();
	$.ajax({
		url : "${contextRoot}/meals/checkOrderDetailAjax?id=" + id,
		method : "get",
		success : function(data) {
			$(".checkOrderDetailTable").empty();
		console.log(data)
			data.forEach(element => {
				let a = "";
				a+="<tr>";
				a+="<td>"+element.mealListId+"</td>";
				a+="<td>"+element.foodList.foodName+"</td>";
				a+="<td>"+element.foodList.foodPrice+"</td>";
				a+="<td>"+element.foodList.foodType+"</td>";
				a+="<td>"+element.foodList.foodImage+"</td>";
				a+="<td>"+element.quantity+"</td>";
				a+="<td>"+element.itemPrice+"</td>";
				a+="</tr>";
				$(".checkOrderDetailTable").append(a)
			});
		},
	})
})
</script>

</body>
</html>