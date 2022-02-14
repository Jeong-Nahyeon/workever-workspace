<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- alertify -->
<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<style>
	.img-circle{
		width: 30px;
		height: 30px;
		margin-left: 5px;
	}
	#line-area{
		width: 0; height: auto;
		margin-left: 10px;
		border-right: 1px solid #e3e6f0;
	}

	#profile-image, #profile-icon{
		text-align: center;
		margin: 20px 20px;
	}
	#profile-image img{width: 30px; height: 30px;}
	#profile-image i{width: 50px; height: 50px;}

	#company-area a{color: lightslategray;}
	#company-font{
		margin-left: 10px;
		font-weight: 900;
	}

	.text-overflow {
		width: 190px; /* 말줄임 처리 위해 width 설정 */
		height: 21px; /* 상동 */
		display: block; /* 너비를 가질 수 있도록 설정 */
		white-space: nowrap !important; /* 내용이 넘치면 자동줄바꿈되는 것을 해제 */
		overflow: hidden; /* 넘치는 부분을 hidden */
		text-overflow: ellipsis; /* 텍스트의 말줄임표(...) 처리 */
	}

	.profile-textArea{
		padding: 0;
		display: table;

	.scrollCustom {
		width: 300px; 
		height: 250px; 
		overflow-y: auto; /* 가로 넘으면 알아서 스크롤 만들어 줘 */
	}

	/* 스크롤바 설정 */
	.scrollCustom::-webkit-scrollbar{
    	width: 4px;
	}

	/* 스크롤바 막대 설정*/
	.scrollCustom::-webkit-scrollbar-thumb{
		height: 10%; /* 막대 높이 설정 */
		background-color: #4E73DF;
		border-radius: 10px;    
	}

	/* 스크롤바 뒷 배경 설정*/
	.scrollCustom::-webkit-scrollbar-track{
		background-color: rgba(0,0,0,0);
	}


</style>
</head>
<body>
	
	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	
	<!-- Navbar -->
	<nav class="main-header navbar navbar-expand navbar-white navbar-light">
	  <!-- Left navbar links -->
	  <ul class="navbar-nav">
	    <li class="nav-item">
	      <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
	    </li>
	  </ul>

	  <div id="company-area" style="margin-left:50px">
		<a class="nav-link" href="">
			<i class="far fa-building fa-lg"></i>
			<span id="company-font">당근나라</span>
		</a>
	  </div>
	
	  <!-- Right navbar links -->
	  <ul class="navbar-nav ml-auto">
	    <!-- Navbar Search -->
	    <li class="nav-item">
	      <a class="nav-link" data-widget="navbar-search" href="#" role="button">
	        <i class="fas fa-search"></i>
	      </a>
	      <div class="navbar-search-block">
	        <form class="form-inline">
	          <div class="input-group input-group-sm">
	            <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
	            <div class="input-group-append">
	              <button class="btn btn-navbar" type="submit">
	                <i class="fas fa-search"></i>
	              </button>
	              <button class="btn btn-navbar" type="button" data-widget="navbar-search">
	                <i class="fas fa-times"></i>
	              </button>
	            </div>
	          </div>
	        </form>
	      </div>
	    </li>
	
	    <!-- Messages Dropdown Menu -->
	    <li class="nav-item dropdown">
	      <a class="nav-link" data-toggle="dropdown" href="#">
	        <i class="far fa-comments"></i>
			<!-- 읽지 않은 채팅 알림 개수 -->
	        <span class="badge badge-danger navbar-badge">3</span>
	      </a>

	      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
			<div class="media">
			  <a href="javascript:void(0);" onclick="invitationPopup();" class="dropdown-item dropdown-footer"><i class="far fa-comments"></i>&ensp;채팅 추가</a>
			</div>

			<script>
				function invitationPopup(){
					window.open("invitation.ch", "chatInvitation", "width=400, height=500");
				}
			</script>

			<div class="media" style="width: 90%; margin-left: 5%;">
				<input type="search" class="form-control form-control-sm" placeholder="사원 이름 검색">
					<div class="input-group-append">
						<button type="submit" class="btn btn-sm btn-default">
							<i class="fa fa-search"></i>
						</button>
					</div>
			</div>
			<div class="dropdown-divider" style="margin-top: 10px;"></div>

			<div>
				<a href='javascript:void(0);' onclick="chatPopup();" class="dropdown-item">

					<script>
						function chatPopup(){
							window.open("detail.ch", "chat", "width=400, height=500");
						}
					</script>
				
				<div class="scrollCustom">
					<!-- Message Start -->
					<div class="media">
						<!-- 사원 프로필 사진 -->
						<img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
						<div class="media-body">
						<span class="dropdown-item-title">
							사원 이름
						</span>
						<span class="badge badge-danger" style="float: right;">3</span>
						<p class="text-sm text-overflow">안녕하세요 글 길게 쓰면 글 줄여주세요</p>
						<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
						</div>
					</div>
					<!-- Message End -->
					</a>
					<div class="dropdown-divider"></div>
	
					<a href="#" class="dropdown-item">
					<!-- Message Start -->
					<div class="media">
						<img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
						<h3 class="dropdown-item-title">
							John Pierce
							<span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
						</h3>
						<p class="text-sm">I got your message bro</p>
						<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
						</div>
					</div>
					<!-- Message End -->
					</a>
					<div class="dropdown-divider"></div>
					<a href="#" class="dropdown-item">
					<!-- Message Start -->
					<div class="media">
						<img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
						<div class="media-body">
						<h3 class="dropdown-item-title">
							Nora Silvester
							<span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
						</h3>
						<p class="text-sm">The subject goes here</p>
						<p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
						</div>
					</div>
					<!-- Message End -->
					</a>

				</div>

				<div class="dropdown-divider"></div>
				<a href="addressBook.do" class="dropdown-item dropdown-footer">
					<i class="far fa-user"></i>&ensp;연락처</a>
			</div>
		  </div>
	    </li>

	    <!-- Notifications Dropdown Menu -->
	    <li class="nav-item dropdown">
	      <a class="nav-link" data-toggle="dropdown" href="#">
	        <i class="far fa-bell"></i>
	        <span class="badge badge-warning navbar-badge">15</span>
	      </a>
	      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
	        <span class="dropdown-item dropdown-header">15 Notifications</span>
	        <div class="dropdown-divider"></div>
	        <a href="#" class="dropdown-item">
	          <i class="fas fa-envelope mr-2"></i> 4 new messages
	          <span class="float-right text-muted text-sm">3 mins</span>
	        </a>
	        <div class="dropdown-divider"></div>
	        <a href="#" class="dropdown-item">
	          <i class="fas fa-users mr-2"></i> 8 friend requests
	          <span class="float-right text-muted text-sm">12 hours</span>
	        </a>
	        <div class="dropdown-divider"></div>
	        <a href="#" class="dropdown-item">
	          <i class="fas fa-file mr-2"></i> 3 new reports
	          <span class="float-right text-muted text-sm">2 days</span>
	        </a>
	        <div class="dropdown-divider"></div>
	        <a href="#" class="dropdown-item dropdown-footer">See All Notifications</a>
	      </div>
	    </li>
	    
		<!-- 프로필 영역 -->
		<div id="line-area"></div>
		<li class="nav-item dropdown">
			<a class="nav-link profile-textArea" data-toggle="dropdown" href="#">
				<div style="display: table-cell; vertical-align: middle;  padding-right: 5px;">
					<span>${loginUser.userName}</span>
				</div>
				<c:choose>
					<c:when test="${ loginUser.userFilePath != null }">
						<img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
					</c:when>
					<c:otherwise>
						<div style="display: table-cell; vertical-align: middle;">
							<i class="fas fa-user-circle fa-2x" ></i>
						</div>
					</c:otherwise>
				</c:choose>
			</a>
			<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
				<div id="profile-image">
				
					<c:choose>
						<c:when test="${ loginUser.userFilePath != null }">
							<img src="dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
							<br>
						</c:when>
						<c:otherwise>
							<div>
								<i class="fas fa-user-circle fa-3x"></i>
							</div>
						</c:otherwise>
					</c:choose>
					<span>${loginUser.userName}</span>
				</div>
				<div style="height: 0; border-bottom: 1px solid #e3e6f0;"></div>
				<div id="profile-icon">
					<a class="nav-link" href="mypage.do">
						<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
						<span style="font-size: 11px;">마이페이지</span>
					</a>
					<a class="nav-link" href="">
						<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
						<span style="font-size: 11px;">로그아웃</span>
					</a>
				</div>
			</div>
		</li>
	  </ul>
	</nav>
	<!-- /.navbar -->
	
</body>
</html>