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
.t1{ 
  widtth:100px; 
  margin:10px; 
  text-align: right; 
  vertical-align: auto;
  
 } 

fieldset {
	width:600px;
	height:350px;
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
				<label class="t1"></label><input type="text" name="user" value="${login.customer_id}" readonly="readonly" >
			</div>	
				
				<div>
				<label class="t1">人數 :</label><select name="several" required>
							
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
					</select></div>
				<div><label class="t1">訂位日期:</label> <input type="text" id="datepicker"
						name="reservation_date" autocomplete="off" required>
				</div>		
						<div><label class="t1">時間:</label> <select name="period" required>
							<option>時段</option>
							<option>上午</option>
							<option>下午</option>
							<option>晚上</option>	
							</select>
					</div>		
			
			<div><label class="t1">桌號 :</label> <select name="number" required>
							<option>5</option>
							<option>6</option>
							<option>7</option>	
							<option>8</option>
					</select>
				</div>	
				<div><label class="t1" >備註:</label> <textarea cols="40" rows="1" name="remark"></textarea>
				</div>
				
				<div>
							 <input type="submit" class="btn btn-info" value="確定" />
							 <input type="reset"class="btn btn-info" value="清除">
							 </div>
			</fieldset>
		</form>
	


</body>
</html>