
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
<link href="${contextRoot}/css/menu.css" rel="stylesheet" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/js/sweetalert2.all.min.js" rel="stylesheet" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- <link rel="stylesheet" href="css/stylesheet.css"> -->
<style>
.top_food_banner {
	width: 100vw;
	z-index: -1;
}

.top_food_banner_bg {
	background-image: url('uploaded/food_banner.png');
	background-repeat: no-repeat;
	/* 	background-attachment: fixed; */
	/* 	background-size: 100% 100%; */
	width: 100vw;
	height: 100vh;
}

.finished_order_icon{
  	position: fixed; 
  	right: 31px; 
  	bottom: 31px;
  	width:8%;
  }

/* body { */
/* 	background-image: url(uploaded/food_banner.png); */
/* 	background-repeat: no-repeat; */
/*  	background-size: 100%; */

/* } */
.bgImg{
	position: absolute;
	top: 10px;
	right: 0;
	z-index: -5;
	width: 100vw;
}
</style>
</head>
<body >
	<img class="bgImg" src="<c:url value="/uploaded/food_banner.png"/>" class="top_food_banner" />
<!-- 	<div class="top_food_banner_bg"></div> -->
	

	<!-- <div style="background: cover url('<c:url value="/uploaded/food_banner.png"/>'); background-size: cover; width: 100vw; height: 500px;"></div> -->
	


	<div style="background: cover url(uploaded/food_banner.png); background-size: cover; width: 100vw;">
		<a href="${contextRoot}/checkOrder"> <img src="<c:url value="/uploaded/app-icon-sales-order.png"/>" class="finished_order_icon" /> </a>
		
		<span class="orderId">訂單編號<c:out value="${newOrders.orderId}" /></span>
		<span class="tableNum">第<c:out value="${newOrders.tableNum}" /></span>

		<div class="row justify-content-center">
			<a href="${contextRoot}/goToCart">查看訂單</a>
		</div> 

	<div class="wrap">
		<!-- <div class="menu">
          <h3>甜點類別</h3>  
            <ul>
                <li class="all-items"><a href="#">所有甜點 (45)</a></li>
                <li class="other-items"><a href="#">本日精選 (10)</a></li>
                <li class="other-items"><a href="#">人氣精選 (26)</a></li>
                <li class="other-items"><a href="#">新品上市 (12)</a></li>
            </ul>
        </div> -->


		<!-- 		<div class="content"> -->
		<%-- 			<c:forEach items="${page.content}" var="food"> --%>
		<!-- 				<div class="item"> -->
		<%-- 					<img src="<c:url value="/uploaded/${food.foodImage}"/>" style="width:300px" alt="picture of food" /> --%>

		<!-- 					<div class="item-name"> -->
		<%-- 						<span class="name"><c:out value="${food.foodName}" /></span> <span --%>
		<%-- 							class="price">NT$ <c:out value="${food.foodPrice}" /></span> --%>
		<!-- 					</div> -->
		<%-- 					<a href="${contextRoot}/addToCart?foodId=${food.foodId}" style="text-decoration:none;">加入訂單</a> --%>

		<!-- 				</div> -->
		<%-- 			</c:forEach> --%>
		<!-- 			<p> -->
		<!-- 		</div> -->


		<div class="content">
			<c:forEach items="${page.content}" var="food">
				<div class="card" style="margin: 10px 5px;">
					<img src="<c:url value="/uploaded/${food.foodImage}"/>"
						style="width: 250px" alt="picture of food" class="card-img-top" />
					<div class="card-body">
						<h5 class="card-title">
							<c:out value="${food.foodName}" />
						</h5>
						<p class="card-text">
							NT$
							<c:out value="${food.foodPrice}" />
						</p>
						<a onclick="alert('已加入訂單')"
							href="${contextRoot}/addToCart?foodId=${food.foodId}"
							class="btn btn-primary">加入訂單</a>
						<%-- 							<a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteMessage?id=${workMessages.id}">刪除</a> --%>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 			<div class="item"> -->
		<!-- 				<img src="" alt="picture of food"> -->
		<!-- 				<div class="item-name"> -->
		<!-- 					<span class="name">拿鐵咖啡</span> <span class="price">NT$ 100</span> -->
		<!-- 				</div> -->
		<!-- 				<a href="#">加入購物車</a> -->
		<!-- 			</div> -->
		<!-- 			<div class="item"> -->
		<!-- 				<img src="" alt="picture of food"> -->
		<!-- 				<div class="item-name"> -->
		<!-- 					<span class="name">美式咖啡</span> <span class="price">NT$ 80</span> -->
		<!-- 				</div> -->
		<!-- 				<a href="#">加入購物車</a> -->
		<!-- 			</div> -->
		<!-- 			<div class="item"> -->
		<!-- 				<img src="" alt="picture of food"> -->
		<!-- 				<div class="item-name"> -->
		<!-- 					<span class="name">可可鬆餅</span> <span class="price">NT$ 100</span> -->
		<!-- 				</div> -->
		<!-- 				<a href="#">加入購物車</a> -->
		<!-- 			</div> -->


		<!-- 	===================訂單明細(之後加入)===================	 -->
		<table class="table">
			Product #1
			<p>11111111111111111111</p>

			<c:forEach items="${cart.foodMap}" var="cart">
				<tr scope="row">

					<td>
						<div class="buttons">

							<a href="${contextRoot}/deleteOneFoodItem"> <img
								src="<c:url value="/uploaded/delete.svg"/>" style="" />
							</a>

						</div>
					</td>

					<td>
						<div class="image">
							<img
								src="<c:url value="/uploaded/${cart.value.food.foodImage}"/>"
								style="width: 150px" />
						</div>
					</td>

					<td>
						<div class="description">
							<span><c:out value="${cart.value.food.foodName}" /></span> <span>單價:NT$<c:out
									value="${cart.value.food.foodPrice}" /></span> <span><c:out
									value="${cart.value.food.foodType}" /></span>
						</div>
					</td>

					<td>
						<div class="quantity">
							<button class="plus-btn" type="button" name="button">
								<img src="<c:url value="/uploaded/plus.svg"/>" alt="" />
							</button>
							<input type="text" name="name"
								value="<c:out value='${cart.value.quantity}' />">
							<button class="minus-btn" type="button" name="button">
								<img src="<c:url value="/uploaded/minus.svg"/>" alt="" />
							</button>
						</div>
					</td>
					<td>
						<div class="">
							小計 NT$:
							<c:out value="${cart.value.price}" />
						</div>
					</td>
				</tr>
			</c:forEach>
			</div>

		</table>
		<!-- 	===================訂單明細(之後加入)以上===================	 -->


		<!-- 	===================頁碼===================	 -->
	</div>

	<div class="row justify-content-center">
		<div class="col-9">
			<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

				<c:choose>
					<c:when test="${page.number != pageNumber -1}">

						<a href="${contextRoot}/menu?p=${pageNumber}"><c:out
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
	<!-- 	===================頁碼()以上===================	 -->
		
		
	</div>
	

	<script>
		function addFoodAlert() {
			Swal.fire('Good job!', 'You clicked the button!', 'success')
		}
	</script>





</body>
</html>