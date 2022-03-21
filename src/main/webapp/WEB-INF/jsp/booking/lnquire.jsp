<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>

<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css"
	rel="stylesheet">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="http://tony1966.xyz/test/jquery/jquery.ui.datepicker-zh-TW.js"></script>

<style>
body {
	background-image: url(BookingPhoto/body.jpg);
	background-size: 100%;
}

table {
	font-family: 微軟正黑體;
	font-size: 15px;
	width: 200px;
	text-align: center;
	border-collapse: collapse;
}

td {
	padding: 4px;
}
</style>


<meta charset="UTF-8">

<title>訂位查詢</title>
</head>
<body>

	<!-- 各自的navbar -->
	<div class="navbar-wrap">
		<nav class="navbar-meals">
			<img alt="" src="${contextRoot}/uploaded/food-menu-solid-24.png">

			<a href="addNew" class="navbarlogo"><button
					style="background-color: white;">
					<i class='bx bxs-food-menu bx-lg'
						style="display: flex; justify-content: center; color: black;"></i>立即訂位
				</button></a> <a href="lnquire" class="navbarlogo"><button
					style="background-color: white;">
					<i class='bx bx-list-ul bx-lg'
						style="display: flex; justify-content: center; color: black;"></i>訂位查詢
				</button></a>


		</nav>
	</div>
	<!-- 各自的navbar(end) -->

	<div id="allpage" align="center">
		<h2>訂位/更改/刪除-查詢</h2>

		<a href="<c:url value='addBooking' />">回前頁</a>

		<tr style="background-color: a8fefa">

			<hr
				style="height: 1px; border: none; color: #333; background-color: #333">

			<section class="container">
				<div class="row">

					<c:forEach items="${lnquire}" var="lnquires">
						<div class="col-sm-6 col-md-4" style="width: 360px; height: 360px">
							<div class="thumbnail"
								style="width: 300px; height: 272px; background-color: #B3D9D9;border-radius: 15px;
								">

								<div >
<!-- style="border: 2px red solid;" -->
									<table>
										<tr>
											<td colspan="2" style="font-size: 18px;">訂位資料</td>
										</tr>
										<tr hidden="true">
											<td>會員ID:</td>
											<td class="userid">${lnquires.user.id}</td>
										</tr>
										
										<tr>
											<td>會員姓名:</td>
											<td class="cusName">${lnquires.user.cusName}</td>
										</tr>
										
										<tr hidden="true">
											<td>訂位ID:</td>
											<td class="orderId">${lnquires.orderId}</td>
										</tr>
										<tr>
											<td>人數:</td>
											<td class="sal">${lnquires.several}</td>
										</tr>
										
										
										<tr>
											<td>訂位日期:</td>
											<td class="date"><fmt:formatDate
													pattern="yyyy/MM/dd "
													value="${lnquires.reservation_date}" /></td>
										</tr>
										<tr>
											<td>時段:</td>
											<td class="period">${lnquires.period}</td>
										</tr>
										<tr>
											<td>桌號:</td>
											<td class="number">${lnquires.number}</td>
										</tr>
										<tr>
											<td>備註:</td>
											<td class="remark">${lnquires.remark}</td>
										</tr>
									</table>

									<input type="button" data-toggle="modal"
										data-target="#exampleModal" value="修改"
										class='btn btn-primary editCCC'> 
										
										<button
										type="button" class='btn btn-info del'>刪除</button>


									</p>

								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">修改訂位</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!--彈窗內部資料-->
					<form class="form" method="post" action="${contextRoot}/member"
						modelAttribute="booking">
						<fieldset style="font-size: 1.5rem;">
							<div hidden="true">
								<label class="t1">會員ID:</label><input type="text" name="user"
									readonly="true"
									class="form-control select-area people-select-white IDplace"
									style="padding-top: 0px">
							</div>

							<div>
								<label class="t1">訂位ID:</label><input type="text" name="orderId"
									readonly="true"
									class="form-control select-area people-select-white IDtwo"
									style="padding-top: 0px">
							</div>
							
							<div>
								<label class="t1">會員姓名:</label><input type="text" name="cusName"
									readonly="true"
									class="form-control select-area people-select-white cusName"
									style="padding-top: 0px">
							</div>

							<div class="dropdown-container" style="vertical-align: top;">
								<label class="t1"><i class='bx bxs-user-plus'></i>人數 :</label><select
									name="several" id="several" required
									class="form-control select-area people-select-white several"
									style="padding-top: 0px">
									<option>預約人數</option>
									<option value="1">1 人</option>
									<option value="2">2 人</option>
									<option value="3">3 人</option>
									<option value="4">4 人</option>
									<option value="5">5 人</option>
									<option value="6">6 人</option>
									<option value="7">7 人</option>
									<option value="8">8 人</option>
									<option value="9">9 人</option>
									<option value="10">10 人</option>
									<option value="11">11 人</option>
									<option value="12">12 人</option>
								</select>
							</div>
							<div>
								<p>
<!-- 								required onchange="time()" -->
									<label class="t1"><i class='bx bx-time-five'></i>訂位日期:</label>
									<input type="text" id="datepicker" name="reservation_date"
										autocomplete="off" 
										class="form-control select-area people-select-white reservation_date"
										readonly="readonly">
								</p>
							</div>
							<div>
								<label class="t1"><i class='bx bxs-time'></i>時間:</label> <select
									name="period" id="period"
									class="form-control select-area people-select-white periods"
									style="padding-top: 0px" required onchange="time()">
									<option value="" disabled selected>預約時段</option>
									<option>上午</option>
									<option>下午</option>
									<option>晚上</option>
								</select>
							</div>

							<div>
								<label class="t1">桌號 :</label> <select name="number" id="number"
									required
									class="form-control select-area people-select-white numbers"
									style="padding-top: 0px">
									<option value="" disabled selected>預約桌號</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						
							<div>
								<label class="t1">備註:</label>
								<textarea cols="40" rows="1" name="remark" id="remark"
									 class="form-control select-area people-select-white remarks "
									style="padding-top: 0px"></textarea>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">確定</button>

								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">取消</button>

							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>
	<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'yy/mm/dd',
			minDate : 0,
			maxDate : "14D"
		});

	});	
	
	
	
	
$(".editCCC").click(function() {
	let userid = $(this).parent().parent().find(".userid").html();
	console.log(userid)
	let cusName=$(this).parent().parent().find(".cusName").html();
	let OderID = $(this).parent().parent().find(".orderId").html();
	let severals = $(this).parent().parent().find(".sal").html();
	let date = $(this).parent().parent().find(".date").html();
	let period = $(this).parent().parent().find(".period").html();
	let number = $(this).parent().parent().find(".number").html();
	let remark = $(this).parent().parent().find(".remark").html();
	console.log(date)
	$(".IDplace").val(userid);
	$(".cusName").val(cusName);
	$(".IDtwo").val(OderID);
	$(".several").val(parseInt(severals));
	$(".reservation_date").val(date);
	$(".periods").val(period);
	$(".numbers").val(number);
	$(".remarks").val(remark);

})








$(".del").click(function() {
	let dat=$(this).parent().parent().find(".date").html();
	let orderid=$(this).parent().parent().find(".orderId").html();
	console.log(orderid)
	var fullDate = new Date();
  var yyyy = fullDate.getFullYear();
  var MM = (fullDate.getMonth() + 1) >= 10 ? (fullDate.getMonth() + 1) : ("0" + (fullDate.getMonth() + 1));
  var dd = fullDate.getDate() < 10 ? ("0"+fullDate.getDate()) : fullDate.getDate();
  var today = yyyy + "/" + MM + "/" + dd+" ";
  console.log(dat)
  console.log(today)
  console.log(dat==today)
	if(dat==today){
		console.log("same")
		Swal.fire({
			  icon: 'error',
			  title: '當天訂位無法刪除，請聯絡線上客服',
			  showConfirmButton: false,
			  timer: 3000
			})
	
	}else{
		Swal.fire({
			  title: '你確定嗎？',
			  text: "您將無法還原此內容！",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: '取消',
			  confirmButtonText: '是的，刪除它！'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
						type:'get',
						url:'http://localhost:8080/homepage/deletbookings/'+orderid,
						cache:false,
						async:false,
						success: function(){
							setTimeout(function(){
								window.location.reload()
							},1000)
						}
					});
					Swal.fire(
					'已刪除！',
					'此筆訂位已被刪除。',
					'success'
					)
				}
			})
	}
	

	
})





// $('.deleteid').click(function(){
// 	let orderid=$(this).val()
// 	console.log(orderid)
	
// 	let dat=$(this).parent().parent().find(".date").html();

// 	var fullDate = new Date();
//   var yyyy = fullDate.getFullYear();
//   var MM = (fullDate.getMonth() + 1) >= 10 ? (fullDate.getMonth() + 1) : ("0" + (fullDate.getMonth() + 1));
//   var dd = fullDate.getDate() < 10 ? ("0"+fullDate.getDate()) : fullDate.getDate();
//   var today = yyyy + "/" + MM + "/" + dd+" ";
//   console.log(dat)
//   console.log(today)
//   console.log(dat==today)
// 	if(dat==today){
// 		console.log("same")
// 		Swal.fire({
// 			  icon: 'error',
// 			  title: '當天訂位無法刪除，請聯絡線上客服',
// 			  showConfirmButton: false,
// 			  timer: 3000
// 			})
	
// 			}
// 		})
		
</script>





</body>
</html>