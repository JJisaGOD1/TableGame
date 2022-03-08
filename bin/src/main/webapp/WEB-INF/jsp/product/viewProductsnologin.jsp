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
						<th>編號</th>
						<th>名稱</th>
						<th>價錢</th>
						<th>類型</th>
						<th>圖片</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="P" items="${P.content}">
						<c:choose>
							<c:when test="${P.sellstatus=='上架中'&&P.stock>10}">
								<tr>
									<th scope="row"><c:out value="${P.product_id}" />
									<td><c:out value="${P.product_name}" />
									<td><c:out value="${P.price}" />
									<td><c:out value="${P.gametype}" />
									<td><img src="<c:url value='/Photo/${P.photourl}'/>"
										style="height: 100px" name="${P.photourl}" id="${P.photourl}" />
									<td><a
										href="${contextRoot}/showImformationnologin?id=${P.product_id}"><input
											type="button" value="檢視相關資料"></a>
								</tr>
							</c:when>
						</c:choose>
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

	</div>
</body>
<script>
	
</script>
</html>