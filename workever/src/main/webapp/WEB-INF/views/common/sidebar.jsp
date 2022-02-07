<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	          <a href="#" class="nav-link active">
	            <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
	            <p class="sidebar-menufont" align="center">
	              메일
	              <i class="right fas fa-angle-left"></i>
	            </p>
	          </a>
	          <ul class="nav nav-treeview">
	            <li class="nav-item">
	              <a href="./index.html" class="nav-link">
	                <i class="far fa-circle nav-icon"></i>
	                <p>받은메일함</p>
	              </a>
	            </li>
	            <li class="nav-item">
	              <a href="./index2.html" class="nav-link">
	                <i class="far fa-circle nav-icon"></i>
	                <p>보낸메일함</p>
	              </a>
	            </li>
	            <li class="nav-item">
	              <a href="./index3.html" class="nav-link">
	                <i class="far fa-circle nav-icon"></i>
	                <p>삭제메일함</p>
	              </a>
	            </li>
	          </ul>
	        </li>

			<!-- 근태관리 -->
			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					근태관리
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
				<ul class="nav nav-treeview">
				  <li class="nav-item">
					<a href="./index.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>출퇴근 관리</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index2.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>월 근무내역</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index3.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>휴가 관리</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index3.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>연장근무 관리</p>
					</a>
				  </li>
				</ul>
			</li>

			<!-- 업무관리 -->
			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					업무관리
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
				<ul class="nav nav-treeview">
				  <li class="nav-item">
					<a href="enroll.pro" class="nav-link">
					  &nbsp;&nbsp;<i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;
					  <p>새 프로젝트</p>
					</a>
				  </li>
				
				  <li class="nav-item">
					<a href="list.pro" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>프로젝트 조회</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>내 프로젝트</p>
					  <i class="right fas fa-angle-left"></i>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item cus-li">
							<a href="" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">인사팀</p>
							</a>
						</li>
						<li class="nav-item cus-li">
							<a href="" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">마케팅팀</p>
							</a>
						</li>
						<li class="nav-item cus-li">
							<a href="" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">개발팀</p>
							</a>
						</li>
					</ul>
				  </li>
				</ul>
			</li>

			<!-- 일정관리 -->
			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					일정관리
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
				<ul class="nav nav-treeview">
				  <li class="nav-item">
					<a href="./index.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>ToDo</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index2.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>캘린더</p>
					  <i class="right fas fa-angle-left"></i>
					</a>
					<ul class="nav nav-treeview">
						<li class="nav-item cus-li">
							<a href="" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">전체일정</p>
							</a>
						</li>
						<li class="nav-item cus-li">
							<a href="" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">부서별일정</p>
							</a>
						</li>
						<li class="nav-item cus-li">
							<a href="" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">전사일정</p>
							</a>
						</li>
						<li class="nav-item cus-li">
							<a href="" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">개인일정</p>
							</a>
						</li>
					</ul>
				  </li>
				</ul>
			</li>

			<!-- 전자결재 -->
			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					전자결재
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
				<ul class="nav nav-treeview">
				  <li class="nav-item">
					<a href="./index.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>내가 작성한 결재</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index2.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>내가 수신한 결재</p>
					</a>
				  </li>
				</ul>
			</li>

			<!-- 커뮤니티 -->
			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					커뮤니티
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
				<ul class="nav nav-treeview">
				  <li class="nav-item">
					<a href="./index.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>공지사항</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index2.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>부서별 게시판</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index3.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>익명 게시판</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index3.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>나의 게시글</p>
					</a>
				  </li>
				</ul>
			</li>

			<!-- 회의실예약 -->
			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					회의실예약
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
			</li>

			<!-- 조직도 -->
			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					조직도
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
				<ul class="nav nav-treeview">
				  <li class="nav-item">
					<a href="./index.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>Dashboard v1</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index2.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>Dashboard v2</p>
					</a>
				  </li>
				  <li class="nav-item">
					<a href="./index3.html" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>Dashboard v3</p>
					</a>
				  </li>
				</ul>
			</li>
			
	    </nav>
	    <!-- /.sidebar-menu -->
	  </div>
	  <!-- /.sidebar -->
	</aside>

</body>
</html>