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
</style>

<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet">

<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<div class="body"></div>
	<div align="center" style="margin-top: 7rem">
	
	<h2>揪團日:${date}</h2>
	
	<div class="card text-left border-dark mb-3" style="width: 22rem;" >
	<div class="card-header text-center">團編號：${group.groupId}</div>
		<ul class="list-group list-group-flush"
			style="display: inline-block;">
			<li class="list-group-item">發起人：${member.cusName}</li>
			<li class="list-group-item">遊戲：${group.product.product_name}</li>
			<li class="list-group-item">此遊戲最大人數：${group.product.maxplayer}</li>
			<li class="list-group-item">目前人數：${playersNumNow}</li>
			<li class="list-group-item">簡介：${group.introduction}</li>
		</ul>
	</div>
			
	
		
		<form id="joinForm" action="${contextRoot }/groups/Join" method="post">
			<table>
			<tr><td><input type="text" style="display: none" value="${group.groupId}" name="groupId"></td></tr>
			<tr>
				<td>愈加入人數(含自己)：</td>
				<td>
					<select id="selectPlayerNum" name="joinPlayersNum">
					<c:forEach begin="1" end="${remainingNum}" varStatus="loop">
						<option>${loop.count}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			</table>
			<!-- <input type="submit" value="報團!" class="btn btn-primary"> -->
		</form>
		<button id="formBtn" class="btn btn-primary" style="font-size: 2rem;">報團!</button>
</div>
</body>
<script>
	$('#formBtn').click(function(){
		Swal.fire({
			title: '確定報名嗎?',
			showDenyButton: true,
			showCancelButton: true,
			cancelButtonText:'取消',
			confirmButtonText: '我要加入!',
			denyButtonText: `再想想`,
			
		}).then((result) => {
			if (result.isConfirmed) {
				setTimeout(function(){
					$('#joinForm').submit()	
				},1000)
				Swal.fire('已加入此團!', '', 'success')
			} else if (result.isDenied) {
				Swal.fire('未加入', '', 'info')
			}
		})
	})

</script>
</html>

<!-- <table> -->
<%-- 	<tr><td>團編號：</td><td>${group.groupId}</td></tr> --%>
<%-- 	<tr><td>發起人：</td><td>${group.launcher.cusName}</td></tr> --%>
<%-- 	<tr><td>遊戲：</td><td>${group.product.product_name}</td></tr> --%>
<%-- 	<tr><td>此遊戲最大人數：</td><td>${group.product.maxplayer}</td></tr> --%>
<%-- 	<tr><td>目前人數：</td><td>${playersNumNow}</td></tr> --%>
<!-- </table> -->

<%--
<c:forEach begin="0" end="21" varStatus="loop">
<c:out value="${loop.count}"/>
</c:forEach> 
--%>