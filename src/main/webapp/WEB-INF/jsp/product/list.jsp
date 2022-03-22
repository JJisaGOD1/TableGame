<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/homaPageNavbar.jsp" />
<jsp:include page="layout/NewFile.jsp" />

<!DOCTYPE html>
<html>
<head>
<script src="${contextRoot}/js/sweetalert2.all.min.js"></script>
<link href="${contextRoot}/css/menu.css" rel="stylesheet" />
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css'
	rel='stylesheet'>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/css/forProductPage.css" rel="stylesheet" />

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

<
style>.top_food_banner {
	width: 100vw;
	z-index: -1;
}

.top_food_banner_bg {
	background-image: url('uploaded/food_banner.png');
	background-repeat: no-repeat;
	/* 	background-attachment: fixed; */
	/* 	background-size: 100% 100%; */
	width: 100vw;
	height: 100vh;
}

.finished_order_icon {
	position: fixed;
	right: 6vw;
	top: 12vh;
	width: 5vw;
}

/* body { */
/* 	background-image: url(uploaded/food_banner.png); */
/* 	background-repeat: no-repeat; */
/*  	background-size: 100%; */

/* } */
.bgImg {
	position: absolute;
	top: 10px;
	right: 0;
	z-index: -5;
	width: 100vw;
}

$
main-color








:








;
$
light-text








:








#ABB0BE








;
@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

@import
	url(https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css)
	;

*, *:before, *:after {
	box-sizing: border-box;
}

body {
	font: 14px/22px "Lato", Arial, sans-serif;
}

.lighter-text {
	color: #ABB0BE;
}

.main-color-text {
	color: $main-color;
}

.cart-nav {
	padding: 20px 0 40px 0;
	background: #F8F8F8;
	font-size: 16px;
	.
	navbar-left
	{
	float
	:
	left;
}

.navbar-right {
	float: right;
}

ul {li { display:inline;
	padding-left: 20px; a { color : #777777;
	text-decoration: none;
	&:
	hover
	{
	color
	:
	black;
}

}
}
}
}
.container {
	margin: auto;
	width: 80%;
}

.badge {
	background-color: #6394F8;
	border-radius: 10px;
	color: white;
	display: inline-block;
	font-size: 12px;
	line-height: 1;
	padding: 3px 7px;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
}

.shopping-cart {
	margin: 20px 0;
	float: right;
	background: white;
	width: 22vw;
	position: relative;
	border-radius: 3px;
	padding: 20px;
	position: fixed;
	top: 18vh;
	right: 6.4vw;
	transition: none; . shopping-cart-header { border-bottom : 1px solid
	#E8E8E8;
	padding-bottom: 15px; .
	shopping-cart-total {float: right;
}

}
.shopping-cart-items {
	padding-top: 20px;
	li {margin-bottom: 18px;
}

img {
	float: left;
	margin-right: 12px;
}

.item-name-cart {
	display: block;
	padding-top: 10px;
	font-size: 16px;
}

.item-price {
	color: $main-color;
	margin-right: 8px;
}

.item-quantity {
	color: $light-text;
}

}
}
.shopping-cart:after {
	bottom: 100%;
	left: 89%;
	border: solid transparent;
	content: " ";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
	border-bottom-color: white;
	border-width: 8px;
	margin-left: -8px;
}

.cart-icon {
	color: #515783;
	font-size: 24px;
	margin-right: 7px;
	float: left;
}

.button {
	background: $main-color;
	color: white;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	display: block;
	border-radius: 3px;
	font-size: 16px;
	margin: 25px 0 15px 0; &:
	hover {background: lighten($ main-color, 3%);
}

}
.clearfix:after {
	content: "";
	display: table;
	clear: both;
}
</style>

</head>
<body>

	<img src="<c:url value="/uploaded/app-icon-sales-order.png"/>"
		class="finished_order_icon" id="cart" />
	<div class="container">
		<div class="shopping-cart">
			<div class="shopping-cart-header">

				<!--       <i class="fa fa-shopping-cart cart-icon"></i> -->
				<div class="shopping-cart-total">
					<div style="position: inherit; height: 4vh">

						<div style="">
							<i class='bx bxs-cart bx-tada bx-sm'></i> <span class="badge"></span>
						</div>
					</div>
					<div style="display: flex; justify-content: flex-end;">
						<!--         <span class="lighter-text"></span> -->
						<span class="main-color-text"
							style="font-size: 1.5rem; color: cornflowerblue;">Total: $<span
							class="totalprice"></span></span>
					</div>
				</div>
			</div>
			<!--end shopping-cart-header -->
			<hr>
			<div style="overflow-y: auto; height: 50vh;" class="cart"></div>
		</div>
		<!--end shopping-cart -->
	</div>
	<!--end container -->

	<div class="wrap" style="width: 60vw; margin-left: 5vw">
		<div class="content" style="width: 60vw; padding: 5%">
			<c:forEach items="${P.content}" var="P">
				<c:choose>
					<c:when test="${P.sellstatus=='上架中'&&P.stock>20}">
						<div class="card"
							style="width: 15vw; padding: auto; margin-bottom: 0">
							<p hidden="true">${P.product_id}</p>
							<div
								style="max-width: 15vw; height: 18vw; display: flex; justify-content: center;">
								<a
									href="${contextRoot}/products/showImformation?id=${P.product_id}">
									<img src="<c:url value='/Photo/${P.photourl}' />"
									style="width: 15vw; max-height: 18vw; margin-bottom: 0"
									alt="picture of food" class="card-img-top"
									onerror="this.src='${contextRoot}/Photo/nophoto.jpg'" />
								</a>
							</div>
							<div class="card-body" style="padding: 0 1vw 0.5vw 1vw">
								<h3 class="card-title"
									style="font-size: 2rem; margin-bottom: 5px">
									<c:out value="${P.product_name}" />
								</h3>
								<p class="card-text" style="font-size: 2rem; margin-bottom: 5px">
									NT$
									<c:out value="${P.price}" />
								</p>
								<input type="button" class="btn btn-primary addonetocart" 
									style="font-size: 1.5rem;margin: 0" value="加入一個到購物車" >
							</div>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>

		</div>
	</div>
	<div
		style="position: relative; width: 30vw; margin: auto; font-size: x-larg e;"
		align="center">
		<div class="col-9">
			<c:out value="第" />
			<c:forEach var="pageNumber" begin="1" end="${P.totalPages}">

				<c:choose>
					<c:when test="${pageNumber-1==P.number}">
						<!--page.number:取的當前頁面的頁碼-->
						<c:out value="${pageNumber}" />
					</c:when>
					<c:otherwise>
						<a href="${contextRoot}/products/list?p=${pageNumber}"><c:out
								value="${pageNumber}" /> </a>
					</c:otherwise>
				</c:choose>

				<c:if test="${pageNumber != P.totalPages}">
					<!--顯示|的條件:如果是最後一頁，後面就不顯示-->
						|
					</c:if>
			</c:forEach>
			<c:out value="頁" />
		</div>
	</div>
	<div></div>
	<div style="display: flex; justify-content: center;">
		<a href="${contextRoot}/products/goToProductCart"><input
			type="button" class="btn btn-primary" style="font-size: 1.5rem;margin: 0" value="查看購物車"></a>
	</div>
</body>
<script>
	function addFoodAlert() {
		Swal.fire('Good job!', 'You clicked the button!', 'success')
	}

	(function() {

		$("#cart").on("click", function() {
			$(".shopping-cart").fadeToggle("fast");
		});

	})();

	$(".addonetocart").click(function() {
		let Id = $(this).parent().parent().find("p").html();
		$.ajax({
			url : "${contextRoot}/products/addonetocart?id=" +Id,
			method : "get",
			success : function(data) {
				A=data.productMap;
				console.log(Object.keys(A).length)	
			console.log(data);
			
				let a="";
				$(".badge").empty();
				a=Object.keys(A).length
				$(".badge").append(a);
				
				let b="";
				$(".totalprice").empty();
				b=Object.values(data)[1];
				$(".totalprice").append(b);
		
				let c = "";
				$(".cart").empty();
				
			
				Object.keys(A).forEach(key => {
					c="<ul class='shopping-cart-items'>";
					c+="<li style='display:none;' class='idforajax'> "+A[key].product.product_id+"</li>"
		 			c+="<li class='clearfix'>";
		 			c+="<img src='${contextRoot}/Photo/"+A[key].product.photourl+"' style='width: 50px' alt='item1' /> <span class='item-name-cart'>"
		 			c+="<span class='item-name-cart' style='font-size: 1.5rem'>"+A[key].product.product_name+"</span>"
		 			c+="<span class='item-price'  style='font-size: 1.5rem'>單價:NT"+A[key].price+"</span> <span class='lighter-text'  style='font-size: 1.5rem'>數量:"+A[key].quantity+"</span></li>"
		 			c+="<input type='button' class='deleteall btn btn-primary' value='整個刪除'>"
		 			c+="</ul>"
		 			$(".cart").append(c);
					});
				
				
				Swal.fire({
					
					  icon: 'success',
					  title: '已加入購物車',
					  showConfirmButton: false,
					  timer: 1500
					})
			},
			error(data){
				let a="";
				$(".badge").empty();
				console.log("sssssss");
				a=0;
				$(".badge").append(a);
				
				let b="";
				$(".totalprice").empty();
				b=0;
				$(".totalprice").append(b);
				
				let c = "";
				$(".cart").append(c);
			}
		})
	})
	
	function EEntrylist(){
		$.ajax({
			url : "${contextRoot}/products/enterlist",
			method : "get",
				success : function(data) {
					A=data.productMap;
					console.log(Object.keys(A).length)		
					 
					let a="";
					$(".badge").empty();
					console.log("sssssss");
					a=Object.keys(A).length
					$(".badge").append(a);
					
					let b="";
					$(".totalprice").empty();
					b=Object.values(data)[1];
					$(".totalprice").append(b);
			
					let c = "";
					$(".cart").empty();
					console.log(data.productMap);
				
					Object.keys(A).forEach(key => {
						c="<ul class='shopping-cart-items'>";
						c+="<li style='display:none;' class='idforajax'> "+A[key].product.product_id+"</li>"
			 			c+="<li class='clearfix'>";
			 			c+="<img src='${contextRoot}/Photo/"+A[key].product.photourl+"' style='width: 50px' alt='item1' /> <span class='item-name-cart'>"
			 			c+="<span class='item-name-cart' style='font-size: 1.5rem'>"+A[key].product.product_name+"</span>"
			 			c+="<span class='item-price'  style='font-size: 1.5rem'>單價:NT"+A[key].price+"</span> <span class='lighter-text'  style='font-size: 1.5rem'>數量:"+A[key].quantity+"</span></li>"
			 			c+="<input type='button' class='deleteall btn btn-primary' value='整個刪除'>"
			 			c+="</ul>"
			 			$(".cart").append(c);
						});
				},
				error(data){
					let a="";
					$(".badge").empty();
					console.log("sssssss");
					a=0;
					$(".badge").append(a);
					
					let b="";
					$(".totalprice").empty();
					b=0;
					$(".totalprice").append(b);
					
					let c = "";
					$(".cart").append(c);
				}
			})
	}
	
	
	
	$(document).on("click",".deleteall",function(){
		let id=$(this).parent().find("li").html();
		console.log(id);
		const swalWithBootstrapButtons = Swal.mixin({
			  customClass: {
			    confirmButton: 'btn btn-success',
			    cancelButton: 'btn btn-danger'
			  },
			  buttonsStyling: false
			})
			swalWithBootstrapButtons.fire({
			  title: '確定要移出購物車?',
			  text: "此操作無法恢復!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonText: '是!',
			  cancelButtonText: '否',
			  reverseButtons: true
			}).then((result) => {
			  if (result.isConfirmed) {
					$.ajax({
						url : "${contextRoot}/products/deleteOneItemAJAX?id="+id,
						method : "get",
							success : function(data) {
								A=data.productMap;
								console.log(Object.keys(A).length)		
								 
								let a="";
								$(".badge").empty();
								console.log("sssssss");
								a=Object.keys(A).length
								$(".badge").append(a);
								
								let b="";
								$(".totalprice").empty();
								b=Object.values(data)[1];
								$(".totalprice").append(b);
						
								let c = "";
								$(".cart").empty();
								console.log(data.productMap);
							
								Object.keys(A).forEach(key => {
									c="<ul class='shopping-cart-items'>";
									c+="<li style='display:none;' class='idforajax'> "+A[key].product.product_id+"</li>"
						 			c+="<li class='clearfix'>";
						 			c+="<img src='${contextRoot}/Photo/"+A[key].product.photourl+"' style='width: 50px' alt='item1' /> <span class='item-name-cart'>"
						 			c+="<span class='item-name-cart' style='font-size: 1.5rem'>"+A[key].product.product_name+"</span>"
						 			c+="<span class='item-price'  style='font-size: 1.5rem'>單價:NT"+A[key].price+"</span> <span class='lighter-text'  style='font-size: 1.5rem'>數量:"+A[key].quantity+"</span></li>"
						 			c+="<input type='button' class='deleteall btn btn-primary' value='整個刪除'>"
						 			c+="</ul>"
						 			$(".cart").append(c);
									});
							}
						})
			    swalWithBootstrapButtons.fire(
			      'Deleted!',
			      '商品已移出購物車.',
			      'success'
			    )
			  } else if (
			    result.dismiss === Swal.DismissReason.cancel
			  ) {
			    swalWithBootstrapButtons.fire(
			      'Cancelled',
			      '您的操作已被取消:)',
			      'error'
			    )
			  }
			})
		
		
		
		
	})
	
	window.onload=EEntrylist;
</script>

</html>