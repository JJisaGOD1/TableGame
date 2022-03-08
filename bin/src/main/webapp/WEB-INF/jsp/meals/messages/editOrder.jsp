<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料</title>

<style>
.myButton {
	box-shadow: 0px 0px 0px 2px #9fb4f2;
	background: linear-gradient(to bottom, #7892c2 5%, #476e9e 100%);
	background-color: #7892c2;
	border-radius: 10px;
	border: 1px solid #4e6096;
	display: inline-block;
	cursor: pointer;
	color: #ffffff;
	font-family: Arial;
	font-size: 19px;
	padding: 12px 37px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #283966;
}

.myButton:hover {
	background: linear-gradient(to bottom, #476e9e 5%, #7892c2 100%);
	background-color: #476e9e;
}

.myButton:active {
	position: relative;
	top: 1px;
}

.Img1 {
	color: blure;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	width: 50px;
}

.Img1:hover {
	opacity: 1.0;
	filter: alpha(opacity = 100);
	width: 50px;
}
</style>

<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

</head>
<body style="background-color: #fdf5e6">
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<div class="col-9">
				<div class="card">
					<div class="card-header">修改訂單資料</div>
					<div class="card-body">

						<form:form class="form" action="${contextRoot}/editOrder"
							modelAttribute="order" method="post">
							<form:input type="hidden" path="orderId" />
							<form:input type="hidden" path="orderDate" />

							<p>
								桌號 :
								<form:input value="${order.tableNum}" type="text" path="tableNum" name="food_name" class="form-control" />
							<p>
								人數 :
								<form:input value="${order.peopleNum}" type="text" path="peopleNum" name="food_price" class="form-control" />
							<p>
								訂單狀態 : 
								<form:select value="${order.processState}" path="processState" class="form-select" aria-label="Default select example">
									<option><c:out value="${order.processState}" /></option>
									<option>已處理</option>
									<option>處理中</option>
									<option>待處理</option>
									<option>取消訂單</option>
								</form:select>
							<p>
								付款狀態 : 
								<form:select value="${order.paymentState}" path="paymentState" class="form-select" aria-label="Default select example">
									<option><c:out value="${order.paymentState}" /></option>
									<option>已付款</option>
									<option>未付款</option>
									<option>取消付款</option>
								</form:select>
<!-- 							<p> -->
						
							<p>
							
								<input type="submit" name="submit" id="btnSubmit" class="btn btn-secondary btn-sm" />
						</form:form>
						
									
						
						
					</div>
				</div>
			</div>


		</div>
	</div>
	



</body>
</html>