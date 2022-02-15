<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*
	.nav-link{background:#4E73DF !important}
	.sidebar p{color:white !important}
	.main-sidebar{background:#4E73DF !important}
	*/
	.main-sidebar{background-color: #4E73DF;}
	.main-sidebar a{color: white !important;}
	.brand-link{
		text-align: center;
		border-bottom: 1px solid lightgray !important;
	}
	.sidebar-menufont{
		
		font-weight: bold;
	}
	.cus-li{padding-left: 20px;}
	.sidebar-li-font{font-size: 13px;}
</style>
</head>
<body>
	
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
	  <!-- Brand Logo -->
	  <a href="index3.html" class="brand-link">
	    <!--<img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">-->
	    <span class="brand-text font-weight-bold text-white">Workever</span>
	  </a>
	
	  <!-- Sidebar -->
	  <div class="sidebar">
	    <!-- Sidebar user panel (optional) -->
	    <div class="user-panel mt-3 pb-3 mb-3 d-flex" style="border-bottom: 1px solid lightgray;">
	      <div class="image">
	        <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
	      </div>
	      <div class="info">
	        <a href="#" class="d-block">Alexander Pierce</a>
	      </div>
	    </div>
	
	    <!-- SidebarSearch Form 
	    <div class="form-inline">
	      <div class="input-group" data-widget="sidebar-search">
	        <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
	        <div class="input-group-append">
	          <button class="btn btn-sidebar">
	            <i class="fas fa-search fa-fw"></i>
	          </button>
	        </div>
	      </div>
	    </div>
		-->
	
	    <!-- Sidebar Menu -->
	    <nav class="mt-2">
	      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
	        <!-- Add icons to the links using the .nav-icon class
	             with font-awesome or any other icon font library -->
	        <li class="nav-item ">
	          <a href="#" class="nav-link">
	            <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
	            <p class="sidebar-menufont" align="center">
	              HOME
	              <i class="right fas fa-angle-left"></i>
	            </p>
	          </a>
	        </li>

			<c:choose>
				<c:when test="${ loginUser.userAuth == 'S'}">
					<div>
						<!-- 사원 계정관리 -->
						<li class="nav-item ">
							<a href="mypage.do" class="nav-link">
								<!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
								<p class="sidebar-menufont" align="center">
									계정 관리
									<i class="right fas fa-angle-left"></i>
								</p>
							</a>
						</li>
						
						<!-- 사원 비밀번호 설정 -->
						<li class="nav-item ">
							<a href="changepwd.do" class="nav-link">
								<!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
								<p class="sidebar-menufont" align="center">
									비밀번호 설정
									<i class="right fas fa-angle-left"></i>
								</p>
							</a>
						</li>
					</div>
				</c:when>
				<c:otherwise>
					<div>
						<!-- 관리자 계정관리 -->
						<li class="nav-item ">
							<a href="mypage.do" class="nav-link">
								<!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
								<p class="sidebar-menufont" align="center">
									계정 관리
									<i class="right fas fa-angle-left"></i>
								</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="./index.html" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>계정정보 수정</p>
									</a>
								</li>
								<li class="nav-item">
									<a href="changepwd.do" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>비밀번호 변경</p>
									</a>
								</li>
							</ul>
						</li>
						
						<!-- 관리자 사원정보 관리 -->
						<li class="nav-item ">
							<a href="#" class="nav-link">
								<!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
								<p class="sidebar-menufont" align="center">
									사원정보 관리
									<i class="right fas fa-angle-left"></i>
								</p>
							</a>
							<ul class="nav nav-treeview">
								<li class="nav-item">
									<a href="'userenable.ad?cno=' + '${loginUser.comNo}'" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>사원 승인</p>
									</a>
								</li>
								<li class="nav-item">
									<a href="usermanage.ad" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>사원정보 수정</p>
									</a>
								</li>
							</ul>
						</li>
		
					</div>
				</c:otherwise>
			</c:choose>
			
	    </nav>
	    <!-- /.sidebar-menu -->
	  </div>
	  <!-- /.sidebar -->
	</aside>

</body>
</html>