<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container" align="center">
		<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">點餐列表</h1>
		<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">點餐編號</th>
				<th scope="col">桌號</th>
				<th scope="col">人數</th>
				<th scope="col">日期</th>
				<th scope="col">總計</th>
				<th scope="col">訂單狀態</th>
				<th scope="col">付款狀態</th>
				<th scope="col"></th>
<!-- 				<th scope="col"> </th> -->
			</tr>
		</thead>
					<c:forEach items="${orderPage.content}" var="order">
					
						<tr scope="row">
<%-- 						<td><fmt:formatDate value="${order.orderDate} pattern="yyyy-MM-dd HH:mm:ss" var="date"></fmt:formatDate></td> --%>
							<td><c:out value="${order.orderId}" /></td>
							<td><c:out value="${order.tableNum}" /></td>
							<td><c:out value="${order.peopleNum}" /></td>
							<td><c:out value="${order.orderDate}" /></td>
							<td><c:out value="${order.totalprice}" /></td>
							<td><c:out value="${order.processState}" /></td>
							<td><c:out value="${order.paymentState}" /></td>
							
							<td>
							<a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteOrder?orderId=${order.orderId}"><input type="button" value="刪除"></a>

							<a href="${contextRoot}/editOrder?orderId=${order.orderId}"><input type="button" value="修改"></a>
							
							</td>
						
						</tr>
						
					</c:forEach>
		</table>

		<script>
			function del() {
				if (confirm("確實要刪除嗎？")) {
					alert("已經刪除！");
				} else {
					alert("已經取消了刪除操作");
				}

			}
		</script>

<%-- 		<h3>共${page.size()}筆食物資料</h3> --%>
<!-- 				size():Collection Object (ArrayList, Set, etc) — 取得集合物件相關大小 -->

<a href="m10/HomePage.html"><input type="button" value="回首頁" class="myButton"></a> 
			<!--新增按鈕 -->
			<a href="${contextRoot}/addFood"><input type="button" value="新增" class="myButton"></a>			
<!-- ==========================================顯示頁數========================================== -->
			<div class="row justify-content-center">
			<div class="col-9">
			
				<c:forEach var="pageNumber" begin="1" end="${orderPage.totalPages}">

					<c:choose>
						<c:when test="${orderPage.number != pageNumber -1}">

							
							<a href="${contextRoot}/orderList?p=${pageNumber}"><c:out
									value="${pageNumber}" /> </a>
						</c:when>

						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>

					<c:if test="${pageNumber != orderPage.totalPages}">
			|
			</c:if>

				</c:forEach>
			</div>
		</div>
		
<nav aria-label="Page navigation" class="text-center">

    <ul class="pagination" id="page">

    </ul>

</nav>

		


</div>


</body>
</html>