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
<meta charset="UTF-8">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<title>View all Comment</title>
<style>
span {
	font-size: x-large;
	font-weight: 600;
}

body {
	background-repeat: none;
	background-size: 100%;
}
li{
	font-size: 1.3rem;
}

.sty1 {
	border: 2px solid;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}
.text1{
	text-align: justify;
    font-weight: 600;
    font-size: larger;
}
.button1{
	font-size: larger;
}
</style>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<br>
	<br>
	<div class="container">
		<h2 style="font-weight: 600; text-align: center;">留言總覽</h2>


		<div>
			<div class="row justify-content-end" style="width: 52vw;">
				<div class="col-2">
					<select name="category" class="form-control" id="category"
						onchange="javascript:location.href = this.value;">
						<option value="-1">請選擇</option>
						<option
							value="http://localhost:8080/homepage/conditions/viewComments/1">待回覆</option>
						<option
							value="http://localhost:8080/homepage/conditions/viewComments/2">回覆中</option>
						<option
							value="http://localhost:8080/homepage/conditions/viewComments/3">已回覆</option>
					</select>
				</div>
			</div>

			<c:forEach items="${pages.content}" var="page">
				<div class="row justify-content-center">
					<div class="col-9">
						<div class="card sty1">
							<div class="card-header">
								<span>留言時間:&nbsp;&nbsp;
								<fmt:formatDate pattern="yyyy-MM-dd EEEE"
									value="${page.createdTime}"  /></span>
							</div>
							<div class="card-body">
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><span>會員姓名&nbsp;:&nbsp;</span>
										<c:out value="${page.membersBean.cusName}" /></li>
									<li class="list-group-item"><span>回覆狀態&nbsp;:&nbsp;</span>
										<c:out value="${page.conditionsBean.conName}" /></li>
									<li class="list-group-item"><span>留言&nbsp;:&nbsp;</span> <c:out
											value="${page.comment}" /></li>
									<li class="list-group-item"><span>回覆&nbsp;:&nbsp;</span> <c:out
											value="${page.response}" /></li>
									<li class="list-group-item"><span>問題類別&nbsp;:&nbsp;</span>
										<c:out value="${page.categorysBean.cateName}" /></li>
									<c:if test="${page.categorysBean.id==6}">
										<li class="list-group-item"><span>產品名&nbsp;:&nbsp;</span>
											<c:out value="${page.productsBean.product_name}" /></li>
									</c:if>
									<li style="display: none;"><p>${page.id}</p></li>
								</ul>
								<p></p>
								<div style="text-align: end;">
									<c:if test="${page.categorysBean.id==6}">
										<a  href="${contextRoot}/products/Problem"><button class="btn btn-info button1">產品問題圖</button></a>
									</c:if>
									<button class="btn btn-primary edit button1" data-toggle="modal" data-target="#exampleModal" >編輯</button>

									<div class="modal fade" id="exampleModal" tabindex="-1"
										aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<h3 class="modal-title" id="exampleModalLabel" style="font-weight: 600;">編輯留言</h3>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<!--彈窗內部-->
													<form:form class="form" action="${contextRoot}/editComment"
														modelAttribute="editComment" method="POST" id="editform">

														<form:input path="id" style="display: none;"/>

														<label for="name" class="card-header text1"
															style="display: block;">會員姓名</label>
														<input type="text" class="form-control" name="name" id="name"
															value="${editComment.membersBean.cusName}" readonly />
														<p></p>

														<form:label path="comment" class="card-header text1" 
															style="display:block;">會員意見</form:label>
														<form:textarea path="comment" class="form-control"
															readonly="true" />
														<p></p>

														<form:label path="response" class="card-header text1"
															style="display:block;">回覆</form:label>
														<form:textarea path="response" class="form-control" />
														<p></p>

														<form:input path="createdTime" style="display: none;"/>

														<form:label path="" class="card-header text1"
															style="display:block;">問題類別</form:label>
														<form:select path="categorysBean" class="form-control">
															<c:forEach items="${cates}" var="cate">
																<form:option value="${cate.id}">${cate.cateName}</form:option>
															</c:forEach>
														</form:select>
														<p></p>

														<form:hidden path="productsBean" />

														<form:label path="" class="card-header text1"
															style="display:block;">回覆狀態</form:label>
														<form:select path="conditionsBean" class="form-control">
															<c:forEach items="${conditions}" var="condition">
																<form:option value="${condition.id}">${condition.conName}</form:option>
															</c:forEach>
														</form:select>
														<p></p>
														
													
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary button1" data-dismiss="modal">關閉</button>
													<input type="submit" class="btn btn-primary button1" id="check" value="更動">
												</div>
											</form:form>
												</div>

											</div>
										</div>
									</div>

									<a href="${contextRoot}/deleteComment?id=${page.id}" >
										<button class="btn btn-danger button1" onclick="return confirm('是否刪除?')">刪除</button>
									</a>
								</div>
							</div>
						</div>
					</div>

				</div>
				<br>
			</c:forEach>
		</div>
		<div class="row justify-content-center" style="text-align: right">
			<div class="col-9" style="font-size: x-large;">
				<c:forEach var="pageNumber" begin="1" end="${pages.totalPages}">
					<c:choose>
						<c:when test="${pages.number != pageNumber -1}">
							<a href="${contextRoot}/viewComments?p=${pageNumber}"><c:out
									value="${pageNumber}" /> </a>
						</c:when>
						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>
					<c:if test="${pageNumber != pages.totalPages}">
						|
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		// $("#category").change(function(){
		// 		console.log($(this).val());
		// 		conditionNum = $(this).val();
		// 		$.ajax({
		// 			url : "http://localhost:8080/homepage/ajax/condition/"+conditionNum,
		// 			method:"GET",
		// 			contentType: "application/json; charset=UTF-8",
		// 			error : function(err) {
		// 					console.log(err)
		// 					lert('發生錯誤')
		// 			}
		// 		})
		// 	})
		$(".edit").click(function() {
			console.log($(this).parent().parent())
			let id = $(this).parent().parent().find("p").html();
			$.ajax({
				url : "${contextRoot}/editAjax?id=" + id,
				method : "get",
				success : function(data) {
					console.log(data)
					console.log(data.id)
					$("#id").val(data.id)
					$("#name").val(data.membersBean.cusName);
					$("#comment").val(data.comment);
					$("#response").val(data.response)
					$("#createdTime").val(data.createdTime)
					$("#categorysBean").val(data.categorysBean.id)
					$("#conditionsBean").val(data.conditionsBean.id)
				},
			})
			
		})
		$("#categorysBean").change(function() {
				let res = $(this).val();
				console.log(res);
				if (res == 6) {
					var str = "<br><label id='product1' class='card-header text1' style='display:block;'>產品</label>"
					+"<select class='form-control' id='product' name='product'>" 
					$.ajax({
						url : "http://localhost:8080/homepage/ajax/product",
						dataType : "JSON",
						method : "GET",
						success : function(result) {
							console.log(result)
								$.each(result,function(index,value) {
									str += "<option value="+ "'" + index +"'" + ">"+ value + "</option>"
									console.log(index);
									console.log(value);
									//console.log(str);

								})
								str += "</select>"
								console.log(str)
								$("#categorysBean").after(str)
						},
						error : function(err) {
									console.log(err)
									alert('發生錯誤')
								}
					})
				} 
				else {
						$("#product").remove();
						$("#product1").remove()
					}
		})
		
	</script>

</body>
</html>
<!-- 測試 -->