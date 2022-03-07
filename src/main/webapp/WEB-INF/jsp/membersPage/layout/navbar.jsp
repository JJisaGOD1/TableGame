<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

<title>layout </title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="${contextRoot}/">Home <span class="sr-only">(current)</span></a>
      </li>
      <c:if test="${member.ratingsBean.id == null }">
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/login">登入</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/addCustomer">加入會員</a>
      </li>
      </c:if>
      
      <c:if test="${member.ratingsBean.id == 3 }"> 
       <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/customerEditSelf">編輯基本資料</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/customerView">查看基本資料</a>
      </li>
      </c:if>
      
      <c:if test="${member.ratingsBean.id == 1 || member.ratingsBean.id == 2}">
       <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/viewCustomer/1">查看所有會員</a>
      </li>
      </c:if>
      <c:if test="${member.ratingsBean.id == 1 }">
	      <li class="nav-item">
	        <a class="nav-link" href="${contextRoot}/viewMembers/1">查看所有員工</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="${contextRoot}/addManager">增加主管員工</a>
	      </li>
      </c:if>
      
      <c:if test="${member.ratingsBean.id != null }">
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/logout">登出</a>
      </li>
      </c:if>
      
      <li class="nav-item">
        <a class="nav-link" >qqq</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled">${contextRoot}/</a>
      </li>
    </ul>
  </div>
</nav>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>