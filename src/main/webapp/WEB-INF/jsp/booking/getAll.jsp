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
<meta charset="UTF-8">
<title>員工資料</title>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
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


</head>
<body>

<!-- <div class="col-sm-10 justify-content-center row" id="bsdiv" -->
<!--   style="margin: 0; padding: 0"> -->
<div align="center">
<h2>管理者</h2>
<table style="width: 90%;"  id="table_id"  class="display">
 <thead>
<tr>
<th style="width: 7%;">會員</th>
<th style="width: 12%;">電話</th>
<th style="width: 6%;">人數</th>
<th style="width: 15%;">訂位日期</th>
<th style="width: 7%;">時段</th>
<th style="width: 7%;">桌號</th>
<th>備註</th>
<th style="width: 10%;">工具</th>
</tr>
 </thead>
<c:forEach items="${page}" var="bookings">

   <tr>
   <td>${bookings.user.cusName }
   <td>${bookings.user.phone} 
   <td>${bookings.several} 
   <td><fmt:formatDate pattern="yyyy/MM/dd EEEE" value="${bookings.reservation_date}"/>
   <td>${bookings.period}
   <td>${bookings.number} 
   <td>${bookings.remark} 
   
  

  <td> <a href="${contextRoot}/editbooking?id=${bookings.orderId}" ><button  type="button" class="updateBtn chcolor">編輯</button> </a>	|  
				 
			<a onclick="delcfm()" href="${contextRoot}/deletbooking?id=${bookings.orderId}">刪除</a>
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


<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<%-- <script src="${contextRoot}/DataTables/datatables.min.js" type="text/javascript"></script> --%>
<script type="text/javascript">
$(document).ready( function () {
    $('#table_id').DataTable();
} );

</script>
</body>
</html>