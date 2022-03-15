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
<h1>完成訂單!!請稍後</h1>


<div class="container" align="center">
		<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">訂單明細</h1>
		<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">訂單編號</th>
				<th scope="col">食物名稱</th>
				<th scope="col">價格</th>
				<th scope="col">分類</th>
				<th scope="col">圖片</th>
				<th scope="col">數量</th>
				<th scope="col">小計</th>
				<th scope="col"> </th>
			</tr>
		</thead>
					<c:forEach items="${cart.foodMap}" var="cart">
						<tr scope="row">
							<td><c:out value="${newOrders.orderId}" /></td>
							<td><c:out value="${cart.value.food.foodName}" /></td>
							<td><c:out value="${cart.value.food.foodPrice}" /></td>
							<td><c:out value="${cart.value.food.foodType}" /></td>
							<td><img src="<c:url value="/uploaded/${cart.value.food.foodImage}"/>" style="width: 150px"/></td>
							<td><c:out value="${cart.value.quantity}" /></td>
							<td><c:out value="${cart.value.price}" /></td>
<%-- 							<td><c:out value="${cart.value.food.foodName}" /></td> --%>
<%-- 							<td><c:out value="${cart.value.food.foodPrice}" /></td> --%>
<%-- 							<td><c:out value="${cart.value.food.foodType}" /></td> --%>
<%-- 							<td><img src="<c:url value="/uploaded/${cart.value.food.foodImage}"/>" style="width: 300px"/></td> --%>
<%-- 							<td><c:out value="${cart.value.quantity}" /></td> --%>
<%-- 							<td><c:out value="${cart.value.price}" /></td> --%>	
			
							<td>
<%-- 							<a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteOneFoodItem?foodId=${cart.value.food.foodId}"><input type="button" value="刪除"></a> --%>
<!-- 							<input type="button" value="刪除"> -->
							
						</tr>
						
					</c:forEach>
					
					
		</table>
<%-- 		總計: <c:out value="${C.totalPrices}" /> --%>
<%-- 		<span class="orderId">訂單編號<c:out value="${newOrders.orderId}" /></span> | --%>
<%-- 		<span class="tableNum">第<c:out value="${newOrders.tableNum}" /></span> --%>
<%-- 		<a href="${contextRoot}/checkOrder"><input type="button" value="送出訂單"></a> --%>
		
		
		

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
		<!-- 		size():Collection Object (ArrayList, Set, etc) — 取得集合物件相關大小 -->

		<a href="m10/HomePage.html"><input type="button" value="回首頁" class="myButton"></a> 
			<!-- 			新增按鈕 -->
			<a href="${contextRoot}/menu"><input type="button" value="新增" class="myButton"></a>			
			
		
</div>



</body>
</html>