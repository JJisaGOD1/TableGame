<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FillNewGroupDataView</title>
<script src="${contextRoot}/jQuery/js/jquery-3.6.0.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->

</head>
<body>
<div align="center">
	<h1>hi ${userBean.username}</h1>
	<h2>您選擇的揪團日期：${date}</h2>
	<form action="InsertNewGroup" method="post" >
		<table>
			<tr><td><input type="text" style='display:none' value="${date}" name="date"></td></tr>
			<tr><td>發起人：</td><td><input type="text" readonly="readonly" value="${userBean.username}"></td></tr>
			<tr><td>
			<tr>
				<td>遊戲：</td>
				<td>
					<select id="selectGame" name="product" onchange="changeMaxNums()">
						<c:forEach items="${products}" var="product">
							<option value="${product.productId}">${product.productName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>目前人數(含自己)：</td>
				<td>
					<select id="selectPlayerNum" name="playersNumWithLauncher" >
						<c:forEach begin="1" end="${products[0].maxPlayers-1}" varStatus="loop">
				 			<option>${loop.count}</option>
				 		</c:forEach>
					</select>
				</td>
			</tr>

		</table>
		<label >揪團簡介：</label>
		<textarea cols="50" rows="5" id="introduction" name="introduction" ></textarea>
		<input type="submit" value="開團!">
	</form> 
</div>
<script>
	function changeMaxNums() {
		$.ajax({
			url:"http://localhost:8080/homepage/groups/changeMaxNums",
			type:"post",
			contentType : 'application/json; charset=UTF-8',//送出格式
			dataType:"JSON",
			data:JSON.stringify({
					"productId":$('#selectGame').val()
				}),
			success: function(respData) {
				console.log(respData.maxPlayers)
				$('#selectPlayerNum option').remove()
				for(let i=1;i<respData.maxPlayers;i++){
					let op=document.createElement('option')
					op.value=i
					op.innerHTML=i
					$('#selectPlayerNum').append(op)
				}
			}
	    });
	}
</script>
</body>

</html>

<!-- 		console.log($('#selectGame').val()) -->
<!-- 		let data1=JSON.stringify({ -->
<!-- 					"productId":$('#selectGame').val() -->
<!-- 				}); -->
<!-- 		console.log(data1) -->