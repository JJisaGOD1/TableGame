<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet">

<meta charset="utf-8">
<title>Insert title here</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div align="center">
	<h1>hi 創團團長 ${member.cusName},您想更改甚麼資訊?</h1>
	<form action="${contextRoot}/groups/UpdateGroupData/${group.groupId}" method="post">
	<div class="card text-left border-dark mb-3" style="width: 22rem;" >
		
			<ul class="list-group list-group-flush"
				style="display: inline-block;">
				<li class="list-group-item">發起人：${member.cusName}</li>
				<li class="list-group-item">目前人數：
					<span id="playersNumNow">${playersNumNow}</span>
				</li>
				<li class="list-group-item">遊戲：<br>
					<select id="selectGame" name="updateProduct"  onchange="changeMaxNums()" > 
						<c:forEach items="${products}" var="product" >
							<c:choose>
							<c:when test="${product.product_id==group.product.product_id}">
								<option id="o${product.product_id}" value="${product.product_id}" selected="selected">${product.product_name}</option>
							</c:when>
							<c:otherwise>
								<option id="o${product.product_id}" value="${product.product_id}" >${product.product_name}</option>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
					<span id="warning" ></span>
				</li>
				
				
				<li class="list-group-item">更改附屬人數(含自己)：
					<select id="selectPlayerNum" name="updateNum"> 
						<c:forEach begin="1" end="${remainingNum}" varStatus="loop">
							<c:choose>
							<c:when test="${loop.count==launcherPlayerNow}">
								<option selected="selected">${loop.count}</option>
							</c:when>
							<c:otherwise>
								<option>${loop.count}</option>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</li>	
				
				<li class="list-group-item">揪團簡介：
				<textarea cols="40" rows="5" id="introduction" name="updateIntroduction">${group.introduction}</textarea>
				</li>
			</ul>
			
			
		
	</div>
	<input class="btn btn-primary" type="submit" value="修改揪團資料!" >
</form>
		
	</div>
<script>
	let originGameId=$('#selectGame').val()
	// let changeGameId

	console.log(originGameId)
	// console.log(`${originGameId}`)
	

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
				let playersNumNow=parseInt(${playersNumNow})
				let launcherPlayerNow=parseInt(${launcherPlayerNow})
				let changeGameId= $('#selectGame').val()
				
								
				if(respData.maxplayer<playersNumNow){
					console.log("set回:"+originGameId)
					$("#selectGame").val(originGameId)
					$('#warning').css('color','red')
					$('#warning').text('人數超過所選遊戲:'+respData.product_name+' 之最大遊玩人數')
					
				}else{
					$('#warning').text('')
					$('#selectPlayerNum option').remove()
					for(let i=1;i<=respData.maxplayer-playersNumNow+launcherPlayerNow;i++){
						let op=document.createElement('option')
						op.value=i
						op.innerHTML=i
						$('#selectPlayerNum').append(op)
					}	
					originGameId=$('#selectGame').val()
					console.log(originGameId)
				}
				
				
			}
	    });
	}
</script>
</body>
</html>

<%-- <form action="${contextRoot}/groups/UpdateGroupData/${group.groupId}" method="post"> --%>
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<td>發起人：</td> -->
<%-- 					<td>${member.cusName}</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<%-- 					<td>目前人數：</td><td><span id="playersNumNow">${playersNumNow}</span></td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>遊戲：</td> -->
<!-- 					<td> -->
<!-- 						<select id="selectGame" name="updateProduct"  onchange="changeMaxNums()" > -->
<%-- 							<c:forEach items="${products}" var="product" > --%>
<%-- 								<c:choose> --%>
<%-- 								<c:when test="${product.product_id==group.product.product_id}"> --%>
<%-- 									<option id="o${product.product_id}" value="${product.product_id}" selected="selected">${product.product_name}</option> --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 									<option id="o${product.product_id}" value="${product.product_id}" >${product.product_name}</option> --%>
<%-- 								</c:otherwise> --%>
<%-- 								</c:choose> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 				<tr><td id="warning" ></td></tr> -->
<!-- 				<tr> -->
<!-- 					<td>更改附屬人數(含自己)：</td> -->
<!-- 					<td> -->
<!-- 						<select id="selectPlayerNum" name="updateNum"> -->
<%-- 						<c:forEach begin="1" end="${remainingNum}" varStatus="loop"> --%>
<%-- 							<c:choose> --%>
<%-- 							<c:when test="${loop.count==launcherPlayerNow}"> --%>
<%-- 								<option selected="selected">${loop.count}</option> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<option>${loop.count}</option> --%>
<%-- 							</c:otherwise> --%>
<%-- 							</c:choose> --%>
<%-- 						</c:forEach> --%>
<!-- 						</select> -->
<!-- 					</td> -->
<!-- 				</tr> -->

<!-- 				<tr> -->
<!-- 					<td></td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 			<label>揪團簡介：</label> -->
<%-- 			<textarea cols="50" rows="5" id="introduction" name="updateIntroduction">${group.introduction}</textarea> --%>
<!-- 			<input type="submit" value="修改揪團資料"> -->
<!-- 		</form> -->