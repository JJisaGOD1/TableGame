<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<c:set var="contextRoot" value="${pageContext.request.contextPath}"></c:set>
<link href="${contextRoot}/css/bootstrap.min.css" rel="stylesheet" />

<meta charset="UTF-8">
    <title> Responsiive Admin Dashboard | CodingLab </title>
    <link href="${contextRoot}/css/dashboard.css" rel="stylesheet" />

    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     
</head>
<body>

<div class="sidebar close">
    <div class="logo-details">
      <i class='bx bxs-dice-5'></i>
      <span class="logo_name">瘋桌遊</span>
    </div>
    <ul class="nav-links">
      <li>
        <a>
          <i class='bx bx-user' ></i>
          <span class="link_name">會員管理</span>
        </a>
        <ul class="sub-menu blank">
        <li><a class="link_name" >會員管理</a></li>
          <li><a href="${contextRoot}/viewCustomer/1">查看會員</a></li>
          <li><a href="${contextRoot}/viewMembers/1">查看員工</a></li>
          <li><a href="${contextRoot}/addManager">新增員工</a></li>
        </ul>
      </li>
      <li>
        <div class="iocn-link">
          <a href="#">
            <i class='bx bx-box' ></i>
            <span class="link_name">商品管理</span>
          </a>
          <i class='bx bxs-chevron-down arrow' ></i>
        </div>
        <ul class="sub-menu">
          <li><a class="link_name" href="#">商品管理</a></li>
          <li><a href="#">查看商品</a></li>
          <li><a href="#">新增商品</a></li>
          <li><a href="#">訂單處理</a></li>
          <li><a href="#">我們提供的商品</a></li>
        </ul>
      </li>
      <li>
        <div class="iocn-link">
          <a href="#">
            <i class='bx bxs-bowl-hot' ></i>
            <span class="link_name">餐點管理</span>
          </a>
          <i class='bx bxs-chevron-down arrow' ></i>
        </div>
        <ul class="sub-menu">
          <li><a class="link_name" href="#">餐點管理</a></li>
          <li><a href="#">查看訂單</a></li>
          <li><a href="#">查看餐點</a></li>
          <li><a href="#">新增餐點</a></li>
        </ul>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-grid-alt' ></i>
          <span class="link_name">開團管理</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="#">開團管理</a></li>
        </ul>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-book-alt' ></i>
          <span class="link_name">訂位管理</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="#">訂位管理</a></li>
        </ul>
      </li>
      <li>
        <div class="iocn-link">
          <a href="#">
            <i class='bx bx-message' ></i>
            <span class="link_name">留言管理</span>
          </a>
          <i class='bx bxs-chevron-down arrow' ></i>
        </div>
        <ul class="sub-menu">
          <li><a class="link_name" >留言管理</a></li>
          <li><a href="${contextRoot}/viewComments">留言查看</a></li>
          <li><a href="${contextRoot}/serverService">線上客服</a></li>
        </ul>
      </li>
      <!-- <li>
        <a href="#">
          <i class='bx bx-compass' ></i>
          <span class="link_name">Explore</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="#">Explore</a></li>
        </ul>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-history'></i>
          <span class="link_name">History</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="#">History</a></li>
        </ul>
      </li>
      <li>
        <a href="#">
          <i class='bx bx-cog' ></i>
          <span class="link_name">Setting</span>
        </a>
        <ul class="sub-menu blank">
          <li><a class="link_name" href="#">Setting</a></li>
        </ul>
      </li> -->
      <li>
    <div class="profile-details">
      <div class="profile-content">
        <img src="image/profile.jpg" alt="profileImg">
      </div>
      <div class="name-job">
        <div class="profile_name">Prem Shahi</div>
        <div class="job">Web Desginer</div>
      </div>
      <i class='bx bx-log-out' ></i>
    </div>
  </li>
</ul>
  </div>
  <section class="home-section">
    <div class="home-content">
      <i class='bx bx-menu' ></i>
      <span class="text">Drop Down Sidebar</span>
    </div>
  </section>

  <script>
  let arrow = document.querySelectorAll(".arrow");
  for (var i = 0; i < arrow.length; i++) {
    arrow[i].addEventListener("click", (e)=>{
   let arrowParent = e.target.parentElement.parentElement;//selecting main parent of arrow
   arrowParent.classList.toggle("showMenu");
    });
  }

  let sidebar = document.querySelector(".sidebar");
  let sidebarBtn = document.querySelector(".bx-menu");
  console.log(sidebarBtn);
  sidebarBtn.addEventListener("click", ()=>{
    sidebar.classList.toggle("close");
  });

  </script>

</body>
</html>