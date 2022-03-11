<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html >
<head>
<style>
body{
background-image:url('https://lh3.googleusercontent.com/62SVgyCoKfjqsXk8rZhC9bzH864uN6s-km_2Yee7loq_RddECwY6pgUQEKAYS7XFCpUYXNMueQsBF3vOcKk6YprLLfPILAKpHCyb6OyinkOuWP8U2UCfSigq8QbUYBisr7xWYUYYEh7OnxvUI8hdRmKxSCeEAO5ePzyfEhYARhkqmttDvw_v8QsqCBpyDu-1dE6C1h0vqSEMX6ozNPKgcg3ObfbeNPOAeWcVCkq45pd0fC4rGTqtPZP9kwpyakdUzCrqImTtlxtWfo4xn0tsFuU95eVr8gL-f4DZStvFf9MqmYuGKT9asBLKerM7lomRxacBQYid-QmjW4_LaVxGjTR8SP-GJKJE92INS3fuBXI--Lmv9E6NOEprSbqtxj_0R-1xn-soRAypzH5qqR9M7wzEEmMeJpGRO46OoWqm8QTHFrhafETptL8l8KCQHMFQOnEVlm8XVqLpOqCQr-1cFC49Fd35SYKY82jfioVxDm9mnd_IaYLQNHnuUyvDaUMe5HJ52cfYKeg2bBTgLdoaYJZZ8EO45sUTQENDOJpUuliXtuCMvAS7x6YUiuhWM-VAKgKDTpus-9x_e8_QhlAg44AhwY2OthSrwVamKcnQc8KUp9HoxDDqmZStQXFLRMEDt5jlfiwEnAofbzMOFU3qUferqBdjLZnikCbmrfqPvZMdcj5slUgKKgFmcjRu19EaDXFZDg3KHnkz2U8BohH1sCo=w1200-h800-no?authuser=0');

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
	box-shadow: 5px 5px 5px 5px
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
 
      <div align="center">
		<legend>訂位系統<legend>
		</div>
		<form class="form" method="post" action="${contextRoot}/users"
			modelAttribute="booking">
			<fieldset>
			<div style="display:none">
				<label class="t1"></label><input type="text" name="user" value="${member.id}" readonly="readonly" >
			</div>	
				
				<div class="dropdown-container" style="vertical-align: top">
				<label class="t1">人數 :</label><select name="several" id="several"  required class="form-control select-area people-select-white" style="padding-top: 0px">
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
				<div><p><label class="t1">訂位日期:</label> <input type="text" id="datepicker"
						name="reservation_date" autocomplete="off" required onchange="time()" class="form-control select-area people-select-white" style="padding-top: 0px"></p>
				</div>		
						<div><label class="t1">時間:</label> <select name="period" id="period" class="form-control select-area people-select-white" style="padding-top: 0px" required onchange="time()">
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
							 <button  class="btn btn-info" id="button" >一鍵輸入</button>
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