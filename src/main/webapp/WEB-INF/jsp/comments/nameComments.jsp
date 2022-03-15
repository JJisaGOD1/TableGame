<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<title>Customer search Comment</title>
</head>
<style>
	.span1{
		font-size: x-large;
    	font-weight: 600;
	}
	.background{
        background-image: url("${contextRoot}/uploaded/chatwallpaper.jpg");
        background-repeat: none;
        background-size: 100%;
		width: 100vw;
		height: 100vh;
		position: fixed;
		z-index: -90;
		opacity: 0.5;
		top: 0;

    }
	.li1{
		font-size: 2rem;
	} 
	.sty1{
		border: 2px solid;
    	border-radius: 10px;
	}
	.button1{
		font-size: 2rem;
	}
	.swal2-popup {
		font-size: 1.6rem !important;
	}
</style>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="${contextRoot}/js/jquery-3.6.0.min.js"></script>
<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
<body>
<!-- 各自的navbar -->
<div class="navbar-wrap">
    <nav class="navbar-meals">
    <img alt="" src="${contextRoot}/uploaded/food-menu-solid-24.png">
    
    <a href="${contextRoot}/addComment" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-comment-detail bx-lg' style="display: flex; justify-content: center; color: black;"></i>意見回復</button></a>
    
    
    <a href="${contextRoot}/nameComments/1" class="navbarlogo"><button style="background-color: white;"><i class='bx bx-book-content bx-lg' style="display: flex; justify-content: center; color: black;"></i>查詢留言</button></a>
    <a href="${contextRoot}/customerService" class="navbarlogo"><button style="background-color: white;"><i class='bx bxs-chat bx-lg' style="display: flex; justify-content: center; color: black;"></i>線上交流</button></a>
    </nav>
</div>
<!-- 各自的navbar(end) -->
<div class="background"></div>
<div class="container">
	<br>
<h1 style="font-weight: 600; font-size: 3.5rem;">${pageComments.content[0].membersBean.cusName}&nbsp;&nbsp;<span style="font-size: 3.5rem;">留言查看</span></h1>

	<br>		
<c:forEach items="${pageComments.content}" var="comment">
			<div class="row justify-content-center">
				<div class="col-9">
					<div class="card sty1">
						
						<div class="card-header">
							<span class="span1">留言時間:&nbsp;&nbsp;
							<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss EEEE"
								value="${comment.createdTime}" /> </span>
						</div>
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item li1"><span class="span1">回覆狀態&nbsp;:&nbsp;</span><c:out value="${comment.conditionsBean.conName}" /></li>
								<li class="list-group-item li1"><span class="span1">留言&nbsp;:&nbsp;</span><c:out value="${comment.comment}"/></li>
								<li class="list-group-item li1"><span class="span1">回覆&nbsp;:&nbsp;</span><c:out value="${comment.response}" /></li>
								<li class="list-group-item li1"><span class="span1">問題類別&nbsp;:&nbsp;</span><c:out value="${comment.categorysBean.cateName}" /></li>
								<c:if test="${comment.categorysBean.id==6}">
									<li class="list-group-item li1"><span class="span1">產品名&nbsp;:&nbsp;</span><c:out value="${comment.productsBean.product_name}" /></li>
								</c:if>	
							</ul>
							
							<div style="text-align: end;">
								<c:if test="${comment.conditionsBean.id == 1}">
									<a  href="${contextRoot}/editComment/${comment.id}"><button class="btn btn-primary button1">編輯</button></a>
								</c:if>
								<a ><button class="btn btn-danger button1 delBtn" value="${comment.id}">刪除</button></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
		</c:forEach>
		<div class="row justify-content-center" style="text-align: right">
			<div class="col-9" style="font-size: x-large;">
				<c:forEach var="pageNumber" begin="1" end="${pageComments.totalPages}">
					<c:choose>
						<c:when test="${pageComments.number != pageNumber -1}">
							<a href="${contextRoot}/nameComments/${pageNumber}"><c:out value="${pageNumber}" /> </a>
						</c:when>
						<c:otherwise>
							<c:out value="${pageNumber}" />
						</c:otherwise>
					</c:choose>
					<c:if test="${pageNumber != pageComments.totalPages}">
						|
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
<script>
$(".delBtn").click(function(){
	console.log("3345678")
	let commentId = $(this).val()
	console.log(commentId)
	Swal.fire({
		title: '確定刪除?',
		icon: 'warning',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: '#d33',
		cancelButtonText: '關閉',
		confirmButtonText: '刪除'
		}).then((result) => {
		if (result.isConfirmed) {
			$.ajax({
				url:'${contextRoot}/deleteComment/' + commentId,
				method:'get',
				success:function(){
					setTimeout(function(){
						window.location.reload()
					}, 1000)
				}
			})
			Swal.fire(
			'成功刪除',
			'',
			'success'
			)
		}
	})

})
</script>
</body>
</html>