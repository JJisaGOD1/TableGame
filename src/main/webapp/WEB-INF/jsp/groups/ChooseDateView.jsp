<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!-- ------導入黑色navbar--------- -->
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>


<!-- ------導入Boxicons--------- -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>


<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<link rel="stylesheet" href="${contextRoot}/JQuery/jquery-ui-1.13.1.custom/jquery-ui.min.css">
<!--   <link rel="stylesheet" href="/resources/demos/style.css"> -->
  <script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
  <script src="${contextRoot}/JQuery/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
  <script src="i18n/datepicker-zh-TW.js"></script>
  <script>
  
  $( "#datepicker" ).datepicker( $.datepicker.regional[ "zh-TW" ]={
		  	closeText: "關閉",
			prevText: "&#x3C;上個月",
			nextText: "下個月&#x3E;",
			currentText: "今天",
			monthNames: [ "一月", "二月", "三月", "四月", "五月", "六月",
			"七月", "八月", "九月", "十月", "十一月", "十二月" ],
			monthNamesShort: [ "一月", "二月", "三月", "四月", "五月", "六月",
			"七月", "八月", "九月", "十月", "十一月", "十二月" ],
			dayNames: [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ],
			dayNamesShort: [ "週日", "週一", "週二", "週三", "週四", "週五", "週六" ],
			dayNamesMin: [ "日", "一", "二", "三", "四", "五", "六" ],
			weekHeader: "週",
			dateFormat: "yy/mm/dd",
			firstDay: 1,
			isRTL: false,
			showMonthAfterYear: true,
			yearSuffix: "年",
			minDate: +1, maxDate: "+1M +20D",
			onSelect: function(date, instance) {
	            window.location = "http://localhost:8080${contextRoot}/groups/TheDateState/"+date;
	    	}
			
		} );
  
  $.datepicker.setDefaults($.datepicker.regional["zh-TW"]);
  $( function() {
    $( "#datepicker" ).datepicker({
        numberOfMonths: 2,
        dateFormat: 'yy/mm/dd',
//         showButtonPanel: true
    });
    

  } );
  
  
  

  </script>

</head>
<body>
	<!-- <a href="${contextRoot}">回登入頁</a> -->
	<div class="body">
		
	</div>
	<div class="first" align="center" style="margin-top: 7rem;">
		<h2>選擇一天開團或入團吧!</h2><br>
		<div id="datepicker"></div>
		
	</div>

	

</body>
</html>