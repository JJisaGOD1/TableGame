<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../layout/dashboard.jsp"></jsp:include>

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

<meta charset="UTF-8">
<title>員工資料</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<%-- <link href="${contextRoot}/DataTables/datatables.min.css" rel="stylesheet" type="text/css" /> --%>

<script language="javascript">
	function delcfm() {
		if (!confirm("確認要删除？")) {
			window.event.returnValue = false;
			alert("已經取消了刪除操作");
		} else
			alert("已經刪除");
	}
</script>
<style>

body {
  font-family: "Open Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", Helvetica, Arial, sans-serif; 
}

</style>

</head>
<body>

<!-- 	加號按鈕 -->
<button type="button" class="btn btn-success"
			data-toggle="modal" data-target="#exampleModals"><img alt=""
		src="${contextRoot}/uploaded/pngwing.com.png"
		style="width: 4vw; position: fixed; right: 60px; top: 110px; z-index: 999"></button>

	<!-- <div class="col-sm-10 justify-content-center row" id="bsdiv" -->
	<!--   style="margin: 0; padding: 0"> -->
	<div style="width: 76vw; position: relative; top: 20vh; left: 20vw;">



		<table id="table_id" class="display">

			<thead>
				<tr>
					<th hidden="true">會員</th>
					<th>訂單</th>
					<th>姓名</th>
					<th>電話</th>
					<th>人數</th>
					<th>訂位日期</th>
					<th>時段</th>
					<th>桌號</th>
					<th>備註</th>
					<th>工具</th>
									
		
					
				</tr>
			</thead>
			<c:forEach items="${page}" var="bookings">

				<tr>
					<td class="orderId">${bookings.orderId}
					<td hidden="true" class="userid">${bookings.user.id}
					<td class="cusName">${bookings.user.cusName }
					<td class="phone">${bookings.user.phone}
					<td class="sal">${bookings.several}
					<td class="date"><fmt:formatDate pattern="yyyy/MM/dd EEEE"
						value="${bookings.reservation_date}" />
					<td class="period">${bookings.period}
					<td class="number">${bookings.number}
					<td class="remark">${bookings.remark}
					<td>
<!-- 					 <a onclick="return confirm('確認刪除')" -->
<%-- 						href="${contextRoot}/deletbooking?id=${bookings.orderId}"> --%>
						<button
								type="button" id="deleteid"+${bookings.orderId} class="btn btn-danger deleteid" value=${bookings.orderId}>刪除</button></a>
								
						<button type="button" class="btn btn-success editCCC"
							data-toggle="modal" data-target="#add">編輯</button>

					</td>
					
			</c:forEach>
		</table>





		<!-- <div class="row justify-content-center"> -->
		<!--        <div class="col-9"> -->

		<%--        <c:forEach var="pageNumber" begin="1" end="${page.totalPages}"> --%>

		<%--        <c:choose> --%>

		<%--        <c:when test="${page.number !=pageNumber -1 }"> --%>
		<%--        <a href="${contextRoot}/getAll?p=${pageNumber}"><c:out value="${pageNumber}"/> </a> --%>
		<%--       </c:when> --%>

		<%--       <c:otherwise> --%>
		<%--       <c:out value="${pageNumber}"/> --%>
		<%--       </c:otherwise> --%>

		<%--        </c:choose> --%>
		<%--        <c:if test="${pageNumber != page.totalPages}"> | </c:if> --%>

		<%--        </c:forEach> --%>

		<!-- </div> -->
		<!-- </div> -->
	</div>


	<div class="modal fade" id="add" tabindex="-1"
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
					<form class="form" method="post"
						action="${contextRoot}/editbooking" modelAttribute="booking">
						<fieldset>
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
								<label class="t1">電話:</label><input type="text" name="phone"
									readonly="true"
									class="form-control select-area people-select-white phones"
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
									<label class="t1"><i class='bx bx-time-five'></i>訂位日期:</label>
									<input type="text" id="datepicker" name="reservation_date"
										autocomplete="off" required onchange="time()"
										class="form-control select-area people-select-white reservation_date"
										style="padding-top: 0px">
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
							</p>
							<div>
								<label class="t1">備註:</label>
								<textarea cols="40" rows="1" name="remark" id="remark"
								 class="form-control select-area people-select-white remarks "
									style="padding-top: 0px" ></textarea>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">確定</button>
								<input type="reset" class="btn btn-info" value="清除">
								<button type="button" class="btn btn-info" id="button">一鍵輸入</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">取消</button>

							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	<!-- --- -->
	<div class="modal fade" id="exampleModals" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">新增訂位</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!--彈窗內部資料-->
					<form class="form" method="post"
						action="${contextRoot}/userss" modelAttribute="booking">
						<fieldset>
							<div>
								<label class="t1">會員電話:</label><input type="text" name="userphone"
									
									class="form-control select-area people-select-white userphone"
									style="padding-top: 0px">
							</div>

							<div>
								<label class="t1">會員ID:</label><input type="text" name="user"
									
									class="form-control select-area people-select-white user"
									style="padding-top: 0px">
							</div>
							

							<div class="dropdown-container" style="vertical-align: top;">
								<label class="t1"><i class='bx bxs-user-plus'></i>人數 :</label><select
									name="several" id="several" required
									class="form-control select-area people-select-white "
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
									<label class="t1"><i class='bx bx-time-five'></i>訂位日期:</label>
									<input type="text" id="datepickers" name="reservation_date"
										autocomplete="off" required onchange="time()"
										class="form-control select-area people-select-white "
										style="padding-top: 0px">
								</p>
							</div>
							<div>
								<label class="t1"><i class='bx bxs-time'></i>時間:</label> <select
									name="period" id="period"
									class="form-control select-area people-select-white "
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
									class="form-control select-area people-select-white "
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
							</p>
							<div>
								<label class="t1">備註:</label>
								<textarea cols="40" rows="1" name="remark" id="remark"
									class="form-control select-area people-select-white "
									style="padding-top: 0px"></textarea>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary">確定</button>
								<input type="reset" class="btn btn-info" value="清除">
								<button type="button" class="btn btn-info" id="button">一鍵輸入</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">取消</button>

							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
	<%-- <script src="${contextRoot}/DataTables/datatables.min.js" type="text/javascript"></script> --%>
	<script type="text/javascript">
		$(document).ready(function() {
	$('#table_id').DataTable({
	"lengthMenu" : [
			[ 6, 10, 25, 50, -1 ],
			[ 6, 10, 25, 50, "All" ] ],
	"language" : {
		"processing" : "處理中...",
		"loadingRecords" : "載入中...",
		"lengthMenu" : "顯示 _MENU_ 項結果",
		"zeroRecords" : "沒有符合的結果",
		"info" : "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
		"infoEmpty" : "顯示第 0 至 0 項結果，共 0 項",
		"infoFiltered" : "(從 _MAX_ 項結果中過濾)",
		"infoPostFix" : "",
		"search" : "搜尋:",
		"paginate" : {
			"first" : "第一頁",
			"previous" : "上一頁",
			"next" : "下一頁",
			"last" : "最後一頁"
		},
		"aria" : {
			"sortAscending" : ": 升冪排列",
			"sortDescending" : ": 降冪排列"
		}
	}
});
});


$(function() {
	$("#datepicker").datepicker({
		dateFormat : 'yy/mm/dd',
		minDate : 0,
		maxDate : "14D"
	});

});

$(function() {
	$("#datepickers").datepicker({
		dateFormat : 'yy/mm/dd',
		minDate : 0,
		maxDate : "14D"
	});

});

$(".editCCC").click(function() {
	let userid = $(this).parent().parent().find(".userid").html();
	let OderID = $(this).parent().parent().find(".orderId").html();
	let severals = $(this).parent().parent().find(".sal").html();
	let phone = $(this).parent().parent().find(".phone").html();
	let date = $(this).parent().parent().find(".date").html();
	let period = $(this).parent().parent().find(".period").html();
	let number = $(this).parent().parent().find(".number").html();
	let remark = $(this).parent().parent().find(".remark").html();
	console.log(date)
	$(".IDplace").val(userid);
	$(".IDtwo").val(OderID);
	$(".several").val(parseInt(severals));
	$(".reservation_date").val(date);
	$(".phones").val(phone);
	$(".periods").val(period);
	$(".numbers").val(parseInt(number));
	$(".remarks").val(remark);

})

$(".userphone").keyup(function() {

	phone();
})

function phone() {
	let sp=$('.userphone').val();
	$.ajax({
	url:'http://localhost:8080/homepage/phone/'+sp,
	contenType:'application/json; charset=UTF-8',
	dateType:'json',
	method:'get',
		
	success: function (data) {
		
		console.log(data.id)
		$('.user').val(data.id);
		
	}
	})
}

$('.deleteid').click(function(){
	let orderid=$(this).val()
	console.log(orderid)
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
				url:'http://localhost:8080/homepage/deletbooking/'+orderid,
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
})



		// $(document).on('click', '#deleteLocation', function (){  //用一般的.click會有氣泡事件問題
		//   var id = $(this).attr("value");

		//   $.ajax({
		//    type : "get",
		//    url : "http://localhost:8080/oldFoodMan/deleteSchedule?schedule_id="+id,
		//    success : function(data) {
		//     Swal.fire({
		//        title: '確定刪除收藏?',
		//        text: "",
		//        icon: 'warning',
		//        showCancelButton: true,
		//        confirmButtonColor: '#3085d6',
		//        cancelButtonColor: '#d33',
		//        confirmButtonText: 'Yes!'
		//      }).then((result) => {
		//        if (result.isConfirmed) {
		//          Swal.fire({
		//          title:'已刪除 !!',
		//          text:'',
		//          icon:'success'

		//          }).then((result) => {
		//        location.reload();
		//       })

		//        }else{
		//         return ;
		//        }
		//      })

		//    },
		//   });
		//  })
	</script>
</body>
</html>