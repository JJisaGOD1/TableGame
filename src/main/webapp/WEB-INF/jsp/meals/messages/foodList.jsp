<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%-- <jsp:include page="layout/navbar.jsp"></jsp:include> --%>
<jsp:include page="../../layout/dashboard.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>

<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="${contextRoot}/js/sweetalert2.all.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-color: #E3E6E6">

	<a href="${contextRoot}/addFood"><img alt=""
		src="${contextRoot}/uploaded/pngwing.com.png"
		style="width: 4vw; position: fixed; right: 60px; bottom: 40px"></a>

	<div class="container" style="margin-left: auto;margin-right: auto;">
		<!-- 		<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">餐點清單</h1> -->
		<br>
		<br>

		<div
			style="border-radius: 10px; background-color: white; overflow: hidden; width: 70vw; box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;">
			<table class="table" style="background-color: white;">
				<thead class="thead-dark">
					<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">餐點清單</h1>
				</thead>
				<thead class="thead-dark" style="height: 2rem">
					<tr>
						<th scope="col">圖片</th>
						<th scope="col">食物編號</th>
						<th scope="col">食物名稱</th>
						<th scope="col">價格</th>
						<th scope="col">分類</th>
						<th scope="col">狀態</th>
						<th scope="col"></th>
					</tr>
				</thead>
<!-- 				<tbody id="tablebody"> -->
									<tbody>
										 <c:forEach items="${page.content}" var="food">
											<tr scope="row">
												<td ><img src="<c:url value="/uploaded/${food.foodImage}"/>" style="width: 100px"  onerror="this.src='${contextRoot}/Photo/nophoto.jpg'"/></td>
												<td><p>${food.foodId}</p></td>
												<td><c:out value="${food.foodName}" /></td>
												<td><c:out value="${food.foodPrice}" /></td>
												<td><c:out value="${food.foodType}" /></td>
												<td><c:out value="${food.foodState}" /></td>
												<td>
<%-- 												<a href="${contextRoot}/deleteFood?foodId=${food.foodId}"> --%>
													<button type="button" class="btn btn-danger confirmedDelete" id="confirmedDelete" value="${food.foodId}">刪除</button>
<!-- 												</a> -->

<%-- 												<a href="${contextRoot}/editFood?foodId=${food.foodId}"><button type="button" class="btn btn-success">修改</button></a> --%>
<!-- 													使用跳轉畫面 -->
<%-- 												<a href="${contextRoot}/editFood?foodId=${food.foodId}"><button type="button" class="btn btn-success">修改</button></a>												 --%>
<%-- 												<a href="${contextRoot}/editPic?foodId=${food.foodId}"><button type="button" class="btn btn-secondary">新增圖片</button></a> --%>
<!-- 													使用跳轉畫面(以上) -->
												
												<input type="button" class="edit btn btn-success" value="修改" data-toggle="modal" data-target="#editFood">
												
												
													<input type="button" class="btn btn-secondary editPic" data-toggle="modal" data-target="#editPic" value="更改圖片">
														
												
												
<!-- 												<button type="button" class="btn btn-success" class="edit" value="修改" data-toggle="modal" data-target="#editFood">修改</button> -->
								
												
											</tr>
										</c:forEach>
									</tbody>
			</table>
		</div>


		<%-- 		<h3>共${page.size()}筆食物資料</h3> --%>
		<!-- 		size():Collection Object (ArrayList, Set, etc) — 取得集合物件相關大小 -->

		<!-- 		<a href="m10/HomePage.html"><input type="button" value="回首頁" class="myButton"></a>  -->
		<!-- 			新增按鈕 -->
		<%-- 			<a href="${contextRoot}/addFood"><input type="button" value="新增" class="myButton"></a>			 --%>
					<br>
					<div class="row justify-content-center" style="align:center">
					<div class="col-9">
						<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

							<c:choose>
								<c:when test="${page.number != pageNumber -1}">

		 							<a href="${contextRoot}/foodList?p=${pageNumber}"><c:out 
		 									value="${pageNumber}" /> </a>
		 						</c:when> 

		 						<c:otherwise> 
		 							<c:out value="${pageNumber}" /> 
		 						</c:otherwise> 
		 					</c:choose> 

		 					<c:if test="${pageNumber != page.totalPages}"> 
		 			| 
		 			</c:if> 

		 				</c:forEach> 
					</div>
				</div>
	</div>
	
	
	
	
	
<!-- 	==================================編輯餐點================================== -->


<div class="modal fade" id="editFood" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel"
							style="font-weight: 600;">編輯</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!--彈窗內部-->
						<form:form class="form"
							action="${contextRoot}/editFood"
							modelAttribute="Food" method="POST" id="editform">

							<table class="table">
								<thead class="table table-light	">
									<tr>
										<th>編號</th>
										<td><form:input path="foodId" readonly="true" /></td>
									</tr>
								</thead>
								<tbody>

									<tr>
										<th>名稱</th>
										<td><form:input path="foodName" /></td>
									</tr>
									<tr>
										<th>價錢</th>
										<td><form:input path="foodPrice" /></td>
									</tr>
									
									<tr>
										<th>類型 :</th>
										<td><form:select path="foodType">類型
												<form:option value="研磨咖啡">研磨咖啡</form:option>
												<form:option value="吐司類">吐司類</form:option>
												<form:option value="麵類">麵類</form:option>
												<form:option value="經典炸物">經典炸物</form:option>
												<form:option value="鬆餅類">鬆餅類</form:option>
												<form:option value="飲品">飲品</form:option>
											</form:select></td>
										
									</tr>
									
									<tr>
										<th>輸入狀態 :</th>
										<td><form:select path="foodState">狀態
												<form:option value="供應中">供應中</form:option>
												<form:option value="未供應">未供應</form:option>
											</form:select></td>
										<form:input path="foodImage" type="hidden" />
									</tr>
									
								</tbody>
							</table>
							<p></p>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">關閉</button>
								<input type="submit" class="btn btn-primary" id="check"
									value="更動">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>	
	
	
	
<!-- 	==================================編輯餐點(以上)================================== -->
	
	
<!-- 	==================================編輯圖片================================== -->	
			<div class="modal fade" id="editPic" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="exampleModalLabel"
							style="font-weight: 600;">編輯圖片</h3>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!--彈窗內部-->
						<form:form class="form"
							action="${contextRoot}/meals/editPic"
							modelAttribute="Food" method="POST" id="editPic"
							enctype="multipart/form-data">

							<table class="table">
								<thead class="table table-light	">
									<tr>
										<th>圖片</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><form:input path="file" type="file" /></td>
										<form:input path="foodId" type="hidden" />
										<form:input path="foodName" type="hidden" />
										<form:input path="foodPrice" type="hidden" />
										<form:input path="foodType" type="hidden" />
										<form:input path="foodState" type="hidden" />
									</tr>
								</tbody>
							</table>
							<p></p>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">關閉</button>
								<input type="submit" class="btn btn-primary" id="check"
									value="更動">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		
		
<!-- 	==================================編輯圖片(以上)================================== -->	
	
	
<script src="${contextRoot}/js/jquery-3.6.0.min.js" type="text/javascript"></script>
	<script>
	$.ajax({
		url: "${contextRoot}/foodListAjax",
		type: "POST",
		success:function(data){
			var a;
			data.forEach(element => {
				a+="<tr scope='row'>";
					a+="<td>" + element.foodName + "</td>"
					a+="<td>" + element.foodPrice + "</td>"
					a+="<td>" + element.foodType + "</td>"
					a+="<td>" + "<img src='${contextRoot}/uploaded/" + element.foodImage + "' style='width: 150px'/>" + "</td>"
					// a+="<td>" + "<a href='${contextRoot}/deleteFood?foodId=" + element.foodId + " onclick='return confirm("確認刪除?")'"'><input type='button' value='刪除'>" + "</td>"
					a+="<td>" + "<a href='${contextRoot}/editFood?foodId=" + element.foodId + "'><input type='button' value='修改'>" + "</td>"
					a+="<td>" + "<a href='${contextRoot}/editPic?foodId=" + element.foodId + "'><input type='button' value='新增圖片'>" + "</td>"
						a+="</tr>";
					});
			$('#tablebody').append(a);
		}
	})

	function del() {
				if (confirm("確實要刪除嗎？")) {
					alert("已經刪除！");
				} else {
					alert("已經取消了刪除操作");
				}

			}
	
	
	
	
// ============================檢視餐點資料========================================
	$(".edit").click(function() {
			let id = $(this).parent().parent().find("p").html();
			console.log(id)
			$.ajax({
				url : "${contextRoot}/meals/editFoodAjax?foodId=" + id,
				method : "get",
				success : function(data) {
					console.log(data)
					$("#foodId").val(data.foodId);
					$("#foodName").val(data.foodName);
					$("#foodPrice").val(data.foodPrice);
					$("#foodType").val(data.foodType);
					$("#foodImage").val(data.foodImage);
					$("#foodState").val(data.foodState);
				},
			})
		})
		
		


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
					  url: "${contextRoot}/deleteFood?foodId=" + id,
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
		
// ============================檢視餐點圖片========================================		
	$(".editPic").click(
			function() {
				let id = $(this).parent().parent().find("p").html();
				console.log(id)
				$.ajax({
					url : "${contextRoot}/meals/editPicAjax?foodId="+ id,
					method : "get",
					success : function(data) {
						$("#editPic #foodId").val(data.foodId);
						$("#editPic #foodName").val(data.foodName);
						$("#editPic #foodPrice").val(data.foodPrice);
						$("#editPic #foodType").val(data.foodType);
						$("#editPic #file").val(data.file);
						$("#editPic #foodState").val(data.foodState);
					},
				})
			})
</script>

<!-- <iframe id="id_iframe" name="nm_iframe" style="display: none;"></iframe> -->

</body>
</html>