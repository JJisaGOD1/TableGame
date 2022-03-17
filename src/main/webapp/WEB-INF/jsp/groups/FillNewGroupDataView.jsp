<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<meta charset="UTF-8">
<title>FillNewGroupDataView</title>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> -->

</head>
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
<body class="b1">
<div class="body"></div>
<div align="center" style="margin-top: 7rem;"> 	
<h2>您選擇的揪團日期：${date}</h2>
<form id="createGroupForm" action="InsertNewGroup" method="post">
	<div class="card text-left border-dark mb-3" style="width: 43rem;" >
		
			<ul class="list-group list-group-flush"
				style="display: inline-block;">
				<li class="list-group-item">發起人：${member.cusName}</li>
				<li class="list-group-item">遊戲：
					<select id="selectGame"name="product" onchange="changeMaxNums()">
							<c:forEach items="${products}" var="product">
								<option value="${product.product_id}">${product.product_name}</option>
							</c:forEach>
					</select>
				</li>
	
				<li class="list-group-item">目前人數(含自己): 
					<select id="selectPlayerNum" name="playersNumWithLauncher">
							<c:forEach begin="1" end="${products[0].maxplayer-1}" varStatus="loop">
								<option>${loop.count}</option>
							</c:forEach>
					</select>
				</li>
				<li class="list-group-item">揪團簡介：
				<textarea cols="40" rows="5" id="introduction" name="introduction" ></textarea>
				</li>
			</ul>
			
		
	</div>
	<!-- <input class="btn btn-primary" type="submit" value="開團!" onclick="return create()"> -->
</form>
<button id="formBtn" class="btn btn-primary" style="font-size: 2rem;">開團!</button>
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
				console.log(respData.maxplayer)
				$('#selectPlayerNum option').remove()
				for(let i=1;i<respData.maxplayer;i++){
					let op=document.createElement('option')
					op.value=i
					op.innerHTML=i
					$('#selectPlayerNum').append(op)
				}
			},
			error: function(){
				console.log('something wrong')
        	}
	    });
	}

	function create() {
		var msg = "是否建團?";
		if (confirm(msg) == true) {
			Swal.fire({
			position: 'center',
			icon: 'success',
			title: '建團成功!',
			showConfirmButton: false,
			timer: 1500
			})
			return true;
		} else {
			return false;
		}
	}

	$('#formBtn').click(function(){
		Swal.fire({
			title: '確定建團嗎?',
			showDenyButton: true,
			showCancelButton: true,
			cancelButtonText:'取消',
			confirmButtonText: '我要建團!',
			denyButtonText: `再想想`,
			
		}).then((result) => {
			if (result.isConfirmed) {
				setTimeout(function(){
					$('#createGroupForm').submit()	
				},1000)
				Swal.fire('團房創立成功!', '', 'success')
			} else if (result.isDenied) {
				Swal.fire('未建團', '', 'info')
			}
		})
	})

	
</script>
</body>

</html>

<!-- <div align="center" > -->
<%-- 	<h1>hi ${member.cusName}</h1> --%>
<%-- 	<h2>您選擇的揪團日期：${date}</h2> --%>
<!-- 	<form action="InsertNewGroup" method="post" > -->
<!-- 		<table> -->
<%-- 			<tr><td><input type="text" style='display:none' value="${date}" name="date"></td></tr> --%>
<%-- 			<tr><td>發起人：</td><td><input type="text" readonly="readonly" value="${member.cusName}"></td></tr> --%>
<!-- 			<tr><td> -->
<!-- 			<tr> -->
<!-- 				<td>遊戲：</td> -->
<!-- 				<td> -->
<!-- 					<select id="selectGame" name="product" onchange="changeMaxNums()"> -->
<%-- 						<c:forEach items="${products}" var="product"> --%>
<%-- 							<option value="${product.product_id}">${product.product_name}</option> --%>
<%-- 						</c:forEach> --%>
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>目前人數(含自己)：</td> -->
<!-- 				<td> -->
<!-- 					<select id="selectPlayerNum" name="playersNumWithLauncher" > -->
<%-- 						<c:forEach begin="1" end="${products[0].maxplayer-1}" varStatus="loop"> --%>
<%-- 				 			<option>${loop.count}</option> --%>
<%-- 				 		</c:forEach> --%>
<!-- 					</select> -->
<!-- 				</td> -->
<!-- 			</tr> -->

<!-- 		</table> -->
<!-- 		<label >揪團簡介：</label> -->
<!-- 		<textarea cols="50" rows="5" id="introduction" name="introduction" ></textarea> -->
<!-- 		<input type="submit" value="開團!"> -->
<!-- 	</form>  -->
<!-- </div> -->

<!-- 		console.log($('#selectGame').val()) -->
<!-- 		let data1=JSON.stringify({ -->
<!-- 					"productId":$('#selectGame').val() -->
<!-- 				}); -->
<!-- 		console.log(data1) -->