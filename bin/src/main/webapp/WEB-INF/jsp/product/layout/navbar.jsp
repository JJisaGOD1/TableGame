<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet">


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="nav-link" href="${contextRoot}/">Home <span
			class="sr-only">(current)</span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">

			<ul class="navbar-nav mr-auto">

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false">商品</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="${contextRoot}/viewProductsnologin">我們提供的商品</a>
						<c:if test="${username != null}">
							<c:if test="${username.equals('admin')}">
								<a class="dropdown-item" href="${contextRoot}/viewProducts">查看商品</a>
								<a class="dropdown-item" href="${contextRoot}/addProduct">新增商品</a>
								<a class="dropdown-item" href="${contextRoot}/checkOrders">訂單處理</a>
							</c:if>
							<a class="dropdown-item" href="${contextRoot}/list">購物區</a>
							<a class="dropdown-item" href="${contextRoot}/myorders">我的訂單</a>
						</c:if>
					</div></li>
			</ul>
			<c:if test="${username != null}">
				<form class="form-inline my-2 my-lg-0"
					action="${contextRoot}/searchProduct">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search" aria-label="Search" name="search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
				<a class="nav-link" href="${contextRoot}/logout">登出 </a>
			</c:if>

		</div>
	</nav>


	<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
	<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>