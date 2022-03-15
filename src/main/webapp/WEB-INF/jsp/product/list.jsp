<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp" />
<jsp:include page="layout/NewFile.jsp" />

<!DOCTYPE html>
<html>
<head>

<link href="${contextRoot}/css/menu.css" rel="stylesheet" />
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/forProductPage.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

<
style>.top_food_banner {
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

.finished_order_icon {
	position: fixed;
	right: 6vw;
	top: 12vh;
	width: 5vw;
}

/* body { */
/* 	background-image: url(uploaded/food_banner.png); */
/* 	background-repeat: no-repeat; */
/*  	background-size: 100%; */

/* } */
.bgImg {
	position: absolute;
	top: 10px;
	right: 0;
	z-index: -5;
	width: 100vw;
}
$main-color:;
$light-text:#ABB0BE;
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css)
	;

*, *:before, *:after {
	box-sizing: border-box;
}

body {
	font: 14px/22px "Lato", Arial, sans-serif;
}

.lighter-text {
	color: #ABB0BE;
}

.main-color-text {
	color: $main-color;
}

.cart-nav {
	padding: 20px 0 40px 0;
	background: #F8F8F8;
	font-size: 16px;
	.
	navbar-left
	{
	float
	:
	left;
}

.navbar-right {
	float: right;
}

ul {li { display:inline;
	padding-left: 20px; a { color : #777777;
	text-decoration: none;
	&:
	hover
	{
	color
	:
	black;
}

}
}
}
}
.container {
	margin: auto;
	width: 80%;
}

.badge {
	background-color: #6394F8;
	border-radius: 10px;
	color: white;
	display: inline-block;
	font-size: 12px;
	line-height: 1;
	padding: 3px 7px;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
}

.shopping-cart {
	margin: 20px 0;
	float: right;
	background: white;
	width: 22vw;
	position: relative;
	border-radius: 3px;
	padding: 20px;
	position: fixed;
	top: 18vh;
	right: 6.4vw;
	transition:none;
	.shopping-cart-header{ border-bottom : 1px solid
	#E8E8E8;
	padding-bottom: 15px; .
	shopping-cart-total {float: right;
}

}
.shopping-cart-items {
	padding-top: 20px;
	li {margin-bottom: 18px;
}

img {
	float: left;
	margin-right: 12px;
}

.item-name-cart {
	display: block;
	padding-top: 10px;
	font-size: 16px;
}

.item-price {
	color: $main-color;
	margin-right: 8px;
}

.item-quantity {
	color: $light-text;
}

}
}
.shopping-cart:after {
	bottom: 100%;
	left: 89%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: white;
	border-width: 8px;
	margin-left: -8px;
}

.cart-icon {
	color: #515783;
	font-size: 24px;
	margin-right: 7px;
	float: left;
}

.button {
	background: $main-color;
	color: white;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	display: block;
	border-radius: 3px;
	font-size: 16px;
	margin: 25px 0 15px 0;
	&:
	hover
	{background:lighten($main-color,3%);
}

}
.clearfix:after {
	content: "";
	display: table;
	clear: both;
}
</style>

</head>
<body>

	<img src="<c:url value="/uploaded/app-icon-sales-order.png"/>"
		class="finished_order_icon" id="cart" />
	<div class="container">
		<div class="shopping-cart">
			<div class="shopping-cart-header">

				<!--       <i class="fa fa-shopping-cart cart-icon"></i> -->
				<div class="shopping-cart-total">
					<div style="position: inherit; height: 4vh">

						<div style="">
							<i class='bx bxs-cart bx-tada bx-sm'></i> <span class="badge"><c:out
									value="${productcart.productMap.size()} "></c:out></span>
						</div>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<!--         <span class="lighter-text"></span> -->
						<span class="main-color-text"
							style="font-size: 1.5rem; color: cornflowerblue;">Total: $<c:out
								value="${productcart.price}" /></span>
					</div>
				</div>
			</div>
			<!--end shopping-cart-header -->
			<hr>
			<div style="overflow-y: auto; height: 50vh;">

				<c:forEach items="${productcart.productMap}" var="C">
					<ul class="shopping-cart-items">
						<li class="clearfix"><img
							src="<c:url value="/Photo/${C.value.product.photourl}"/>"
							style="width: 50px" alt="item1" /> <span class="item-name-cart"><c:out
									value="${C.value.product.product_name}" /></span> <span
							class="item-price">單價:NT$<c:out value="${C.value.price}" /></span>
							<span class="lighter-text">數量:<c:out
									value='${C.value.quantity}' /></span></li>
					</ul>
					<a
						href="${contextRoot}/products/deleteOneLListItem?id=${C.value.product.product_id}"><input
						type="button" onclick="return confirm('確認刪除商品?')" value="整個刪除"></a>
				</c:forEach>
			</div>
		</div>
		<!--end shopping-cart -->
	</div>
	<!--end container -->

	<div class="wrap" style="width: 60vw; margin-left: 5vw">
		<div class="content" style="width: 60vw; padding: 5%">
			<c:forEach items="${P.content}" var="P">
				<c:choose>
					<c:when test="${P.sellstatus=='上架中'&&P.stock>10}">
						<div class="card"
							style="width: 15vw; padding: auto; margin-bottom: 0">
							<div
								style="max-width: 15vw; height: 18vw; display: flex; justify-content: center;">
								<a
									href="${contextRoot}/products/showImformation?id=${P.product_id}">
									<img src="<c:url value='/Photo/${P.photourl}' />"
									style="width: 15vw; max-height: 18vw; margin-bottom: 0"
									alt="picture of food" class="card-img-top"
									onerror="this.src='${contextRoot}/Photo/nophoto.jpg'" />
								</a>
							</div>
							<div class="card-body" style="padding: 0 1vw 0.5vw 1vw">
								<h5 class="card-title">
									<c:out value="${P.product_name}" />
								</h5>
								<p class="card-text">
									NT$
									<c:out value="${P.price}" />
								</p>
								<a
									href="${contextRoot}/products/addToProductCart?id=${P.product_id}&quantity=1"
									class="btn btn-primary" onclick="return confirm('是否加入購物車?')">加入一個到購物車</a>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>

		</div>
	</div>
	<div style="display: flex; justify-content: center;">
		<c:forEach var="pageNumber" begin="1" end="${P.totalPages}">

			<c:choose>
				<c:when test="${pageNumber-1==P.number}">
					<!--page.number:取的當前頁面的頁碼-->
					<c:out value="${pageNumber}" />
				</c:when>
				<c:otherwise>
					<a href="${contextRoot}/products/list?p=${pageNumber}"><c:out
							value="${pageNumber}" /> </a>
				</c:otherwise>
			</c:choose>


			<c:if test="${pageNumber != P.totalPages}">
				<!--顯示|的條件:如果是最後一頁，後面就不顯示-->
						|
					</c:if>
		</c:forEach>
	</div>
	<div></div>
	<div style="display: flex; justify-content: center;">
		<a href="${contextRoot}/products/goToProductCart"><input
			type="button" value="查看購物車"></a>
	</div>
</body>
<script>
	function addFoodAlert() {
		Swal.fire('Good job!', 'You clicked the button!', 'success')
	}

	(function() {

		$("#cart").on("click", function() {
			$(".shopping-cart").fadeToggle("fast");
		});

	})();
</script>

</html>