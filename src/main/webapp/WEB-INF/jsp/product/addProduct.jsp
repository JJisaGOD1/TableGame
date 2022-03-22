<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/dashboard.jsp" />
<meta charset="UTF-8">
<title>新增商品</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		<p />
		<div class="row justify-content-center">

			<form:form class="form" action="${contextRoot}/products/addProduct"
				modelAttribute="P" method="post">
				<table class="table">
					<thead class="table table-light	">
						<tr>
							<th>編號</th>
							<td><form:input path="product_id" disabled="true" />自動填寫</td>

						</tr>
					</thead>
					<tbody>

						<tr>
							<th>名稱</th>
							<td><form:input path="product_name" /></td>
						</tr>
						<tr>
							<th>價錢</th>
							<td><form:input path="price"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>類型</th>
							<td><form:input path="gametype" /></td>
						</tr>
						<tr>
							<th>最小遊玩人數</th>
							<td><form:input path="minplayer"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>最大遊玩人數</th>
							<td><form:input path="maxplayer"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>最適年齡</th>
							<td><form:input path="low_age"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>庫存</th>
							<td><form:input path="stock"
									oninput="value=value.replace(/[^\d]/g,'')" /></td>
						</tr>
						<tr>
							<th>上下架</th>
							<td><form:select path="sellstatus">狀態
							<form:option value="上架中">上架中</form:option>
									<form:option value="下架中">下架中</form:option>
								</form:select></td>
							<form:input path="photourl" type="hidden" />
						</tr>
						<tr>
							<th>介紹文</th>
							<td><form:textarea path="productintroduce"
									style="width: 300px;height: 200px;" />
						</tr>
					</tbody>
				</table>
				<input type="button" class="oneEnter" value="一鍵輸入新遊戲"/>
				<input type="submit" name="submit" />
			</form:form>
		</div>
	</div>
</body>
<script>
	$("form").submit(function() {
		let maxplayer = $(this).parent().find('#maxplayer').val();
		let minplayer = $(this).parent().find('#minplayer').val();
		let stock=$(this).parent().find('#stock').val();
		if (minplayer >= maxplayer) {
			window.alert('最大人數須大於最小人數');
			return false;
		}
		if (parseInt(stock)<=20){
			window.alert('庫存小於20，將自動下架');
		}
		return true;
	});
	
	$(".oneEnter").click(function() {
	$("#product_name").val("閃靈快手");
	$("#price").val(690);
	$("#gametype").val("派對");
	$("#minplayer").val(2);
	$("#maxplayer").val(5);
	$("#low_age").val(8);
	$("#stock").val(50);
	$("#sellstatus").val("上架中");
	$("#productintroduce").val("幽靈巴頓在城堡的地下室發現1個老相機。他立刻拿起相機四處拍他想要變不見的東西，當然也包括他自己囉。"+
			"但很可惜的是那個魔法相機照出來的顏色都是錯的。有時候會把綠色的瓶子照成白色，又有時候會照成藍色。"+
			"巴頓看著那些奇怪顏色的照片，記憶不起來他想要變不見的東西。"+
			"你能在他離開前，幫他說出正確的名稱，甚至親手把他變不見嗎？"+
			"如果你能快速地抓走正確的東西，你就有機會獲勝……"+
			"只要物品顏色出現完全相同或完全不同時，都要立即搶物！");
	
	});
</script>
</html>