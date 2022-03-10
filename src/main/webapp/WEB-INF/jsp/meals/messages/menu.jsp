
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/navbar.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<link href="${contextRoot}/css/menu.css" rel="stylesheet" />
<link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
	
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />
<link href="${contextRoot}/js/sweetalert2.all.min.js" rel="stylesheet" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- <link rel="stylesheet" href="css/stylesheet.css"> -->
<style>
.top_food_banner {
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

.finished_order_icon{
  	position: fixed; 
  	right: 6vw; 
  	top: 12vh;
  	width:5vw;
  }

/* body { */
/* 	background-image: url(uploaded/food_banner.png); */
/* 	background-repeat: no-repeat; */
/*  	background-size: 100%; */

/* } */
.bgImg{
	position: absolute;
	top: 10px;
	right: 0;
	z-index: -5;
	width: 100vw;
}


$main-color: #6394F8;
$light-text: #ABB0BE;

@import url(https://fonts.googleapis.com/css?family=Lato:300,400,700);

@import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css);

*, *:before, *:after {
  box-sizing: border-box;
}

body {
  font: 14px/22px "Lato", Arial, sans-serif;
  background: #6394F8;
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
  
  .navbar-left {
    float: left;
  }
  
  .navbar-right {
    float: right;
  }
  ul {
    
    li {
      display: inline;
      padding-left: 20px;
      a {
        color: #777777;
        text-decoration: none;
        
        &:hover {
          color: black;
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
  
  
  
  .shopping-cart-header {
    border-bottom: 1px solid #E8E8E8;
    padding-bottom: 15px;
    
    .shopping-cart-total {
      float: right;
    }
  }
  
  .shopping-cart-items {
    
    padding-top: 20px;

      li {
        margin-bottom: 18px;
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
  color:white;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  display: block;
  border-radius: 3px;
  font-size: 16px;
  margin: 25px 0 15px 0;
  
  &:hover {
    background: lighten($main-color, 3%);
  }
}

.clearfix:after {
  content: "";
  display: table;
  clear: both;
}



</style>
</head>
<body >
	<img class="bgImg" src="<c:url value="/uploaded/food_banner.png"/>" class="top_food_banner" />
<!-- 	<div class="top_food_banner_bg"></div> -->
	

	<!-- <div style="background: cover url('<c:url value="/uploaded/food_banner.png"/>'); background-size: cover; width: 100vw; height: 500px;"></div> -->
	


<!-- 	<div style="background: cover url(uploaded/food_banner.png); background-size: cover; width: 100vw;"> -->
<%-- 		<a href="${contextRoot}/checkOrder"> <img src="<c:url value="/uploaded/app-icon-sales-order.png"/>" class="finished_order_icon"  /> </a> --%>
		<div style="background: cover url(uploaded/food_banner.png); background-size: cover; width: 100vw;">
		 <img src="<c:url value="/uploaded/app-icon-sales-order.png"/>" class="finished_order_icon" id="cart" />
		
		
		

		<div class="row justify-content-center">
			<a href="${contextRoot}/goToCart">查看訂單</a>
		</div> 

	<div class="wrap">
		<!-- <div class="menu">
          <h3>甜點類別</h3>  
            <ul>
                <li class="all-items"><a href="#">所有甜點 (45)</a></li>
                <li class="other-items"><a href="#">本日精選 (10)</a></li>
                <li class="other-items"><a href="#">人氣精選 (26)</a></li>
                <li class="other-items"><a href="#">新品上市 (12)</a></li>
            </ul>
        </div> -->


		<!-- 		<div class="content"> -->
		<%-- 			<c:forEach items="${page.content}" var="food"> --%>
		<!-- 				<div class="item"> -->
		<%-- 					<img src="<c:url value="/uploaded/${food.foodImage}"/>" style="width:300px" alt="picture of food" /> --%>

		<!-- 					<div class="item-name"> -->
		<%-- 						<span class="name"><c:out value="${food.foodName}" /></span> <span --%>
		<%-- 							class="price">NT$ <c:out value="${food.foodPrice}" /></span> --%>
		<!-- 					</div> -->
		<%-- 					<a href="${contextRoot}/addToCart?foodId=${food.foodId}" style="text-decoration:none;">加入訂單</a> --%>

		<!-- 				</div> -->
		<%-- 			</c:forEach> --%>
		<!-- 			<p> -->
		<!-- 		</div> -->


		<div class="content">
			<c:forEach items="${page.content}" var="food">
				<div class="card" style="margin: 10px 5px;">
					<img src="<c:url value="/uploaded/${food.foodImage}"/>"
						style="width: 250px" alt="picture of food" class="card-img-top" />
					<div class="card-body">
						<h5 class="card-title">
							<c:out value="${food.foodName}" />
						</h5>
						<p class="card-text">
							NT$
							<c:out value="${food.foodPrice}" />
						</p>
						<a onclick="alert('已加入訂單')"
							href="${contextRoot}/addToCart?foodId=${food.foodId}"
							class="btn btn-primary">加入訂單</a>
						<%-- 							<a onclick="return confirm('確認刪除?')" href="${contextRoot}/deleteMessage?id=${workMessages.id}">刪除</a> --%>
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- 			<div class="item"> -->
		<!-- 				<img src="" alt="picture of food"> -->
		<!-- 				<div class="item-name"> -->
		<!-- 					<span class="name">拿鐵咖啡</span> <span class="price">NT$ 100</span> -->
		<!-- 				</div> -->
		<!-- 				<a href="#">加入購物車</a> -->
		<!-- 			</div> -->
		<!-- 			<div class="item"> -->
		<!-- 				<img src="" alt="picture of food"> -->
		<!-- 				<div class="item-name"> -->
		<!-- 					<span class="name">美式咖啡</span> <span class="price">NT$ 80</span> -->
		<!-- 				</div> -->
		<!-- 				<a href="#">加入購物車</a> -->
		<!-- 			</div> -->
		<!-- 			<div class="item"> -->
		<!-- 				<img src="" alt="picture of food"> -->
		<!-- 				<div class="item-name"> -->
		<!-- 					<span class="name">可可鬆餅</span> <span class="price">NT$ 100</span> -->
		<!-- 				</div> -->
		<!-- 				<a href="#">加入購物車</a> -->
		<!-- 			</div> -->


		<!-- 	===================訂單明細(之後加入)===================	 -->
		
<!-- 		<nav class="cart-nav"> -->
<!--   <div class="container"> -->
<!--     <ul class="navbar-left"> -->
<!--       <li><a href="#">Home</a></li> -->
<!--       <li><a href="#about">About</a></li> -->
<!--     </ul> end navbar-left -->

<!--     <ul class="navbar-right"> -->
<!--       <li><a href="#" id="cart"><i class="fa fa-shopping-cart"></i> Cart <span class="badge">3</span></a></li> -->
<!--     </ul> end navbar-right -->
<!--   </div> end container -->
<!-- </nav> -->


<div class="container">
  <div class="shopping-cart">
    <div class="shopping-cart-header">
    
<!--       <i class="fa fa-shopping-cart cart-icon"></i> -->
<div class="shopping-cart-total">
	<div style="position: inherit;height: 4vh">
		
		<div style="">
      		<i class='bx bxs-cart bx-tada bx-sm' ></i>
      		<span class="badge"><c:out value="${cart.foodMap.size()} "></c:out></span>
        </div>
        
        <div style="position: relative;top: -1.5vw;right: -12vw;display: flex;">
      		<span class="orderId">訂單編號<c:out value="${newOrders.orderId}" /></span>
	  		<span class="tableNum">第<c:out value="${newOrders.tableNum}" /></span>
	    </div>
	</div>
	
	<div style="display: flex; justify-content: flex-end;">
<!--         <span class="lighter-text"></span> -->
        <span class="main-color-text" style="font-size: 1.5rem;color: cornflowerblue;">Total: $<c:out value="${cart.totalPrices}"/></span>
    
    
		
      	
		
	</div>
</div>
    </div> <!--end shopping-cart-header -->
    <hr>

<div style="overflow-y: auto; height: 50vh;">

<c:forEach items="${cart.foodMap}" var="cart">
    <ul class="shopping-cart-items">
      <li class="clearfix">
        <img src="<c:url value="/uploaded/${cart.value.food.foodImage}"/>" style="width: 50px" alt="item1" />
        <span class="item-name-cart"><c:out value="${cart.value.food.foodName}" /></span>
        <span class="item-price">單價:NT$<c:out value="${cart.value.food.foodPrice}" /></span>
        <span class="lighter-text">數量:<c:out value='${cart.value.quantity}' /></span>
      </li>
	</ul>
</c:forEach>
</div>

    <a href="${contextRoot}/goToCart" class="btn btn-primary btn-lg btn-block" style="background-color: #6394F8" >確認訂單</a>
  </div> <!--end shopping-cart -->
</div> <!--end container -->
		
		
		
		
		<!-- 	===================訂單明細(之後加入)以上===================	 -->


		<!-- 	===================頁碼===================	 -->
	</div>

	<div class="row justify-content-center">
		<div class="col-9">
			<c:forEach var="pageNumber" begin="1" end="${page.totalPages}">

				<c:choose>
					<c:when test="${page.number != pageNumber -1}">

						<a href="${contextRoot}/menu?p=${pageNumber}"><c:out
								value="${pageNumber}" /> </a>
					</c:when>

					<c:otherwise>
						<c:out value="${pageNumber}" />
					</c:otherwise>
				</c:choose>

				<c:if test="${pageNumber != page.totalPages}">
			|
			</c:if>

			</c:forEach>
		</div>
	</div>
	<!-- 	===================頁碼()以上===================	 -->
		
		
	</div>
	

	<script>
		function addFoodAlert() {
			Swal.fire('Good job!', 'You clicked the button!', 'success')
		}
		
		(function(){
			 
			  $("#cart").on("click", function() {
			    $(".shopping-cart").fadeToggle( "fast");
			  });
			  
			})();
		
	</script>





</body>
</html>