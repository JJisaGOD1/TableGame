<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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
	.card{
		max-width: 26rem;
    	font-size: 150%;
	}
	.btn{
		font-size: 2rem;
	}

	.swal2-popup {
	font-size: 1.5rem !important;

	}
</style>
	

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<meta charset="UTF-8">
<title>TheDateStateView</title>

</head>
<body>
	<div class="body"></div>

	<!-- <a href="${contextRoot}">回登入頁</a> -->
	
	<div align="center" style="margin-top: 7rem;">
		<h1>您選擇的遊玩日期:${date}</h1>
		<br>
		<c:choose>
			<c:when test="${groups[0]==null}">
				<h3>目前這天還沒有人揪團~~</h3>
			</c:when>
			<c:otherwise>
				<div class="row row-cols-1 row-cols-md-4">
				<c:forEach items="${groups}" var="group">
					<div class="col mb-1">
					<c:choose>
					<c:when test="${member.id!=group.launcher.id&& 
  						oneJoinedGroups[group.groupId]==null&&
  						perGroupNumMap[group.groupId]>=group.product.maxplayer}">  
						<div  class="card text-left border-danger mb-3" >
					</c:when>
					<c:otherwise>
						<div  class="card text-left border-success mb-3" >
					</c:otherwise>
					</c:choose>	 

<!-- 					<div  class="card text-left border-success mb-3" style="max-width: 18rem;">							  -->
						<div class="card-header text-center">團編號：${group.groupId}</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">發起者：${group.launcher.cusName}</li>
								<li class="list-group-item">遊戲：${group.product.product_name}  <a href="http://localhost:8080/homepage/showImformationnologin?id=${group.product.product_id}" target="_blank"> <i class='bx bx-search bx-md'></i> </a> </li>
								<li class="list-group-item">現有人數：${perGroupNumMap[group.groupId]}</li>
								<li class="list-group-item">建團時間：${group.createdTime}</li>
								<li class="list-group-item">簡介：${group.introduction}</li>
								
							</ul>
							<div class="card-body text-center">
								<c:choose>
									<c:when test="${member==null}">
										<span style="color:green;">先登入才可報團</span>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${member.id==group.launcher.id}">
												<%--<a href="servlet?變數1=111&變數2=222"><input type="button" value="修改"></a> --%>
												<span style="color:purple;">您是創團者 </span>
												<span style="color: blue;">您的人數：${oneJoinedNumMap[group.groupId]}</span>
												<p>
													<a class="btn btn-warning"
														href="${contextRoot }/groups/ToUpdateGroupData/${group.groupId}"
														style="font-size: 2rem"
														>修改
													</a>
													
															
													<!-- <a	
														class="btn btn-danger"
														href="${contextRoot }/groups/DeleteGroup/${group.groupId}"
														onclick="return del()"
														>解散
													</a> -->
													</button>

													<button id="deleteGroup"+${group.groupId}
															class="btn btn-danger deleteGroup"
															value=${group.groupId}
															style="font-size: 2rem"
													>解散
													</button>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${oneJoinedGroups[group.groupId]!=null}">
														<span style="color: orange;">您已加入此團</span>
														<span style="color: blue;">您的人數：${oneJoinedNumMap[group.groupId]}</span>
														
															<a	class="btn btn-warning"
																href="${contextRoot }/groups/ToUpdateParticipantData/${group.groupId}"
																style="font-size: 2rem"
																>修改
															</a>
															<!-- <a	class="btn btn-danger"
																href="${contextRoot }/groups/Quit/${group.groupId}"
																onclick="return quit()">退出
															</a> -->
															<button id="quitGroup"+${group.groupId}
															class="btn btn-danger quitGroup"
															value=${group.groupId}
															style="font-size: 2rem"
															>退出
															</button>
															
															
															
														
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when
																test="${perGroupNumMap[group.groupId]<group.product.maxplayer}">
																<a	class="btn btn-primary"
																	href="${contextRoot}/groups/ToJoin/${group.groupId}"
																	style="font-size: 2rem"
																	>我要加入
																</a>
															</c:when>
															<c:otherwise>
																<span style="color: red;">此團目前滿人</span>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
					</div>
					</div>
				</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		<%-- <a href="${contextRoot}/groups/FillNewGroupData" >開新團!</a> --%>
		
		<c:choose>
		<c:when test="${member!=null}">
			<form action="${contextRoot}/groups/FillNewGroupData" method="post">
				<input type="text" value="${date}" name="date" style='display: none'>
				<input type="submit" value="開新團!" class="btn btn-primary" style="font-size: 2rem">
			</form>
		</c:when>
		<c:otherwise>
			<h3>先登入才可創團~~</h3>
		</c:otherwise>
		</c:choose>
	</div>

	

<script>
function del() {
	var msg = "是否解散此團?";
	if (confirm(msg) == true) {
		return true;
	} else {
		return false;
	}
}

$('.deleteGroup').click(function(){
	let groupId=$(this).val()
	Swal.fire({
	title: '確定解散此團?',
	text: "此動作無法復原!",
	icon: 'warning',
	showCancelButton: true,
	cancelButtonColor: '#888888',
	cancelButtonText:'取消',
	confirmButtonColor: '#3085d6',
	confirmButtonText: '是，我要解散!'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				type:'get',
				url:'http://localhost:8080/homepage/groups/DeleteGroup/'+groupId,
				cache:false,
				async:false,
				success: function(){
					setTimeout(function(){
						window.location.reload()
					},1000)
				}
			});
			Swal.fire(
			'已解散!',
			'團體已解散.',
			'success'
			)
		}
	})
})

$('.quitGroup').click(function(){
	let groupId=$(this).val()
	Swal.fire({
	title: '確定退出此團?',
	text: "此動作無法復原!",
	icon: 'warning',
	showCancelButton: true,
	cancelButtonColor: '#888888',
	cancelButtonText:'取消',
	confirmButtonColor: '#3085d6',
	confirmButtonText: '是，我要退出!'
	}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				type:'get',
				url:'http://localhost:8080/homepage/groups/Quit/'+groupId,
				cache:false,
				async:false,
				success: function(){
					setTimeout(function(){
						window.location.reload()
					},1000)
				}
			});
			Swal.fire(
			'已退出!',
			'您已退出此團!.',
			'success'
			)
		}
	})
})
		
	

	

function quit() {
	var msg = "是否退出此團?";
	if (confirm(msg) == true) {
		return true;
	} else {
		return false;
	}
}

</script>
</body>
</html>

<!-- <div align="center"> -->
<%-- 		<h1>hi ${member.cusName}, I'm TheDateState.jsp</h1> --%>
<!-- 		<br> -->
<%-- 		<h2>ur choosed date:${date}</h2> --%>
<!-- 		<br> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${groups[0]==null}"> --%>
<!-- 				<h3>目前這天還沒有人揪團~~</h3> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				<c:forEach items="${groups}" var="group"> --%>
<!-- 					<table style="border: 3px solid green; margin-bottom: 10px;"> -->
<!-- 						<tr> -->
<!-- 							<td>團編號：</td> -->
<%-- 							<td>${group.groupId}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>發起者：</td> -->
<%-- 							<td>${group.launcher.cusName}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>遊戲：</td> -->
<%-- 							<td>${group.product.product_name}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>現有人數：</td> -->
<%-- 							<td>${perGroupNumMap[group.groupId]}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>簡介：</td> -->
<%-- 							<td>${group.introduction}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td>建團時間：</td> -->
<%-- 							<td>${group.createdTime}</td> --%>
<!-- 						</tr> -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${member.id==group.launcher.id}"> --%>
<%-- 								<a href="servlet?變數1=111&變數2=222"><input type="button" value="修改"></a> --%>
<!-- 								<tr> -->
<!-- 									<td style="color: purple;">您是創團者</td> -->
<%-- 									<td style="color: blue;">您的人數：${oneJoinedNumMap[group.groupId]}</td> --%>
<!-- 								</tr> -->
<!-- 								<tr> -->
<!-- 									<td><a -->
<%-- 										href="${contextRoot }/groups/ToUpdateGroupData/${group.groupId}"> --%>
<!-- 											<input type="button" value="修改"> -->
<%-- 									</a> <a href="${contextRoot }/groups/DeleteGroup/${group.groupId}" --%>
<!-- 										onclick="return del()"> <input type="button" value="解散!"> -->
<!-- 									</a></td> -->
<!-- 								</tr> -->
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${oneJoinedGroups[group.groupId]!=null}"> --%>
<!-- 										<tr> -->
<!-- 											<td style="color: orange;">您已加入此團</td> -->
<%-- 											<td style="color: blue;">您的人數：${oneJoinedNumMap[group.groupId]}</td> --%>
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td><a -->
<%-- 												href="${contextRoot }/groups/ToUpdateParticipantData/${group.groupId}"> --%>
<!-- 													<input type="button" value="修改"> -->
<!-- 											</a></td> -->
<!-- 											<td><a -->
<%-- 												href="${contextRoot }/groups/Quit/${group.groupId}" --%>
<!-- 												onclick="return quit()"> <input type="button" value="退出"> -->
<!-- 											</a></td> -->
<!-- 										</tr> -->
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 										<c:choose> --%>
<%-- 											<c:when --%>
<%-- 												test="${perGroupNumMap[group.groupId]<group.product.maxplayer}"> --%>
<!-- 												<tr> -->
<!-- 													<td><a -->
<%-- 														href="${contextRoot}/groups/ToJoin/${group.groupId}"> --%>
<!-- 															<input type="button" value="我要加入"> -->
<!-- 													</a></td> -->
<!-- 												</tr> -->
<%-- 											</c:when> --%>
<%-- 											<c:otherwise> --%>
<!-- 												<tr> -->
<!-- 													<td style="color: red;">此團目前滿人</td> -->
<!-- 												</tr> -->
<%-- 											</c:otherwise> --%>
<%-- 										</c:choose> --%>
<%-- 									</c:otherwise> --%>
<%-- 								</c:choose> --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
<!-- 					</table> -->
<%-- 				</c:forEach> --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<%-- 		<%-- <a href="${contextRoot}/groups/FillNewGroupData">開新團!</a> --%> 
<%-- 		<form action="${contextRoot}/groups/FillNewGroupData" method="post"> --%>
<%-- 			<input type="text" value="${date}" name="date" style='display: none'> --%>
<!-- 			<input type="submit" value="開新團!"> -->
<!-- 		</form> -->
<!-- 	</div> -->