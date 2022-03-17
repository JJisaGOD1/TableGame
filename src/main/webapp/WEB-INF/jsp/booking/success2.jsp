<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>成功</title>
<style>
body{
background-image:url('https://lh3.googleusercontent.com/62SVgyCoKfjqsXk8rZhC9bzH864uN6s-km_2Yee7loq_RddECwY6pgUQEKAYS7XFCpUYXNMueQsBF3vOcKk6YprLLfPILAKpHCyb6OyinkOuWP8U2UCfSigq8QbUYBisr7xWYUYYEh7OnxvUI8hdRmKxSCeEAO5ePzyfEhYARhkqmttDvw_v8QsqCBpyDu-1dE6C1h0vqSEMX6ozNPKgcg3ObfbeNPOAeWcVCkq45pd0fC4rGTqtPZP9kwpyakdUzCrqImTtlxtWfo4xn0tsFuU95eVr8gL-f4DZStvFf9MqmYuGKT9asBLKerM7lomRxacBQYid-QmjW4_LaVxGjTR8SP-GJKJE92INS3fuBXI--Lmv9E6NOEprSbqtxj_0R-1xn-soRAypzH5qqR9M7wzEEmMeJpGRO46OoWqm8QTHFrhafETptL8l8KCQHMFQOnEVlm8XVqLpOqCQr-1cFC49Fd35SYKY82jfioVxDm9mnd_IaYLQNHnuUyvDaUMe5HJ52cfYKeg2bBTgLdoaYJZZ8EO45sUTQENDOJpUuliXtuCMvAS7x6YUiuhWM-VAKgKDTpus-9x_e8_QhlAg44AhwY2OthSrwVamKcnQc8KUp9HoxDDqmZStQXFLRMEDt5jlfiwEnAofbzMOFU3qUferqBdjLZnikCbmrfqPvZMdcj5slUgKKgFmcjRu19EaDXFZDg3KHnkz2U8BohH1sCo=w1200-h800-no?authuser=0');

}
</style>
</head>
<body>
<div align="center">
<h1>${booking.user.cusName} 訂位成功</h1>
<p>訂位資訊已寄送至您的電子信箱</p>
</div>
</body>
</html>