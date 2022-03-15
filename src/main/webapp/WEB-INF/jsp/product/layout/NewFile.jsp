<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>


<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>

<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<link rel="stylesheet" href="${contextRoot}/css/style.css">


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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="navbar-wrap">
		<nav class="navbar-meals">
			<img alt="" src="${contextRoot}/uploaded/food-menu-solid-24.png">

			<a href="${contextRoot}/viewProductsnologin" class="navbarlogo"><button
					style="background-color: white;">
					<i class='bx bxs-food-menu bx-lg'
						style="display: flex; justify-content: center; color: black;"></i>我們提供的商品
				</button></a>
			<c:if test="${member != null}">
				<a href="${contextRoot}/products/list" class="navbarlogo"><button
						style="background-color: white;">
						<i class='bx bx-list-ul bx-lg'
							style="display: flex; justify-content: center; color: black;"></i>購物區
					</button></a>
				<a href="${contextRoot}/products/myorders" class="navbarlogo"><button
						style="background-color: white;">
						<i class='bx bxs-message-square-check bx-lg'
							style="display: flex; justify-content: center; color: black;"></i>我的訂單
					</button></a>
			</c:if>
		</nav>
	</div>
</body>
</html>