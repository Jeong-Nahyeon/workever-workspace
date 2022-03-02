<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

<style>
	.user-img {
		width: 80px !important;
		height: 80px !important;
	}
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
					<div class="input-group">
						<input type="search" class="form-control form-control-lg" id="keyword" name="keyword" autocomplete="off" placeholder="사원 이름/부서 검색">
					</div>
			</div>

			<br>

			<!-- 주소록 -->
			<section class="content">

				<!-- Default box -->
				<div class="card card-solid">
				  	<div class="card-body pb-0">
						<div class="row">
							
							
							<c:forEach var="u" items="${ list }" >
								<div class="col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column abContents">
									<div class="card bg-light d-flex flex-fill">
										<div class="card-header text-muted border-bottom-0">
										No.${ u.userNo }
										</div>
	
										<div class="card-body pt-0">
											<div class="row abList">
												<div class="col-7">
													<h2 class="lead"><b>${ u.userName }</b></h2>
													<br>
													<ul class="ml-4 mb-0 fa-ul text-muted">
														<li class="small"><span class="fa-li"><i class="fas fa-lg fa-briefcase"></i></span>${ u.deptName }</li> <br>
														<li class="small"><span class="fa-li"><i class="fas fa-lg fa-envelope"></i></span>${ u.userEmail }</li> <br>
														<li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span>${ u.userPhone }</li> <br>
													</ul>
												</div>
												<div class="col-5 text-center">
													<c:choose>
														<c:when test="${ u.userFilePath != null}">
															<img src="${ u.userFilePath }" alt="user-img" class="img-circle img-fluid user-img">
														</c:when>
														<c:otherwise>
															<img src="resources/images/user-circle-solid.svg" alt="user-img" class="img-circle img-fluid user-img">													
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</div>
									
									<c:choose>
										<c:when test="${loginUser.userNo != u.userNo}">
											<div class="card-footer">
												<div class="text-right">
													<a href='javascript:void(0);' onclick="chatPopup();" class="btn btn-sm bg-teal chatPopup">
														<i class="fas fa-comments"></i>
													</a>
												</div>
											</div>
										</c:when>
										<c:otherwise>
												<div class='card-footer' style='height: 55.45px'>
												</div>
										</c:otherwise>
									</c:choose>
									
									</div>
								</div>
							</c:forEach>
							
							
						</div>	
				  	</div>
				  	<!-- /.card-body -->
				  	
				  	
					<script>
						function chatPopup(){
							window.open("chat.do", "chat", "width=400, height=500");
						}
						
						$(document).ready(function() {
						      // 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
						      var strWidth;
						      var strHeight;

						      //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
						      if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
						          strWidth = $('.chatPopup').outerWidth() + (window.outerWidth - window.innerWidth);
						          strHeight = $('.chatPopup').outerHeight() + (window.outerHeight - window.innerHeight);
						      }
						      else {
						          var strDocumentWidth = $(document).outerWidth();
						          var strDocumentHeight = $(document).outerHeight();

						          window.resizeTo ( strDocumentWidth, strDocumentHeight );

						          var strMenuWidth = strDocumentWidth - $(window).width();
						          var strMenuHeight = strDocumentHeight - $(window).height();

						          strWidth = $('.chatPopup').outerWidth() + strMenuWidth;
						          strHeight = $('.chatPopup').outerHeight() + strMenuHeight;
						      }

						      //resize 
						      window.resizeTo( strWidth, strHeight );

						  });
					</script>

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
		
		
		<script>
		
			let $abSearch = $("Input[name=keyword]");
			let loginUser = ${loginUser.userNo};
			
				
			$abSearch.keyup(function(){
				
				console.log($abSearch.val());
				
				$.ajax({
					url:"search.ab",
					data:{
						keyword: $('input[name=keyword]').val()
					}, success:function(result){
						
						let searchList = "";
						//if($abSearch.val().length > 0) { // 검색어 없을 때는 전제 조회
							
							$(".card-footer").hide();
							
							for(let i in result){
								searchList += "<div class='col-12 col-sm-6 col-md-4 d-flex align-items-stretch flex-column abContents'>"
										   +	"<div class='card bg-light d-flex flex-fill'>"
										   +  		"<div class='card-header text-muted border-bottom-0'>" + result[i].userNo + "</div>"
										   
										   +		"<div class='card-body pt-0'>"
										   +			"<div class='row abList'>"
										   +				"<div class='col-7'>"
										   +  					"<h2 class='lead'><b>" + result[i].userName + "</b></h2><br>"
										   
										   +  					"<ul class='ml-4 mb-0 fa-ul text-muted'>"
										   +  						"<li class='small'><span class='fa-li'><i class='fas fa-lg fa-briefcase'></i></span>" + result[i].deptName + "</li><br>"
										   +  						"<li class='small'><span class='fa-li'><i class='fas fa-lg fa-envelope'></i></span>" + result[i].userEmail + "</li><br>"
										   +  						"<li class='small'><span class='fa-li'><i class='fas fa-lg fa-phone'></i></span>" + result[i].userPhone + "</li><br>"
										   +					"</ul>"
										   +  				"</div>"
										   
										   +  				"<div class='col-5 text-center'>";
										   
										   if(result[i].userFilePath != null) {
										   			searchList += "<img src=" + result[i].userFilePath + " alt='user-img' class='img-circle img-fluid user-img'>";
										   } else {
										   			searchList += "<img src='resources/images/user-circle-solid.svg' alt='user-img' class='img-circle img-fluid user-img'>";
										   }

								searchList += 				"</div>"
										   +			"</div>"
										   +		"</div>";
								
										   				if(loginUser != result[i].userNo) {
										  					 searchList	+= "<div class='card-footer'>"
									  						 			+	"<div class='text-right'>"
										  						 		+  "<a href='javascript:void(0);' onclick='chatPopup();' class='btn btn-sm bg-teal chatPopup'>"
									  					 				+  			"<i class='fas fa-comments'></i>"
										  					 			+  		"</a>"
										  					 			+ 	"</div>"
										  					 			+"</div>";
										   				} else {
										   					searchList	+= "<div class='card-footer' style='height: 55.45px'>"
										   								+  "</div>";
										   				}

								searchList +=			"</div>"
										   +		"</div>";

							}
							
						//}
						
						$(".row").html(searchList);
						
					}, error:function(){
						console.log("keyup 검색조회용 ajax통신 실패");
					}
				})
			})
				
		
		</script>
		
		
		<jsp:include page="../common/footer.jsp" />
		
		
	</div>    
	
	
</body>
</html>