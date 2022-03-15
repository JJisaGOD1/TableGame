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
<<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script> 
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
<div style="width:76vw ; position:relative; top:20vh;left:20vw;" >

<table   id="table_id"  class="display">
 <thead>
<tr>
<th >會員</th>
<th >電話</th>
<th >人數</th>
<th >訂位日期</th>
<th >時段</th>
<th >桌號</th>
<th >備註</th>
<th >工具</th>
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
   
  

  <td> <a href="${contextRoot}/editbooking?id=${bookings.orderId}" ><button  type="button" class="updateBtn chcolor" >編輯</button> </a>	|  
			 
			<!-- <a onclick="delcfm()" href="${contextRoot}/deletbooking?id=${bookings.orderId}">刪除</a> -->
		<button class="deletbooking">刪除</button>
			<input type="hidden" class="orderId" value="${bookings.orderId}">
			<input type="button" class="btn btn-primary edit"
										value="編輯第">
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

<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">Open modal for @mdo</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@fat">Open modal for @fat</button>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Open modal for @getbootstrap</button>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<%-- <script src="${contextRoot}/DataTables/datatables.min.js" type="text/javascript"></script> --%>
<script type="text/javascript">
$(document).ready( function () {
    $('#table_id').DataTable({
    	"lengthMenu": [ [6,10, 25, 50, -1], [6,10, 25, 50, "All"] ],
    	"language": {
            "processing": "處理中...",
            "loadingRecords": "載入中...",
            "lengthMenu": "顯示 _MENU_ 項結果",
            "zeroRecords": "沒有符合的結果",
            "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
            "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
            "infoFiltered": "(從 _MAX_ 項結果中過濾)",
            "infoPostFix": "",
            "search": "搜尋:",
            "paginate": {
                "first": "第一頁",
                "previous": "上一頁",
                "next": "下一頁",
                "last": "最後一頁"
            },
            "aria": {
                "sortAscending": ": 升冪排列",
                "sortDescending": ": 降冪排列"
            }
        }
    }
    );
} );


$(".deletbooking").click(function(){
    let check=confirm("確定刪除")
    let tr =$(this).closest("tr")
    let oid=tr.find(".orderId").val()
    console.log(oid)

    if(check==true){
        $.ajax({
            url:'${contextRoot}/deletbooking/'+oid,
            success:function(result){
                confirm('成功刪除')
                tr.remove()
            }
        })
    }
})








</script>
</body>
</html>