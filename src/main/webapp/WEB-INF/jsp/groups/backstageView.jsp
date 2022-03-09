<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>



<%-- <link rel="stylesheet" type="text/css" href="${contextRoot}/DataTables/datatables.css"> --%>
<%-- <script type="text/javascript" charset="utf8" src="${contextRoot}/DataTables/datatables.js"></script> --%>

 

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="width: 500px ;display: flex ;margin: auto">
	<table id="table_id" class="display">
	    <thead>
	        <tr>
	            <th>團編號</th>
	            <th>遊玩遊戲</th>
	            <th>遊玩時間</th>
	            <th>參加者</th>
	            <th>加入時間</th>
	        </tr>
	    </thead>
	    <tbody>
	    	
	    	<c:forEach begin="" end="">
	        <tr>
	            <td>Row 1 Data 1</td>
	            <td>Row 1 Data 2</td>
	            <td>Row 1 Data 2</td>
	            <td>Row 1 Data 2</td>
	            <td>Row 1 Data 2</td>
	        </tr>
	        </c:forEach>

	    </tbody>
	</table>
</div>
<script >
$(document).ready( function () {
    $('#table_id').DataTable();
} );
</script>
</body>
</html>