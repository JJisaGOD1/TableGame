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
<title>Manage View Customer</title>
</head>
<body>
<h1>All Customer</h1>
	<p />
	<div class="container">
		<div class="row justify-content-center">

				<table class="table">		
				<thead class="thead-dark">
					<tr>
						<th scope="col">id</th>
						<th scope="col">會員姓名</th>
						<th scope="col">Email</th>
						<th scope="col">連絡電話</th>
						<th scope="col">地址</th>
						<th scope="col">生日</th>
						<th scope="col">創建時間</th>
						<th scope="col">等級</th>
						<th scope="col" style="text-align: center">改動</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${customers.content}" var="customer">
							<tr>
								<td><c:out value="${customer.id}"/></td>
								<td><c:out value="${customer.cusName}"/></td>
								<td><c:out value="${customer.email}"/></td>
								<td><c:out value="${customer.phone}"/></td>
								<td><c:out value="${customer.address}"/></td>
								<td><c:out value="${customer.birthday}"/></td>
								<td><c:out value="${customer.createdTime}"/></td>
								<td><c:out value="${customer.ratingsBean.rateName}"/></td>
							<td style="text-align: center">
							<a href="${contextRoot}/query">
								<button  type="button" class="btn btn-primary">編輯</button>
							</a>	
								<a href="${contextRoot}/admin/deleteCustomer/${customer.id}" >
									<button type="button" class="btn btn-danger" onclick="return confirm('是否刪除?')">刪除</button>
								</a>
							</td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div style="text-align: right">
				<c:forEach var="pageNumber" begin="1" end="${customers.totalPages}">
					<c:choose>
						<c:when test="${customers.number != pageNumber -1}">
							<a href="${contextRoot}/viewCustomer/${pageNumber}"><c:out value="${pageNumber}" /> </a>
						</c:when>
						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>
					<c:if test="${pageNumber != customers.totalPages}">
						|
					</c:if>
				</c:forEach>
			</div>
		</div>
</body>
</html>