<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<style>

</style>
</head>

<body class="hold-transition sidebar-mini">

	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<br>

			<!-- 주소록 검색 -->
			<div class="col-md-8 offset-md-2">
				<form action="simple-results.html">
					<div class="input-group">
						<input type="search" class="form-control form-control-lg" placeholder="사원 이름/부서 검색">
						<div class="input-group-append">
							<button type="submit" class="btn btn-lg btn-default">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>

			<br>

			<!-- 주소록 -->
			<section class="content">

				<!-- Default box -->
				<div class="card card-solid">
				  	<div class="card-body pb-0">
						<div class="row">
							
							
							<c:forEach var="u" items="${ list }" >
							<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
								<div class="card bg-light d-flex flex-fill">
									<div class="card-header text-muted border-bottom-0">
									No.${ u.userNo }
									</div>

									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead"><b>${ u.userName }</b></h2>
												<br>
												<ul class="ml-4 mb-0 fa-ul text-muted">
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>${ u.deptName }</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>${ u.userEmail }</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>${ u.userPhone }</li> <br>
												</ul>
											</div>
											<div class="col-5 text-center"">
												<img src="" alt="user-img" class="img-circle img-fluid">
											</div>
										</div>
									</div>
								
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal">
												<i class="fas fa-comments"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							
							<!--
							<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
								<div class="card bg-light d-flex flex-fill">
									<div class="card-header text-muted border-bottom-0">
									no.1
									</div>

									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead"><b>사원 이름</b></h2>
												<br>
												<ul class="ml-4 mb-0 fa-ul text-muted">
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>부서</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>이메일</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>전화번호</li> <br>
												</ul>
											</div>
											<div class="col-5 text-center">
												<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
											</div>
										</div>
									</div>
								
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal">
												<i class="fas fa-comments"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
								<div class="card bg-light d-flex flex-fill">
									<div class="card-header text-muted border-bottom-0">
									no.1
									</div>

									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead"><b>사원 이름</b></h2>
												<br>
												<ul class="ml-4 mb-0 fa-ul text-muted">
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>부서</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>이메일</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>전화번호</li> <br>
												</ul>
											</div>
											<div class="col-5 text-center">
												<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
											</div>
										</div>
									</div>
								
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal">
												<i class="fas fa-comments"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
								<div class="card bg-light d-flex flex-fill">
									<div class="card-header text-muted border-bottom-0">
									no.1
									</div>

									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead"><b>사원 이름</b></h2>
												<br>
												<ul class="ml-4 mb-0 fa-ul text-muted">
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>부서</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>이메일</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>전화번호</li> <br>
												</ul>
											</div>
											<div class="col-5 text-center">
												<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
											</div>
										</div>
									</div>
								
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal">
												<i class="fas fa-comments"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
								<div class="card bg-light d-flex flex-fill">
									<div class="card-header text-muted border-bottom-0">
									no.1
									</div>

									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead"><b>사원 이름</b></h2>
												<br>
												<ul class="ml-4 mb-0 fa-ul text-muted">
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>부서</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>이메일</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>전화번호</li> <br>
												</ul>
											</div>
											<div class="col-5 text-center">
												<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
											</div>
										</div>
									</div>
								
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal">
												<i class="fas fa-comments"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
								<div class="card bg-light d-flex flex-fill">
									<div class="card-header text-muted border-bottom-0">
									no.1
									</div>

									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead"><b>사원 이름</b></h2>
												<br>
												<ul class="ml-4 mb-0 fa-ul text-muted">
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>부서</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>이메일</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>전화번호</li> <br>
												</ul>
											</div>
											<div class="col-5 text-center">
												<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
											</div>
										</div>
									</div>
								
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal">
												<i class="fas fa-comments"></i>
											</a>
										</div>
									</div>
								</div>
							</div>

							<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column">
								<div class="card bg-light d-flex flex-fill">
									<div class="card-header text-muted border-bottom-0">
									no.1
									</div>

									<div class="card-body pt-0">
										<div class="row">
											<div class="col-7">
												<h2 class="lead"><b>사원 이름</b></h2>
												<br>
												<ul class="ml-4 mb-0 fa-ul text-muted">
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>부서</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>이메일</li> <br>
													<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>전화번호</li> <br>
												</ul>
											</div>
											<div class="col-5 text-center">
												<img src="../../dist/img/user1-128x128.jpg" alt="user-avatar" class="img-circle img-fluid">
											</div>
										</div>
									</div>
								
									<div class="card-footer">
										<div class="text-right">
											<a href="#" class="btn btn-sm bg-teal">
												<i class="fas fa-comments"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							-->

						</div>	
				  	</div>
				  	<!-- /.card-body -->

					<!-- 페이징바 -->
					<div class="card-footer">
						<nav aria-label="Contacts Page Navigation">
							<ul class="pagination justify-content-center m-0">
							
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="addressBook.do?cpage=${ pi.currentPage-1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }"> 
									<li class="page-item" id="currentPage"><a class="page-link" href="addressBook.do?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">							
										<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="addressBook.do?cpage=${ pi.currentPage+1 }">Next</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
				  	<!-- /.card-footer -->
				  	
				</div>
				<!-- /.card -->
		  
			</section>
			<!-- /.content -->

		</div>
		<!-- /.content-wrapper -->
		
		<jsp:include page="../common/footer.jsp" />
		
	</div>    
	
	<jsp:include page="../common/scripts.jsp" />
	
</body>
</html>