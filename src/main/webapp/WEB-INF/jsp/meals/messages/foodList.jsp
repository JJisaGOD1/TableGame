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
		<h1 style="font-family: Microsoft JhengHei; font-size: 40px; font-weight: bold;">餐點清單</h1>
		<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">食物編號</th>
				<th scope="col">食物名稱</th>
				<th scope="col">價格</th>
				<th scope="col">分類</th>
				<th scope="col">圖片</th>
				<th scope="col">狀態 </th>
				<th scope="col"> </th>
			</tr>
		</thead>
		<tbody id="tablebody">
					<!-- <c:forEach items="${page.content}" var="food">
						<tr scope="row">
							<td><c:out value="${food.foodId}" /></td>
							<td><c:out value="${food.foodName}" /></td>
							<td><c:out value="${food.foodPrice}" /></td>
							<td><c:out value="${food.foodType}" /></td>
							<td><img src="<c:url value="/uploaded/${food.foodImage}"/>" style="width: 150px"/></td>
							<td><c:out value="${food.foodState}" /></td>
							<td>
							<a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteFood?foodId=${food.foodId}"><input type="button" value="刪除"></a>

							<a href="${contextRoot}/editFood?foodId=${food.foodId}"><input type="button" value="修改"></a>
							
							<a href="${contextRoot}/editPic?foodId=${food.foodId}"><input type="button" value="新增圖片"></a>
						
						</tr>
					</c:forEach> -->
				</tbody>
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
		<!-- 		size():Collection Object (ArrayList, Set, etc) — 取得集合物件相關大小 -->

		<a href="m10/HomePage.html"><input type="button" value="回首頁" class="myButton"></a> 
			<!-- 			新增按鈕 -->
			<a href="${contextRoot}/addFood"><input type="button" value="新增" class="myButton"></a>			
			
			<div class="row justify-content-center">
			<div class="col-9">
				<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

					<c:choose>
						<c:when test="${page.number != pageNumber -1}">

							<a href="${contextRoot}/foodList?p=${pageNumber}"><c:out
									value="${pageNumber}" /> </a>
						</c:when>

						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>

					<c:if test="${pageNumber != page.totalPages}">
			|
			</c:if>

				</c:forEach>
			</div>
		</div>
</div>

<script>
	$.ajax({
		url: "${contextRoot}/foodListAjax",
		type: "POST",
		success:function(data){
			var a;
			data.forEach(element => {
				a+="<tr scope='row'>";
					a+="<td>" + element.foodName + "</td>"
					a+="<td>" + element.foodPrice + "</td>"
					a+="<td>" + element.foodType + "</td>"
					a+="<td>" + "<img src='${contextRoot}/uploaded/" + element.foodImage + "' style='width: 150px'/>" + "</td>"
					// a+="<td>" + "<a href='${contextRoot}/deleteFood?foodId=" + element.foodId + " onclick='return confirm("確認刪除?")'"'><input type='button' value='刪除'>" + "</td>"
					a+="<td>" + "<a href='${contextRoot}/editFood?foodId=" + element.foodId + "'><input type='button' value='修改'>" + "</td>"
					a+="<td>" + "<a href='${contextRoot}/editPic?foodId=" + element.foodId + "'><input type='button' value='新增圖片'>" + "</td>"
						a+="</tr>";
					});
			$('#tablebody').append(a);
		}
	})

</script>
						

</body>
</html>