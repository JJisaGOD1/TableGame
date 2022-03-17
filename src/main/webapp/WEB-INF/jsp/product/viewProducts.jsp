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
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>View Messages Page</title>


<style>
.body{ background-color:#f5f5f5; }
 #container{ width:980px; margin:0px auto;}
 .keyword{color:red;text-decoration:underline;}
.fieldset {
	width: 100px;
}
</style>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<table class="table">
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
						<th>庫存</th>
						<th>上下架</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="P" items="${P.content}">
						<tr>
							<th scope="row"><p>${P.product_id}</p></th>
							<td><c:out value="${P.product_name}" />
							<td><c:out value="${P.price}" />
							<td><c:out value="${P.gametype}" />
							<td><c:out value="${P.minplayer}" />
							<td><c:out value="${P.maxplayer}" />
							<td><c:out value="${P.low_age}" />
							<td><img src="<c:url value='/Photo/${P.photourl}'/>"
								style="height: 100px" name="${P.photourl}" id="${P.photourl}"
								onerror="this.src='${contextRoot}/Photo/nophoto.jpg'" />
							<td><c:out value="${P.stock}" />
							<td><c:out value="${P.sellstatus}" />
							<td><div>
									<input type="button" class="btn btn-primary edit"
										value="編輯第${P.product_id}筆" data-toggle="modal"
										data-target="#editModal">
								</div>
								<div>
									<input type="button" class="btn btn-secondary changephoto"
										data-toggle="modal" data-target="#changephotoModal"
										value="更改圖片">
								</div>
								<div>
									<input type="button" class="checkHistory btn btn-info"
										value="歷史紀錄" data-toggle="modal" data-target="#checkHistory">
								</div>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	<div
		style="position: relative; width: 30vw; margin: auto; font-size: x-larg	e;"
		align="center">
		<div class="col-9">
			<c:out value="第" />
			<c:forEach var="pageNumber" begin="1" end="${P.totalPages}">

				<c:choose>
					<c:when test="${pageNumber-1==P.number}">
						<!--page.number:取的當前頁面的頁碼-->
						<c:out value="${pageNumber}" />
					</c:when>
					<c:otherwise>
						<a href="${contextRoot}/products/viewProducts?p=${pageNumber}"><c:out
								value="${pageNumber}" /> </a>
					</c:otherwise>
				</c:choose>

				<c:if test="${pageNumber != P.totalPages}">
					<!--顯示|的條件:如果是最後一頁，後面就不顯示-->
						|
					</c:if>
			</c:forEach>
			<c:out value="頁" />
		</div>
	</div>
		<div class="modal fade" id="editModal" tabindex="-1"
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
							action="${contextRoot}/products/editProduct"
							modelAttribute="Product" method="POST" id="editform">

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
							<p></p>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">關閉</button>
								<input type="submit" class="btn btn-primary editsubmit"
									id="check" value="更動">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="changephotoModal" tabindex="-1"
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
							action="${contextRoot}/products/changePicture"
							modelAttribute="Product" method="POST" id="changePicture"
							enctype="multipart/form-data">

							<table class="table">
								<thead class="table table-light	">
									<tr>
										<th>圖片</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><form:input path="photo" type="file" /></td>
										<form:input path="product_id" type="hidden" />
										<form:input path="product_name" type="hidden" />
										<form:input path="price" type="hidden" />
										<form:input path="gametype" type="hidden" />
										<form:input path="minplayer" type="hidden" />
										<form:input path="maxplayer" type="hidden" />
										<form:input path="low_age" type="hidden" />
										<form:input path="sellstatus" type="hidden" />
										<form:input path="stock" type="hidden" />
										<form:input path="productintroduce" type="hidden" />
										<form:input path="problem_count" type="hidden" />
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
		<div class="modal fade" id="checkHistory" tabindex="-1"
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
									<th>紀錄編號</th>
									<th>商品編號</th>
									<th>庫存</th>
									<th>變更日期</th>
									<th>變更事件</th>

								</tr>
							</thead>
							<tbody class="checkHistorytable">

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
		$(".edit").click(function() {
			let id = $(this).parent().parent().parent().find("p").html();
			console.log(id)
			$.ajax({
				url : "${contextRoot}/products/editproductAjax?id=" + id,
				method : "get",
				success : function(data) {
					console.log(data)
					$("#product_id").val(data.product_id);
					$("#product_name").val(data.product_name);
					$("#price").val(data.price);
					$("#gametype").val(data.gametype);
					$("#minplayer").val(data.minplayer);
					$("#maxplayer").val(data.maxplayer);
					$("#low_age").val(data.low_age);
					$("#stock").val(data.stock);
					$("#sellstatus").val(data.sellstatus);
					$("#productintroduce").val(data.productintroduce);
					$("#photourl").val(data.photourl);
				},
			})
		})

		$(".changephoto").click(
				function() {
					let id = $(this).parent().parent().parent().find("p").html();
					console.log(id)
					$.ajax({
						url : "${contextRoot}/products/changephotoAjax?id="
								+ id,
						method : "get",
						success : function(data) {
							$("#changePicture #product_id")
									.val(data.product_id);
							$("#changePicture #product_name").val(
									data.product_name);
							$("#changePicture #price").val(data.price);
							$("#changePicture #gametype").val(data.gametype);
							$("#changePicture #minplayer").val(data.minplayer);
							$("#changePicture #maxplayer").val(data.maxplayer);
							$("#changePicture #low_age").val(data.low_age);
							$("#changePicture #stock").val(data.stock);
							$("#changePicture #sellstatus")
									.val(data.sellstatus);
							$("#changePicture #productintroduce").val(
									data.productintroduce);
							$("#changePicture #photourl").val(data.photourl);
							$("#changePicture	 #problem_count").val(
									data.problem_count);
						},
					})
				})

		$(".checkHistory").click(function() {
			let id = $(this).parent().parent().parent().find("p").html();
			$.ajax({
				url : "${contextRoot}/products/checkHistoryoAjax?id=" + id,
				method : "get",
				success : function(data) {
					$(".checkHistorytable").empty();
				console.log(data)
					data.forEach(element => {
						let a = "";
						a+="<tr>";
						a+="<td>"+element.productinformationId+"</td>";
						a+="<td>"+element.productid_id+"</td>";
						a+="<td>"+element.stock+"</td>";
						a+="<td>"+element.changedate+"</td>";
						a+="<td>"+element.history+"</td>";
						a+="</tr>";
						$(".checkHistorytable").append(a)
					});
				},
			})
		})
		$("form").submit( function () {
			let maxplayer=$(this).parent().parent().find('#maxplayer').val();
			let minplayer=$(this).parent().parent().find('#minplayer').val();
			let stock=$(this).parent().parent().find('#stock').val();

			if (parseInt(minplayer)>=parseInt(maxplayer)){
				window.alert('最大人數須大於最小人數');
				return false;
			}
			if (parseInt(stock)<20){
				window.alert('庫存小於20，將自動下架');
			}
        return true;
    } );
		
	</script>
</body>
</html>