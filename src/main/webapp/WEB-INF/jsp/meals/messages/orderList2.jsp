<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../../layout/dashboard.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

<script src="${contextRoot}/js/sweetalert2.all.min.js"></script>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#table_id_wrapper{
	background-color: white;
    padding: 1rem 2rem;
    border-radius: 1rem;
    box-shadow: rgb(0 0 0 / 24%) 0px 3px 8px;
}
</style>

</head>
<body style="background-color: #E3E6E6">

<div style="margin-left: 260px">

	<div style="width: 76vw; margin: 0 auto;">
		<br>
		<br>
		<!-- 		<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">點餐列表</h1> -->






		<div
			style="border-radius: 10px; background-color: white; overflow: hidden; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
			<table class="table" style="background-color: white;overflow: hidden;">
				<thead class="thead-dark">
					<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold; margin: 0.5rem 1.5rem">點餐列表</h1>
				</thead>
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
<!-- 							<a onclick="return confirm('確認刪除?')" -->
<%-- 								href="${contextRoot}/deleteOrder?orderId=${order.orderId}"><button --%>
<!-- 										type="button" class="btn btn-danger">刪除</button></a> -->
							<button type="button" class="btn btn-danger confirmedDelete" id="confirmedDelete" value="${order.orderId}">刪除</button>
							<a href="${contextRoot}/editOrder?orderId=${order.orderId}"><button
										type="button" class="btn btn-success">修改</button></a> <%-- 							<a href="${contextRoot}/checkOrderDetail?orderId=${order.orderId}"><button type="button" class="btn btn-success">查看明細</button></a> --%>

								<input type="button"
								class="edit btn btn-success checkOrderDetail" value="查看明細"
								data-toggle="modal" data-target="#checkOrderDetail">
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>




<!-- 		<script> 
			function del() {
				if (confirm("確實要刪除嗎？")) {
					alert("已經刪除！");
				} else {
					alert("已經取消了刪除操作");
				}

			}
		</script>-->

		<%-- 		<h3>共${page.size()}筆食物資料</h3> --%>
		<!-- 				size():Collection Object (ArrayList, Set, etc) — 取得集合物件相關大小 -->


		<!--新增按鈕 -->
		<%-- 			<a href="${contextRoot}/addFood"><input type="button" value="新增" class="myButton"></a>			 --%>
		<!-- ==========================================顯示頁數========================================== -->
		<br>
		<div class="row justify-content-center" align="center">
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
				<div class="modal-content" style="width: 50vw;">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel"
							style="font-weight: 600;">訂單明細</h3>
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
							<tbody class="checkOrderDetailTable" style="width: 50vw">

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
</div>






	<script>
$(".checkOrderDetail").click(function() {
	let id = $(this).parent().parent().find("p").html();
	console.log(id)
	$.ajax({
		url : "${contextRoot}/meals/checkOrderDetailAjax?mealListId=" + id,
		method : "get",
		success : function(data) {
			$(".checkOrderDetailTable").empty();
		console.log(data.mealList)		
			data.mealList.forEach(element => {
				let a = "";
				a+="<tr>";
				a+="<td>"+data.orderId+"</td>";
				a+="<td>"+element.foodList.foodName+"</td>";
				a+="<td>"+element.foodList.foodPrice+"</td>";
				a+="<td>"+element.foodList.foodType+"</td>";
				a+="<td><img src='${contextRoot}/uploaded/"+element.foodList.foodImage+"' style='width:5rem'></td>";
				a+="<td>"+element.quantity+"</td>";
				a+="<td>"+element.itemPrice+"</td>";
				a+="</tr>";
				$(".checkOrderDetailTable").append(a)
			});
		},
	})
})

// =============================刪除確認=============================

$(".confirmedDelete").click (function() {
		let id = $(this).parent().parent().find("p").html();
		console.log(id);
		Swal.fire({
			  title: '確認刪除?',
// 			  text: "You won't be able to revert this!",
			  icon: 'warning',
			  showCancelButton: true,
			  cancelButtonText:'否，取消刪除',
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '是，確認刪除'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
					  url: "${contextRoot}/deleteOrder?orderId=" + id,
					  method:'get',
					  success:function(){
						  setTimeout(function(){
							  window.location.reload()
						  }, 1000)
					  }
				  })
			    Swal.fire(
			      '刪除成功!',
// 			      'Your file has been deleted.',
// 			      'success'
			    )
			  }
			})
		})

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





</body>
</html>