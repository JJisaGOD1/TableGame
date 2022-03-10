<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />  
<!DOCTYPE html>
<html>
<head>
<style>
body{
background-image:url('https://lh3.googleusercontent.com/62SVgyCoKfjqsXk8rZhC9bzH864uN6s-km_2Yee7loq_RddECwY6pgUQEKAYS7XFCpUYXNMueQsBF3vOcKk6YprLLfPILAKpHCyb6OyinkOuWP8U2UCfSigq8QbUYBisr7xWYUYYEh7OnxvUI8hdRmKxSCeEAO5ePzyfEhYARhkqmttDvw_v8QsqCBpyDu-1dE6C1h0vqSEMX6ozNPKgcg3ObfbeNPOAeWcVCkq45pd0fC4rGTqtPZP9kwpyakdUzCrqImTtlxtWfo4xn0tsFuU95eVr8gL-f4DZStvFf9MqmYuGKT9asBLKerM7lomRxacBQYid-QmjW4_LaVxGjTR8SP-GJKJE92INS3fuBXI--Lmv9E6NOEprSbqtxj_0R-1xn-soRAypzH5qqR9M7wzEEmMeJpGRO46OoWqm8QTHFrhafETptL8l8KCQHMFQOnEVlm8XVqLpOqCQr-1cFC49Fd35SYKY82jfioVxDm9mnd_IaYLQNHnuUyvDaUMe5HJ52cfYKeg2bBTgLdoaYJZZ8EO45sUTQENDOJpUuliXtuCMvAS7x6YUiuhWM-VAKgKDTpus-9x_e8_QhlAg44AhwY2OthSrwVamKcnQc8KUp9HoxDDqmZStQXFLRMEDt5jlfiwEnAofbzMOFU3qUferqBdjLZnikCbmrfqPvZMdcj5slUgKKgFmcjRu19EaDXFZDg3KHnkz2U8BohH1sCo=w1200-h800-no?authuser=0');
}


</style>


<meta charset="UTF-8">
<link rel="stylesheet"
    href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>訂位查詢</title>
</head>
<body>
 <div id="allpage" align="center">
<h2>訂位/更改/刪除-查詢</h2>

<a href="<c:url value='addBooking' />">回前頁</a>

<tr style="background-color:a8fefa">

<hr style="height:1px ;border: none;color:#333;background-color:#333">

<section class="container">
        <div class="row">

<c:forEach items="${lnquire}" var="lnquires" >
<div class="col-sm-6 col-md-4" style="width: 360px; height: 360px">
                <div class="thumbnail" style="width: 280px; height: 280px">

<div class="caption">
<p>訂位資料</p>

<p>人數:${lnquires.several} </p>
<p>訂位日期:<fmt:formatDate pattern="yyyy-MM-dd EEEE" value="${lnquires.reservation_date}"/></p>
 <p>時段:${lnquires.period}</p>
 <p>桌號:${lnquires.number} </p>
<p>備註:${lnquires.remark}</p>
<p><a href="${contextRoot}/lnquires?id=${lnquires.orderId}"><input type="button" value="修改"> </a>	|  
				 
			<a onclick="return confirm('確認刪除')" href="${contextRoot}/deletbookings?id=${lnquires.orderId}"><input type="button" value="刪除"></a>
	
</p>

  </div>
                </div>
            </div>
   </c:forEach>
   </div>
   </section>
 
 


</div>
</body>
</html>