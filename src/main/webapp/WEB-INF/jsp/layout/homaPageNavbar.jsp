<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<link rel="shortcut icon" href="src/main/resources/favicon.ico">
<link rel="icon" type="image/x-icon" href="${contextRoot}/uploaded/favicon.ico" />
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- Boxicons CDN Link -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>

<meta charset="UTF-8">

<title>憶起玩桌遊</title>


<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="${contextRoot}/css/style.css">

<%-- <link href="${contextRoot}/css/homePage.css" rel="stylesheet"> --%>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextRoot}/js/bootstrap.bundle.min.js" rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

h1 {
	/* 	text-align: center; */
	
}

/* #screenBox { */
/* 	margin: 20px auto; */
/* 	width: 1745px; */
/* 	height: 70rem; */
/* 	/* border1: 3px solid grey; */
* /
	/* 	overflow: hidden; */
	/* 	position: relative; */
	/* 	background-color: blue; */
	/* } */
	/* #movedot { */
	/* 	margin: 0px auto; */
	/* 	width: 1200px; */
	/* 	height: 30px; */
	/* 	/* border: 3px solid grey; */ * /
	/* 	/* overflow: hidden; */ * /
	/* 	position: relative; */
	/* } */
	/* #list { */
	/* 	width: 8725px; */
	/* 	height: 550px; */
	/* 	position: absolute; */
	/* 	z-index: 1; */
	/* } */
	/* #list img { */
	/* 	float: left; */
	/* 	width: 1745px; */
	/* 	height: 70rem; */
	/* } */
	/* #buttons { */
	/* 	position: absolute; */
	/* 	height: 10px; */
	/* 	width: 100px; */
	/* 	z-index: 2; */
	/* 	bottom: 20px; */
	/* 	right: 540px; */
	/* } */
	/* #buttons span { */
	/* 	float: left; */
	/* 	border: 1px solid white; */
	/* 	border-radius: 50%; */
	/* 	height: 10px; */
	/* 	width: 10px; */
	/* 	margin-right: 5px; */
	/* 	background: rgba(128, 128, 128, 0.5); */
	/* } */
	/* #buttons .on { */
	/* 	background: black; */
	/* 	opacity: 60%; */
	/* } */
	/* .arrow { */
	/* 	margin-top: 100px; */
	/* 	display: none; */
	/* 	line-height: 40px; */
	/* 	text-align: center; */
	/* 	font-size: 30px; */
	/* 	width: 40px; */
	/* 	height: 40px; */
	/* 	position: absolute; */
	/* 	z-index: 2; */
	/* 	top: 140px; */
	/* 	color: white; */
	/* 	background: rgba(255, 255, 255, 0.5); */
	/* } */
	/* #screenBox:hover .arrow { */
	/* 	display: block; */
	/* } */      

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

.navbar-wrap {
	width: 100vw;
	height: 10rem;
	background-color: white;
	position: relative;
	top: 0vw;
	font-size: 1.5rem;
	min-height: 10rem;
}

.navbar-meals {
	position: relative;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: space-between;
	padding-bottom: 0.5rem;
	padding-top: 2.5rem;
	width: 18vw;
	margin: 0 auto;
	top: 1.5rem;
	width: 26rem;
}

.navbarlogo:hover {
	opacity: 0.5;
	/* background-color: blue; */
}
</style>



</head>
<body>

	<header class="header">

		<a href="${contextRoot}/" class="logo"> <img
			src="${contextRoot}/uploaded/dice_logo.png" alt="">
		</a>


		<nav class="navbar" style="left: 11.5vw;">

			<a href="${contextRoot}/">首頁</a> <a href="#about">最新消息</a> <a
				href="#menu">會員招募</a> 
				
			<c:if test="${member.ratingsBean.id == 3 }">
				<a href="${contextRoot}/customerEditSelf">修改會員資料</a> 
			</c:if>
				<a href="${contextRoot}/viewProductsnologin">商品</a> 
				<a href="${contextRoot}/startOrder">點餐</a> 
				<a href="${contextRoot}/groups/ChooseDate">揪團</a> 
				<a href="${contextRoot}/addBooking">訂位</a>


			<c:if test="${member.ratingsBean.id == 3 }">


				<a href="${contextRoot}/addComment">留言</a>
			</c:if>
			<c:if test="${member.ratingsBean.id == 1 }">
				<a href="${contextRoot}/backController">後台管理</a>
			</c:if>
		</nav>










		<div class="icons" style="position: relative; left: 13rem;">
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

		<nav class="navbar" style="left: 8rem;">
			<c:if test="${member.ratingsBean.id == null }">
				<div style="display: flex">
					<a class="" href="${contextRoot}/addCustomer">註冊 </a>
				</div>
				<div style="display: flex">
					<a class="" href="${contextRoot}/login">登入 </a>
				</div>
			</c:if>
			<div class="icons">
				<c:if test="${member.ratingsBean.id != null }">
					<div style="display: flex">
						<span style="font-size: 2rem">${member.cusName}，您好</span> <a
							onclick="signOut()" href="${contextRoot}/logout" class="nav-link">登出 </a>
					</div>
				</c:if>
			</div>

		</nav>
	</header>





	<div style="width: 100vw; height: 4rem;"></div>



	<script src="https://apis.google.com/js/platform.js" async defer></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad"
		async defer></script>

	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	<script>
		function onLoad() {
			gapi.load('auth2', function() {
				gapi.auth2.init({
					client_id:'533537045577-jdn4qt2elj0o2g51ufi47igj254rpm7v.apps.googleusercontent.com'
					});
			})
		}

		function signOut() {
			var auth2 = gapi.auth2.getAuthInstance();
			auth2.signOut().then(function() {
				console.log('User signed out.');

			});
		}
	</script>
	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
	
</body>
</html>