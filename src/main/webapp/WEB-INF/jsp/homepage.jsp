<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<jsp:include page="layout/homaPageNavbar.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>


<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>

<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>complete responsive coffee shop website design</title>

<!-- font awesome cdn link  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- custom css file link  -->
<link rel="stylesheet" href="css/style.css">

<link href="./css/homePage.css" rel="stylesheet">
<link href="./css/bootstrap.min.css" rel="stylesheet">
<link href="./js/bootstrap.bundle.min.js" rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

h1 {
	text-align: center;
}

#screenBox {
	margin: 20px auto;
	width: 1745px;
	height: 70rem;
	/* border1: 3px solid grey; */
	overflow: hidden;
	position: relative;
	background-color: blue;
}

#movedot {
	margin: 0px auto;
	width: 1200px;
	height: 30px;
	/* border: 3px solid grey; */
	/* overflow: hidden; */
	position: relative;
}

#list {
	width: 8725px;
	height: 550px;
	position: absolute;
	z-index: 1;
}

#list img {
	float: left;
	width: 1745px;
	height: 70rem;
}

#buttons {
	position: absolute;
	height: 10px;
	width: 100px;
	z-index: 2;
	bottom: 20px;
	right: 540px;
}

#buttons span {
	float: left;
	border: 1px solid white;
	border-radius: 50%;
	height: 10px;
	width: 10px;
	margin-right: 5px;
	background: rgba(128, 128, 128, 0.5);
}

#buttons .on {
	background: black;
	opacity: 60%;
}

.arrow {
	margin-top: 100px;
	display: none;
	line-height: 40px;
	text-align: center;
	font-size: 30px;
	width: 40px;
	height: 40px;
	position: absolute;
	z-index: 2;
	top: 140px;
	color: white;
	background: rgba(255, 255, 255, 0.5);
}

#screenBox:hover .arrow {
	display: block;
}

#header {
	background-color: black;
	height: 10px;
}

.copyright-1 .container .row-copyrights, .copyright-2 .container .row-copyrights,
	.copyright-3 .container .row-copyrights, .copyright .container .row-copyrights
	{
	padding-top: 20px;
	padding-bottom: 15px;
	margin-left: 170px;
	color: white;
}

#labelStyle {
	font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
	color: white;
	font-size: 20px;
	font-weight: bold;
}

  /* Make the image fully responsive */
  .carousel-inner img {
    width: 90%;
    height: 80%;
  }
</style>



</head>
<body>

	<!-- header section starts  -->

<!-- 	<header class="header"> -->

<!-- 		<a href="#" class="logo"> <img src="uploaded/dice_logo.png" alt=""> </a> -->
			
			
<!-- 		<nav class="navbar"> -->

<!-- 			<a href="#home">首頁</a> -->
<!-- 			<a href="#about">最新消息</a> -->
<!-- 			<a href="#menu">會員招募</a> -->
<!-- 			<a href="#products">店鋪資訊</a> -->
<%-- 			<a href="${contextRoot}/viewProductsnologin">商品</a> --%>
<%-- 			<a href="${contextRoot}/startOrder">點餐</a> --%>
<%-- 			<a href="${contextRoot}/groups/ChooseDate">開團</a> --%>
<%-- 			<a href="${contextRoot}/addBooking">訂位</a> --%>
			
<%-- 			<c:if test="${member.ratingsBean.id == 3 }"> --%>
<%-- 				<a href="${contextRoot}/customerService">線上客服</a> --%>
<%-- 			</c:if> --%>
			
<%-- 			<c:if test="${member.ratingsBean.id == 1 }"> --%>
<%-- 				<a href="${contextRoot}/backController">後台管理</a> --%>
<%-- 			</c:if> --%>
<!-- 		</nav> -->



<!-- 		<div class="icons" style="display: flex"> -->
<!-- 			<div class="fas fa-search" id="search-btn"></div> -->
<!-- 			<div class="fas fa-shopping-cart" id="cart-btn"></div> -->

			
<%-- 			<c:if test="${member.ratingsBean.id == null }"> --%>
<!-- 			<div style="display: flex"> -->
<%-- 				<a class="nav-link" href="${contextRoot}/addCustomer">註冊 --%>
<!-- 				</a> -->
<!-- 			</div> -->
<!-- 			<div style="display: flex"> -->
<%-- 				<a class="nav-link" href="${contextRoot}/login">登入 --%>
<!-- 				</a> -->
<!-- 			</div> -->
<%-- 			</c:if> --%>
			
<%-- 			<c:if test="${member.ratingsBean.id != null }"> --%>
<!-- 			<div style="display: flex"> -->
<%-- 				<span>${member.cusName}，您好</span> --%>
<%-- 				<a class="nav-link" href="${contextRoot}/logout">登出 --%>
<!-- 				</a> -->
<!-- 			</div> -->
<%-- 			</c:if> --%>
			

<!-- 		</div> -->

<!-- 		<div class="search-form"> -->
<!-- 			<input type="search" id="search-box" placeholder="search here..."> -->
<!-- 			<label for="search-box" class="fas fa-search"></label> -->
<!-- 		</div> -->

<!-- 		<div class="cart-items-container"> -->
<!-- 			<div class="cart-item"> -->
<!-- 				<span class="fas fa-times"></span> <img src="images/cart-item-1.png" -->
<!-- 					alt=""> -->
<!-- 				<div class="content"> -->
<!-- 					<h3>cart item 01</h3> -->
<!-- 					<div class="price">$15.99/-</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="cart-item"> -->
<!-- 				<span class="fas fa-times"></span> <img src="images/cart-item-2.png" -->
<!-- 					alt=""> -->
<!-- 				<div class="content"> -->
<!-- 					<h3>cart item 02</h3> -->
<!-- 					<div class="price">$15.99/-</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="cart-item"> -->
<!-- 				<span class="fas fa-times"></span> <img src="images/cart-item-3.png" -->
<!-- 					alt=""> -->
<!-- 				<div class="content"> -->
<!-- 					<h3>cart item 03</h3> -->
<!-- 					<div class="price">$15.99/-</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="cart-item"> -->
<!-- 				<span class="fas fa-times"></span> <img src="images/cart-item-4.png" -->
<!-- 					alt=""> -->
<!-- 				<div class="content"> -->
<!-- 					<h3>cart item 04</h3> -->
<!-- 					<div class="price">$15.99/-</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<a href="#" class="btn">checkout now</a> -->
<!-- 		</div> -->

<!-- 	</header> -->
<!-- 	<br> -->
<!-- 	<br> -->
<!-- 	<br> -->

	<!-- header section ends -->


	<!-- <h1>廣告輪播</h1> -->

<!-- 	<div id="screenBox"> -->
<!-- 		<div id="list" style="left: 0px"> -->
<!-- 			<a href="https://www.drawnow.com.tw/course/content/9"><img -->
<!-- 				src="https://www.drawnow.com.tw/content/images/2021/07/20210725154714_banner.jpg" -->
<!-- 				alt="兒童桌遊得來速" /></a> <a href="https://boardgamer.org/"><img -->
<!-- 				src="https://boardgamer.org/wp-content/uploads/DBG_BANNER_1920x750px_202111292.jpg" -->
<!-- 				alt="桌遊好時光" /></a> <a -->
<!-- 				href="https://www.huashan1914.com/w/huashan1914/exhibition_20102013202243385"><img -->
<!-- 				src="https://media.huashan1914.com/WebUPD/huashan1914/exhibition/%E6%A1%8C%E9%81%8A%E5%AE%98%E7%B6%B2BN_20102013345694117.jpg" -->
<!-- 				alt="桌遊1+1" /></a> <a -->
<!-- 				href="https://www.accupass.com/event/1503301314201047087895"><img -->
<!-- 				src="https://static.accupass.com/userupload/18f1067aa7344189ae33384ea382d9b6.jpg" -->
<!-- 				alt="桌遊同樂遊" /></a> <a -->
<!-- 				href="http://idachdora.cheerydachshund.com/archives/189"><img -->
<!-- 				src="https://idachdora.cheerydachshund.com/wp-content/uploads/2015/01/850banner.jpg" -->
<!-- 				alt="幫助孩子左右腦發展" /></a> -->

<!-- 		</div> -->





<!-- 		<a href="javascript:;" class="arrow" id="prev" style="left: 20px;"> -->
<!-- 			<img -->
<!-- 			src="https://icon-library.com/images/arrow-png-icon/arrow-png-icon-5.jpg " -->
<!-- 			style="height: 40px; color: white; transform: rotateY(180deg);" /> -->
<!-- 		</a> <a href="javascript:;" class="arrow" id="next" style="right: 20px;"> -->
<!-- 			<img -->
<!-- 			src="https://icon-library.com/images/arrow-png-icon/arrow-png-icon-5.jpg " -->
<!-- 			style="height: 40px;" /> -->
<!-- 		</a> -->
<!-- 	</div> -->
<!-- 	<div id="movedot"> -->
<!-- 		<div id="buttons"> -->
<!-- 			<span index="1" class="on"></span> <span index="2"></span> <span -->
<!-- 				index="3"></span> <span index="4"></span> <span index="5"></span> -->
<!-- 		</div> -->
<!-- 	</div>A -->
	<!-- 廣告輪播 end -->
	
	<!-- 廣告輪播2 -->

	<div id="demo" class="carousel slide" data-ride="carousel" align="center">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
    <a href="https://www.drawnow.com.tw/course/content/9">
      <img src="https://www.drawnow.com.tw/content/images/2021/07/20210725154714_banner.jpg" alt="Los Angeles" width="1100" height="500"></a>
    </div>
    <div class="carousel-item">
      <img src="https://wowslider.com/sliders/demo-93/data1/images/lake.jpg" alt="Chicago" width="1100" height="500">
    </div>
    <div class="carousel-item">
      <img src="https://wowslider.com/sliders/demo-93/data1/images/lake.jpg" alt="New York" width="1100" height="500">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<!-- 廣告輪播2-end -->
	<!-- 最新消息 -->
	<!-- <div align="center">
        <div class="card text-center" style="width: 80vw;">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Active</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled">Disabled</a>
                    </li>
                </ul>
            </div>
            <div class="card-body">
                <h5 class="card-title">Special title treatment</h5>
                <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>
    </div> -->
	<!-- 最新消息end -->

	<section class="about" id="about">

		<h1 class="heading"></h1>

		<div class="row">

			<div class="image">
				<img src="image/servie.jfif" alt="">
			</div>

			<div class="content">
				<h3 style="font-size: 4rem;">服務項目</h3>
				<p style="font-size: 2rem;">瘋桌遊旨在提供歡樂的好場域，並帶來最
					佳遊戲體驗，門市除了專業的解說人員及 舒適的空間，更延伸多種進階服務項目， 包含活動及課程規劃與桌遊產品開發。</p>
				<a href="#" class="btn">learn more</a>
			</div>

		</div>

	</section>



	<!-- contact section starts  -->

	<section class="contact" id="contact">

		<h1 class="heading">
			<span>聯絡我們</span>
		</h1>

		<div class="row">

			<iframe class="map"
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.7668105713533!2d121.54383974988332!3d25.041986544048036!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abda86e156b7%3A0x38b039d7316405f4!2z5qGM6YGK5Zyw5LiL5Z-OIHwg5p2x5Y2A5pyA5aSn5qGM6YGK56m66ZaTIHwg5Y-v55So54aK5aW9IHwg6JedRnVu5Yi4IHwg5qGM6YGK546pfOiyt3znp5985rS75YuV6KaP5YqD!5e0!3m2!1szh-TW!2stw!4v1645933666383!5m2!1szh-TW!2stw"
				allowfullscreen="" loading="lazy"></iframe>

			<form action="">
				<h3>基本資料</h3>
				<div class="inputBox">
					<span class="fas fa-user"></span> <input type="text"
						placeholder="姓名">
				</div>
				<div class="inputBox">
					<span class="fas fa-envelope"></span> <input type="email"
						placeholder="email">
				</div>
				<div class="inputBox">
					<span class="fas fa-phone"></span> <input type="text"
						placeholder="連絡電話">
				</div>
				<input type="submit" value="確認" class="btn">
			</form>

		</div>

	</section>

	<!-- contact section ends -->


	<!-- footer section starts  -->

	<section class="footer">

		<div class="share">
			<a href="#" class="fab fa-facebook-f"></a> <a href="#"
				class="fab fa-twitter"></a> <a href="#" class="fab fa-instagram"></a>
			<!-- <a href="#" class="fab fa-linkedin"></a> -->
			<a href="#" class="fab fa-pinterest"></a>
		</div>

		<div class="links">
			<a href="#">常見問題</a> <a href="#">全台門市</a> <a href="#">首次舉辦活動</a> <a
				href="#">活動上架規範</a> <a href="#">活動人社群</a> <a href="#">帳號中心</a> <a
				href="#">服務項目</a> <a href="#">聯絡我們</a> <a href="addBooking">線上訂位</a>
		</div>

		<div class="credit">
			© 2020 PHANTASIA Co. Ltd. <span>Phantasia Trademark belong to
				their respective owners.</span> | All Rights Reserved.
		</div>
	</section>

	<!-- footer section ends -->


	<script>
		//網頁完全載入後，再執行
		window.onload = function() {
			var list = document.getElementById('list');
			var prev = document.getElementById('prev');
			var next = document.getElementById('next');
			var screenBox = document.getElementById('screenBox');
			var buttons = document.getElementById('buttons')
					.getElementsByTagName('span');
			var index = 1;

			//自動輪播
			function recycleAD(picLength) {
				var newLeft = parseInt(list.style.left) + picLength;
				list.style.left = newLeft + 'px';
				list.style.transition = '300ms ease';
				if (newLeft < -6980) {
					list.style.left = 0 + 'px';
				}
				if (newLeft > 0) {
					list.style.left = -6980 + 'px';
				}
			}
			//計時器
			var timer;
			var speed = 0;
			function autoplay() {
				if (speed == 0) {
					timer = setInterval(function() {
						next.onclick()
					}, 3000);
					speed = 1;
				}
			}

			autoplay();

			function stopplay() {
				clearInterval(timer);
				speed = 0;
			}

			function showButton() {
				for (let i = 0; i < buttons.length; i++) {
					if (buttons[i].className == 'on') {
						buttons[i].className = '';
					}
				}
				buttons[index - 1].className = 'on';

			}

			prev.onclick = function() {
				index -= 1;
				if (index < 1) {
					index = 5;
				}

				showButton();
				recycleAD(1745);

			}

			next.onclick = function() {
				index += 1;
				if (index > 5) {
					index = 1;
				}
				showButton();
				recycleAD(-1745);

			}

			for (var i = 0; i < buttons.length; i++) {
				buttons[i].onclick = function() {
					event.stopPropagation();
					var clickIndex = parseInt(this.getAttribute('index'));
					var offset = 1745 * (index - clickIndex);
					recycleAD(offset);
					index = clickIndex;
					showButton();

				}
			}

			screenBox.onmouseover = stopplay;
			screenBox.onmouseout = autoplay;
		}
	</script>

</body>
</html>