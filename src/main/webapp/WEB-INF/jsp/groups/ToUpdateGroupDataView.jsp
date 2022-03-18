<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- ------導入黑色navbar--------- -->
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>


<!-- ------導入Boxicons--------- -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>

<html>
<head>


<style>
/* <!-- ------導入css到<header>裡面--------- --> */
	.navbar-meals{
	position: relative;
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		justify-content: space-between;
		padding-bottom: 0.5rem;
		padding-top: 2.5rem;
		width: 18vw;
		margin: 0 auto;
	}
	.navbarlogo:hover{
			opacity: 0.5; 
	/* background-color: blue; */
	}

	
	.body{
		background-image: url('${contextRoot}/Photo/groupbackground.png');
		width: 100vw;
		height: 100vh;
		margin:0 0;
		position: fixed;
		top: 0px;
		z-index: -1;
		background-repeat: no-repeat;
		background-size: 100%;
		opacity:0.3;
	}

	.b1{
		font-size: 200%;
	}

	.swal2-popup {
	font-size: 1.5rem !important;

	}
	
</style>



<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body class="b1">
	<div class="body"></div>
	<div align="center" style="margin-top: 7rem;font-size: 2rem;" class="updateInfo">
	<h1>hi 創團團長 ${member.cusName},您想更改甚麼資訊?</h1>
	<form id="updateGroupForm" action="${contextRoot}/groups/UpdateGroupData/${group.groupId}" method="post">
	<div class="card text-left border-dark mb-3" style="width: 32rem;" >
		
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
					<textarea cols="28" rows="5" id="introduction" name="updateIntroduction">${group.introduction}</textarea>
				</li>
			</ul>
			
	</div>
		<!-- <input id="updateGroupData" class="btn" type="submit" value="原始修改!" > -->
</form>
<button id="formBtn" class="btn btn-primary" style="font-size: 2rem;">修改揪團資料!</button>

		
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
						if(i==respData.maxplayer){
							break;	
						}
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

	$('#formBtn').click(function(){
		Swal.fire({
			title: '您想變更這些資訊嗎?',
			showDenyButton: true,
			showCancelButton: true,
			cancelButtonText:'取消',
			confirmButtonText: '儲存變更',
			denyButtonText: `不儲存`,
			
		}).then((result) => {
			if (result.isConfirmed) {
				setTimeout(function(){
					$('#updateGroupForm').submit()	
				},1000)
				Swal.fire('已儲存變更!', '', 'success')
			} else if (result.isDenied) {
				Swal.fire('未變更', '', 'info')
			}
		})
	})
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