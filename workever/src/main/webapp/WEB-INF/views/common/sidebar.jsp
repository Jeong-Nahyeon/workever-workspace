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
	
	
	.sidebar-dark-primary .nav-sidebar>.nav-item>.nav-link.active, .sidebar-light-primary .nav-sidebar>.nav-item>.nav-link.active {
    	background-color: transparent;
	}
	
	[class*=sidebar-dark-] .nav-sidebar>.nav-item>.nav-link.active {
    	box-shadow:none !important;
	}
	/*
	.sidebar-dark-primary .nav-sidebar>.nav-item>.nav-link.active, .sidebar-light-primary .nav-sidebar>.nav-item>.nav-link.active:hover {
    	background-color: rgba(255,255,255,.1);
	}
	*/
</style>
</head>
<body>
	
	<!-- Main Sidebar Container -->
	<aside class="main-sidebar sidebar-dark-primary elevation-4">
	  <!-- Brand Logo -->
	  <a href="main.do" class="brand-link">
	    <!--<img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">-->
	    <span class="brand-text font-weight-bold text-white">Workever</span>
	  </a>
	
	  <!-- Sidebar -->
	  <div class="sidebar">
	    <!-- Sidebar user panel (optional) -->
	    <!-- 
	    <div class="user-panel mt-3 pb-3 mb-3 d-flex" style="border-bottom: 1px solid lightgray;">
	      <div class="image">
	        <img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
	      </div>
	      <div class="info">
	        <a href="#" class="d-block">Alexander Pierce</a>
	      </div>
	    </div>
	    -->
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
	        <li class="nav-item">
	          <a href="#" class="nav-link active">
	            <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
	            <p class="sidebar-menufont" align="center">
					메일
					<i class="right fas fa-angle-left"></i>
				</p>
	          </a>
	          <ul class="nav nav-treeview">
	          <c:choose>
	          	 <c:when test="${ loginUser.userRank ne '관리자' }">
		            <li class="nav-item">
		              <a href="compose.mail" class="nav-link">
		                <i class="fas fa-plus nav-icon"></i>
		                <p>메일 작성하기</p>
		              </a>
		            </li>
		            <li class="nav-item">
		              <a href="inbox.mail" class="nav-link">
		                <i class="far fa-circle nav-icon"></i>
		                <p>받은메일함</p>
		              </a>
		            </li>
		            <li class="nav-item">
		              <a href="outbox.mail" class="nav-link">
		                <i class="far fa-circle nav-icon"></i>
		                <p>보낸메일함</p>
		              </a>
		            </li>
		            <li class="nav-item">
		              <a href="trashbox.mail" class="nav-link">
		                <i class="far fa-circle nav-icon"></i>
		                <p>삭제메일함</p>
		              </a>
		            </li>
		            </c:when>
		            <c:otherwise>
		            	<p style="color:white; text-align:center;">사원만 이용가능합니다.</p>
		            </c:otherwise>
	            </c:choose>
	          </ul>
	        </li>

			<li class="nav-item ">
				<a href="#" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					근태관리
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
				<c:choose>
					<c:when test="${ loginUser.userAuth eq 'S' }">
						<ul class="nav nav-treeview">
						  <li class="nav-item">
							<a href="commute.cm" class="nav-link">
							  <i class="far fa-circle nav-icon"></i>
							  <p>출퇴근 관리</p>
							</a>
						  </li>
						  <li class="nav-item">
							<a href="commute.wh" class="nav-link">
							  <i class="far fa-circle nav-icon"></i>
							  <p>근무내역</p>
							</a>
						  </li>
						  <li class="nav-item">
							<a href="commute.do" class="nav-link">
							  <i class="far fa-circle nav-icon"></i>
							  <p>휴가 관리</p>
							</a>
						  </li>
						  <li class="nav-item">
							<a href="commute.ot" class="nav-link">
							  <i class="far fa-circle nav-icon"></i>
							  <p>연장근무 관리</p>
							</a>
						  </li>
						</ul>
					</c:when>
					
					<c:otherwise>
						<!-- 근태관리 admin -->
						<ul class="nav nav-treeview">
						  <li class="nav-item">
							<a href="adCommute.cm" class="nav-link">
							  <i class="far fa-circle nav-icon"></i>
							  <p>출퇴근 관리</p>
							</a>
						  </li>
						  <li class="nav-item">
							<a href="adCommute.do" class="nav-link">
							  <i class="far fa-circle nav-icon"></i>
							  <p>휴가 관리</p>
							</a>
						  </li>
						  <li class="nav-item">
							<a href="adCommute.ot" class="nav-link">
							  <i class="far fa-circle nav-icon"></i>
							  <p>연장근무 관리</p>
							</a>
						  </li>
						</ul>
					</c:otherwise>
				</c:choose>
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
					<a href="#" onclick="proList(${loginUser.userNo});" class="nav-link">
					  <i class="far fa-circle nav-icon"></i>
					  <p>프로젝트 조회</p>
					</a>
				  </li>	
				  <script>
				 	 function proList(userNo){
				 		 location.href="list.pro?userNo="+userNo;
				 	 }
				  </script>		 
				  <!--  
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
				  -->
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
					<a href="todo.do" class="nav-link">
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
							<a href="companyCalendar.do" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">전사일정</p>
							</a>
						</li>
						<li class="nav-item cus-li">
							<a href="deptCalendar.do" class="nav-link">
								<i class="far fa-circle nav-icon"></i>
								<p class="sidebar-li-font">부서별일정</p>
							</a>
						</li>
						<li class="nav-item cus-li">
							<a href="userCalendar.do" class="nav-link">
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
					<c:choose>
						<c:when test="${ loginUser.userAuth eq 'A' }">
							<li class="nav-item">
								<a href="admin.ap" class="nav-link">
								  <i class="far fa-circle nav-icon"></i>
								  <p>결재 양식 관리</p>
								</a>
							  </li>
						</c:when>
						<c:otherwise>
							  <li class="nav-item">
								<a href="enrollForm.ap" class="nav-link">
								  &nbsp;&nbsp;<i class="fas fa-plus"></i>&nbsp;&nbsp;&nbsp;
								  <p>결재 작성하기</p>
								</a>
							  </li>
							  <li class="nav-item">
								<a href="writeList.ap" class="nav-link">
								  <i class="far fa-circle nav-icon"></i>
								  <p>내가 작성한 결재</p>
								</a>
							  </li>
							  <li class="nav-item">
								<a href="receiveList.ap" class="nav-link">
								  <i class="far fa-circle nav-icon"></i>
								  <p>내가 수신한 결재</p>
								</a>
							  </li>
						</c:otherwise>
					</c:choose>
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
					<a href="list.nbo" class="nav-link" style="display: inline-block; width: 160px;">
					  <i class="far fa-circle nav-icon"></i>
					  공지사항
					</a>
					<c:if test="${ loginUser.userRank eq '관리자' }">
						<a href="enrollForm.nbo" class="btn btn-sm btn-default" style="color:#4E73DF !important; font-size: 10px; font-weight: bolder;">공지작성</a>
					</c:if>
				  </li>
				  <c:if test="${ loginUser.userRank ne '관리자' }">
					  <li class="nav-item">
						<a href="list.dbo" class="nav-link">
						  <i class="far fa-circle nav-icon"></i>
						  <p>부서별 게시판</p>
						</a>
					  </li>
				  </c:if>
				  <li class="nav-item">
					<a href="list.abo" class="nav-link" style="display: inline-block; width: 160px;">
					  <i class="far fa-circle nav-icon"></i>
					   익명 게시판
					</a>
					<c:if test="${ loginUser.userRank eq '관리자' }">
						<a href="list.bo" class="btn btn-sm btn-default" style="color:#4E73DF !important; font-size: 10px; font-weight: bolder;">신고관리</a>
					</c:if>
				  </li>
				  <c:if test="${ loginUser.userRank ne '관리자' }">
					  <li class="nav-item">
						<a href="list.mdbo" class="nav-link">
						  <i class="far fa-circle nav-icon"></i>
						  <p>나의 게시글</p>
						</a>
					  </li>
				  </c:if>
				</ul>
			</li>

			<!-- 회의실예약 -->
			<c:choose>
				<c:when test="${ loginUser.userAuth eq 'A' }">
					<li class="nav-item ">
						<a href="admin.mr" class="nav-link">
						  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
						  <p class="sidebar-menufont" align="center">
							회의실 관리
							<i class="right fas fa-angle-left"></i>
						  </p>
						</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item ">
						<a href="reservation.mr" class="nav-link">
						  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
						  <p class="sidebar-menufont" align="center">
							회의실 예약
							<i class="right fas fa-angle-left"></i>
						  </p>
						</a>
					</li>
				</c:otherwise>
			</c:choose>
			

			<!-- 조직도 -->
			<li class="nav-item ">
				<a href="organogram.do" class="nav-link">
				  <!--<i class="nav-icon fas fa-tachometer-alt"></i>-->
				  <p class="sidebar-menufont" align="center">
					조직도
					<i class="right fas fa-angle-left"></i>
				  </p>
				</a>
			</li>
		  </ul>
	    </nav>
	    <!-- /.sidebar-menu -->
	  </div>
	  <!-- /.sidebar -->
	</aside>

</body>
</html>