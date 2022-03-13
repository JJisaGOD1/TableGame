<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">

<link href="${contextRoot}/css/homePage.css" rel="stylesheet">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRoot}/js/bootstrap.bundle.min.js" rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

h1 {
	text-align: center;
}

#screenBox {
	margin: 20px auto;
	width: 1745px;
	height: 70rem;
	/* border1: 3px solid grey; */
	overflow: hidden;
	position: relative;
	background-color: blue;
}

#movedot {
	margin: 0px auto;
	width: 1200px;
	height: 30px;
	/* border: 3px solid grey; */
	/* overflow: hidden; */
	position: relative;
}

#list {
	width: 8725px;
	height: 550px;
	position: absolute;
	z-index: 1;
}

#list img {
	float: left;
	width: 1745px;
	height: 70rem;
}

#buttons {
	position: absolute;
	height: 10px;
	width: 100px;
	z-index: 2;
	bottom: 20px;
	right: 540px;
}

#buttons span {
	float: left;
	border: 1px solid white;
	border-radius: 50%;
	height: 10px;
	width: 10px;
	margin-right: 5px;
	background: rgba(128, 128, 128, 0.5);
}

#buttons .on {
	background: black;
	opacity: 60%;
}

.arrow {
	margin-top: 100px;
	display: none;
	line-height: 40px;
	text-align: center;
	font-size: 30px;
	width: 40px;
	height: 40px;
	position: absolute;
	z-index: 2;
	top: 140px;
	color: white;
	background: rgba(255, 255, 255, 0.5);
}

#screenBox:hover .arrow {
	display: block;
}

#header {
	background-color: black;
	height: 10px;
}

.copyright-1 .container .row-copyrights, .copyright-2 .container .row-copyrights,
	.copyright-3 .container .row-copyrights, .copyright .container .row-copyrights
	{
	padding-top: 20px;
	padding-bottom: 15px;
	margin-left: 170px;
	color: white;
}

#labelStyle {
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	color: white;
	font-size: 20px;
	font-weight: bold;
}
</style>



</head>
<body>

	<header class="header">

		<a href="#" class="logo"> <img src="uploaded/dice_logo.png" alt="">
		</a>


		<nav class="navbar">

			<a href="../homepage">首頁</a> 
			<a href="#about">最新消息</a>
			<a href="#menu">會員招募</a>
			<a href="#products">店鋪資訊</a> 
			<a href="${contextRoot}/viewProductsnologin">商品</a> 
			<a href="${contextRoot}/startOrder">點餐</a> 
			<a href="${contextRoot}/groups/ChooseDate">開團</a> 

			<a href="${contextRoot}/addBooking">訂位</a>
			
			
			

		
			



			<li class="nav-item"><c:if test="${member.ratingsBean.id == 3 }">
			
			
					<a href="${contextRoot}/customerService">線上客服</a>
				</c:if> <c:if test="${member.ratingsBean.id == 1 }">
					<a href="${contextRoot}/backController">後台管理</a>
				</c:if>
		</nav>
<nav class="navbar">
			<c:if test="${member.ratingsBean.id == null }">
				<div style="display: flex">
					<a class="" href="${contextRoot}/addCustomer">註冊 </a>
				</div>
				<div style="display: flex">
					<a class="" href="${contextRoot}/login">登入 </a>
				</div>
			</c:if>

			<c:if test="${member.ratingsBean.id != null }">
				<div style="display: flex">
					<span>${member.cusName}，您好</span> <a class="nav-link"
						href="${contextRoot}/logout">登出 </a>
				</div>
			</c:if>
</nav>


		<div class="icons" style="display: flex">
			<div class="fas fa-search" id="search-btn"></div>
			<div class="fas fa-shopping-cart" id="cart-btn"></div>

		</div>



		<div class="search-form">
			<input type="search" id="search-box" placeholder="search here...">
			<label for="search-box" class="fas fa-search"></label>
		</div>

		<div class="cart-items-container">
			<div class="cart-item">
				<span class="fas fa-times"></span> <img src="images/cart-item-1.png"
					alt="">
				<div class="content">
					<h3>cart item 01</h3>
					<div class="price">$15.99/-</div>
				</div>
			</div>
			<div class="cart-item">
				<span class="fas fa-times"></span> <img src="images/cart-item-2.png"
					alt="">
				<div class="content">
					<h3>cart item 02</h3>
					<div class="price">$15.99/-</div>
				</div>
			</div>
			<div class="cart-item">
				<span class="fas fa-times"></span> <img src="images/cart-item-3.png"
					alt="">
				<div class="content">
					<h3>cart item 03</h3>
					<div class="price">$15.99/-</div>
				</div>
			</div>
			<div class="cart-item">
				<span class="fas fa-times"></span> <img src="images/cart-item-4.png"
					alt="">
				<div class="content">
					<h3>cart item 04</h3>
					<div class="price">$15.99/-</div>
				</div>
			</div>
			<a href="#" class="btn">checkout now</a>
		</div>

	</header>
	
	
	
	
	
	
	
	
	
<!-- 	<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> -->
<!--   <a class="navbar-brand" href="#">Navbar</a> -->
<!--   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> -->
<!--     <span class="navbar-toggler-icon"></span> -->
<!--   </button> -->

<!--   <div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!--     <ul class="navbar-nav mr-auto"> -->
<!--       <li class="nav-item active"> -->
<!--         <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link" href="#">Link</a> -->
<!--       </li> -->
<!--       <li class="nav-item dropdown"> -->
<!--         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false"> -->
<!--           Dropdown -->
<!--         </a> -->
<!--         <div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!--           <a class="dropdown-item" href="#">Action</a> -->
<!--           <a class="dropdown-item" href="#">Another action</a> -->
<!--           <div class="dropdown-divider"></div> -->
<!--           <a class="dropdown-item" href="#">Something else here</a> -->
<!--         </div> -->
<!--       </li> -->
<!--       <li class="nav-item"> -->
<!--         <a class="nav-link disabled">Disabled</a> -->
<!--       </li> -->
<!--     </ul> -->
<!--     <form class="form-inline my-2 my-lg-0"> -->
<!--       <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"> -->
<!--       <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
<!--     </form> -->
<!--   </div> -->
<!-- </nav> -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>