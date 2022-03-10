<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>

<%-- <link href="${contextRoot }/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${contextRoot }/js/bootstrap.bundle.min.js" rel="stylesheet"> --%>
<%-- <link href="${contextRoot }/js/bootstrap.bundle.min.js.map" rel="stylesheet"> --%>

<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/DataTables/datatables.css"> --%>
<%-- <script type="text/javascript" charset="utf8" src="${contextRoot}/DataTables/datatables.js"></script> --%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width: 1000px ;display: flex ;margin: auto">
	<table id="table_id" class="display">
	    <thead>
	        <tr>
	            <th>團編號</th>
	            <th>發起者</th>
	            <th>桌遊名稱</th>
	            <th>聚團日期</th>
	            <th>建團時間</th>
	            <th>目前人數</th>
	            <th>查刪</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${groups}" var="group">
	        <tr>
	            <td>${group.groupId}</td>
	            <td>${group.launcher.cusName}</td>
	            <td>${group.product.product_name }</td>
	            <td>${group.gameDate }</td>
	            <td>${group.createdTime}</td>
	            <td>${playerNumPerGroup[group.groupId]}</td>
	            <td>
					<!-- 創造 class:checkTheGroup  利用$('.checkTheGroup').click(function({...}))觸發點擊事件-->
					<button type="button" class="btn btn-success checkTheGroup" data-toggle="modal" data-target="#exampleModal" >
					查看
					</button>
	            	<a	class="btn btn-danger"
						href="${contextRoot }/backstage/groups/DeleteGroup/${group.groupId}"
						onclick="return del()">
					刪除
					</a>
	            </td>
	        </tr>
	        </c:forEach>
	    </tbody>
	</table>
	<p>
	


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</div>

<script >

$('.checkTheGroup').click(function(){

	let groupId=parseInt($(this).parent().parent().children()[0].innerHTML)

	$.ajax({
			url:"http://localhost:8080/homepage/backstage/groups/Participants/"+groupId,
			type:"get",
			dataType:"JSON",
			success: function(respData) {
				console.log(respData)
				console.log(respData[0].joinedTime)
				respData
			},
			error: function(){
				console.log('something wrong')
        	}
	    });
});
	




$(document).ready( function () {
    $('#table_id').DataTable({
    	"lengthMenu": [ [5,10, 25, 50, -1], [5,10, 25, 50, "All"] ]
    }
    );
} );


function del() {
	var msg = "是否刪除此團?";
	if (confirm(msg) == true) {
		return true;
	} else {
		return false;
	}
}
</script>
</body>
</html>