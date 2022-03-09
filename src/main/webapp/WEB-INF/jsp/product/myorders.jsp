<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />

<!DOCTYPE html>
<html>
<head>
<link href="${contextRoot}/css/forProductPage.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">
			<table class="table">
				<thead class="table table-dark">
					<tr>
						<th>訂單編號</th>
						<th>顧客Id</th>
						<th>顧客名</th>
						<th>訂單總金額</th>
						<th>處理狀態</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="P" items="${P.content}">
						<tr>
							<th scope="row"><c:out value="${P.orderId}" />
							<td><c:out value="${P.member.id}" />
							<td><c:out value="${P.member.cusName}" />
							<td><c:out value="${P.totalprice}" />
							<td><c:out value="${P.processingstatus}" />
							<td><a
								href="${contextRoot}/products/coustomercheckPackage?id=${P.orderId}"><input
									type="button" value="確認訂單"></a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row justify-content-center">
			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${P.totalPages}">

					<c:choose>
						<c:when test="${pageNumber-1==P.number}">
							<!--page.number:取的當前頁面的頁碼-->
							<c:out value="${pageNumber}" />
						</c:when>
						<c:otherwise>
							<a href="${contextRoot}/products/myorders?p=${pageNumber}"><c:out
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
	</div>
</body>
<script>
	
</script>
</html>