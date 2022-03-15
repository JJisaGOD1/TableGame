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
<style type="text/css">
</style>

<link href="${contextRoot}/css/forProductPage.css" rel="stylesheet">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/menu.css" rel="stylesheet" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

img {
	object-fit: scale-down
}
</style>
</head>
<body>
	<div class="wrap" style="width: 60vw; margin: 0 auto">
		<div class="content" style="width: 60vw; padding: 5%">
			<c:forEach items="${P.content}" var="P">
				<c:choose>
					<c:when test="${P.sellstatus=='上架中'&&P.stock>10}">
						<div class="card"
							style="width: 15vw; padding: auto; margin-bottom: 0">
							<div
								style="max-width: 15vw; height: 18vw; display: flex; justify-content: center;">
								<a
									href="${contextRoot}/showImformationnologin?id=${P.product_id}">
									<img src="<c:url value='/Photo/${P.photourl}' />"
									style="width: 15vw; max-height: 18vw; margin-bottom: 0"
									alt="picture of product" class="card-img-top"
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
									href="${contextRoot}/showImformationnologin?id=${P.product_id}"
									class="btn btn-primary">商品詳細資訊</a>
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
		</div>
	</div>
	<div style="position: relative;" align="center">
		<div class="col-9">
			<c:forEach var="pageNumber" begin="1" end="${P.totalPages}">

				<c:choose>
					<c:when test="${pageNumber-1==P.number}">
						<!--page.number:取的當前頁面的頁碼-->
						<c:out value="${pageNumber}" />
					</c:when>
					<c:otherwise>
						<a href="${contextRoot}/viewProductsnologin?p=${pageNumber}"><c:out
								value="${pageNumber}" /> </a>
					</c:otherwise>
				</c:choose>

				<c:if test="${pageNumber != P.totalPages}">
					<!--顯示|的條件:如果是最後一頁，後面就不顯示-->
						|
					</c:if>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	
</script>
</html>