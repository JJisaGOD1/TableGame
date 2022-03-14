<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<style>


</style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">留言相關</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
<!--       <li class="nav-item active"> -->
<%--         <a class="nav-link" href="${contextRoot}/index">Home <span class="sr-only">(current)</span></a> --%>
<!--       </li> -->
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/nameComments/1">依照姓名查留言</a>
      </li>
 
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/addComment">增加留言</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/viewComments">查看留言</a>
      </li>
           
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/customerService/">客戶線上課服</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="${contextRoot}/serverService/">伺服線上課服</a>
      </li>
      
    </ul>
  </div>
</nav>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
</body>
</html>