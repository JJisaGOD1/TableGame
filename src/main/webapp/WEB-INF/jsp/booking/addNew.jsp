<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
 <jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html >
<head>
<style>
body{
background-image:url(BookingPhoto/body.jpg);
background-repeat: no-repeat;
background-size: 100%;
}

.t1{ 
  widtth:100px; 
  margin:10px; 
  text-align: right; 
  vertical-align: auto;
  
 } 

fieldset {
	width:500px;
	height:450px;
	margin: 0px auto;
	border-radius: 15px;
	box-shadow: 5px 5px 5px 5px;
	background-color:white;
	font-size: 1.5rem;
}

</style>
<meta charset="UTF-8">
<title>訂位</title>

 <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/themes/hot-sneaks/jquery-ui.css" rel="stylesheet">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js"></script>
  <script type="text/javascript" src="http://tony1966.xyz/test/jquery/jquery.ui.datepicker-zh-TW.js"></script>
 
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat: 'yy/mm/dd',
			minDate : 0,
			maxDate : "14D"
		});

	});
	

	
</script>

</head>
<body>
 
 <!-- 各自的navbar -->
<div class="navbar-wrap">
<nav class="navbar-meals">
<img alt="" src="${contextRoot}/uploaded/food-menu-solid-24.png">

<a href="addNew" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-food-menu bx-lg' style="display: flex; justify-content: center; color: black;"></i>立即訂位</button></a>


<a href="lnquire" class="navbarlogo"><button style="background-color: white;"><i class='bx bx-list-ul bx-lg' style="display: flex; justify-content: center; color: black;"></i>訂位查詢</button></a>

</nav>
</div>
<!-- 各自的navbar(end) -->
 
 
 
      <div align="center" >
		<legend>訂位系統<legend>
		</div >
		<form class="form" method="post" action="${contextRoot}/users"
			modelAttribute="booking">
			<fieldset>
			<div style="display:none">
				<label class="t1"></label><input type="text" name="user" value="${member.id}" readonly="readonly" >
			</div>	
				
				<div class="dropdown-container" style="vertical-align:top;">
				<label class="t1"><i class='bx bxs-user-plus'></i>人數 :</label><select name="several" id="several"  required class="form-control select-area people-select-white" style="padding-top: 0px">
							<option value="" disabled selected>預約人數</option>
							<option value="1">1 人</option>
							<option value="2">2 人</option>
							<option value="3">3 人</option>
							<option value="4">4 人</option>
							<option value="5">5 人</option>
							<option value="6">6 人</option>
							<option value="7">7 人</option>
							<option value="8">8 人</option>
					</select></div>
				<div><p><label class="t1"><i class='bx bx-time-five'></i>訂位日期:</label> <input type="text" id="datepicker"
						name="reservation_date" autocomplete="off" required onchange="time()" class="form-control select-area people-select-white" style="padding-top: 0px"></p>
				</div>		
						<div><label class="t1"><i class='bx bxs-time'></i>時間:</label> <select name="period" id="period" class="form-control select-area people-select-white" style="padding-top: 0px" required onchange="time()">
							<option value="" disabled selected>預約時段</option>
							<option>上午</option>
							<option>下午</option>
							<option>晚上</option>	
							</select>
					</div>		
			
			<div><label class="t1">桌號 :</label> <select name="number" id="number" required class="form-control select-area people-select-white" style="padding-top: 0px">
							<option value="" disabled selected>預約桌號</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>	
							<option value="8">8</option>
					</select>
				</div>	
				</p>
				<div><label class="t1" >備註:</label> <textarea cols="40" rows="1" name="remark" id="remark"></textarea>
				</div>
				
				<div>
							 <input type="submit" class="btn btn-info" value="確定" />
							 <input type="reset"class="btn btn-info" value="清除">
							 <button  type="button"class="btn btn-info" id="button" >一鍵輸入</button>
							 </div>
			</fieldset>
		</form>
<script type="text/javascript">

$("#button").click(function() {
	$("#several").val('7');
// 	$("#datepicker").val('2022/03/25');
	$("#period").val('下午');
	$("#number").val('7');
	$("#remark").val('我要多一張椅子');
	
})


function time() {
		$.ajax({
			url:"http://localhost:8080/homepage/time",
			type:"post",
			contentType : 'application/json; charset=UTF-8',//送出格式
			dataType:"JSON",
			data:JSON.stringify({
					"date":$('#datepicker').val(),
					"period":$('#period').val()
				}),
				
			success: function(data) {
				$('#number option').r
				
				
				
				
				
				
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