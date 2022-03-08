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

</head>
<body>

<script language="javascript"> 
    function delcfm() { 
        if (!confirm("確認要删除？")) { 
            window.event.returnValue = false; 
            alert("已經取消了刪除操作");
        } else
        	alert("已經刪除");
    } 
</script>
<div align="center">
<h2>管理者</h2>
<table border="1"  class="table table-striped">
<tr style="background-color:a8fefa">
<th>人數<th>訂位日期<th>時段<th>桌號<th>備註<th>電話<th>會員<th>工具
<c:forEach items="${page.content}" var="bookings">

   <tr>
   <td>${bookings.several} 
   <td><fmt:formatDate pattern="yyyy/MM/dd EEEE" value="${bookings.reservation_date}"/>
   <td>${bookings.period}
   <td>${bookings.number} 
   <td>${bookings.remark} 
   <td>${bookings.user.phone} 
   <td>${bookings.user.cusName }

  <td> <a href="${contextRoot}/editbooking?id=${bookings.orderId}"> 編輯</a>	|  
				 
			<a onclick="delcfm()" href="${contextRoot}/deletbooking?id=${bookings.orderId}">刪除</a>
   </c:forEach>
</table>


<div class="row justify-content-center">
       <div class="col-9">
       
       <c:forEach var="pageNumber" begin="1" end="${page.totalPages}">
       
       <c:choose>
       
       <c:when test="${page.number !=pageNumber -1 }">
       <a href="${contextRoot}/getAll?p=${pageNumber}"><c:out value="${pageNumber}"/> </a>
      </c:when>
      
      <c:otherwise>
      <c:out value="${pageNumber}"/>
      </c:otherwise>
      
       </c:choose>
       <c:if test="${pageNumber != page.totalPages}"> | </c:if>
       
       </c:forEach>
       
</div>
</div>
</div>

</body>
</html>