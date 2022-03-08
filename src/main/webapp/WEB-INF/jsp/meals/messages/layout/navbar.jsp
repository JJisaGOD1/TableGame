<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>

</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/orderList">點餐管理</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/foodList">餐點列表</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/addFood">新增餐點</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/menu">菜單</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/goToProductCart">我的訂單</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/finishedOrder">確認訂單</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>