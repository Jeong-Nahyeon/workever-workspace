<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부서별 게시글 상세</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

<style>

    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
    }

    /* 수정/삭제/신고/목록 버튼 영역 */
    .board-btns-area {
        /* border-bottom:none; */
        padding-top:25px;
        padding-bottom:20px;
        text-align:right;
    }    
    
    .board-btns-area .update-btn{
        width:75px;
    }

    .board-btns-area .delete-btn{
        width:75px;
    }

    .board-btns-area .report-btn{
        border:1px solid #858796;
        background: #858796;
        color: white;
        width:75px;
    }

    .board-btns-area .report-btn:hover{
        color: white;
    }  

    .board-btns-area .list-btn{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
    }

    .board-btns-area .list-btn:hover{
        color: white;
    }  

    /* 내용 제외 게시글 정보 영역 */
    #board-detail{
      box-sizing: border-box;
      width:100%;
      
    }

    #board-detail thead tr{
      border-bottom:1px solid #DEE2E6;
    }

    #board-detail thead th{
      padding:10px;
      width:200px;
      text-align:center;
    }

    #board-detail thead td{
      padding:20px;
    }


    /* 게시글 내용 영역 */
    .board-content-area{
      padding:20px;
    }


    /* 댓글 작성 영역 */
    .reply-insert {
      box-sizing:border-box;
      width:100%;
      margin-top:20px;
      margin-bottom:10px;
    }

    .reply-insert-contents{
      width:85%;
      height:100px;
      padding:0;
    }

    #reply-insert-content{
      box-sizing:border-box;
      width:100%;
      height:100%;
      resize:none;
    }

    .reply-insert-btns{
      height:100px;
      text-align:right;
      padding:0;
    }

    #reply-insert-btn{
      background:#4E73DF;
      color:white;
      width:220px;
      height:100%;
    }

    
    /* 댓글 목록 영역 */
    .reply-list {
      box-sizing:border-box;
      width:100%;
      margin-top:20px;
      margin-bottom:10px;
      background:white;
    }
    
    .reply-list .reply-list-img{
      width:5%;
      text-align:center;
      padding-top:20px;
    }

    .reply-list .reply-img{
      width:50px;
      height:50px;
    }

    .reply-list .reply-no-img{
      color:lightgrey;
    }

    .reply-list .reply-list-name{
      width:80%;
      padding-top:20px;
    }

    .reply-list .reply-list-btns{
      padding-right:20px;
      padding-top:20px;
      width:15%;
      text-align:right;
    }

    .reply-list-btns a{
      margin-left:5px;
      text-decoration:none;
      color:black;
      cursor:pointer;
    }

    .reply-list .reply-content{
      padding:20px;
    }
    
    
    /* 댓글 수정 영역 */
    .reply-update-content-area{
		padding:20px;
		padding-right:0;
    }

	.reply-update-content{
		width:100%;
		height:70px;
		resize:none;
	}
    
	.reply-update-btn-area{
		padding:20px;
	}

    .reply-update-btn{
      background:#4E73DF;
      color:white;
	  width:100%;
	  height:70px;
    }
    
    .reply-update-btn:hover{
      color:white;
    }

    /* 댓글 블라인드용 영역 */
    .reply-blind{
      padding:20px;
      color:lightgray;
      text-align:center;
    }

    /* 요청처리 여부 확인 모달창 영역 */
    #confirm-modal h6{
      margin-left:220px;
    }

    #confirm-modal .modal-body{
      height:130px;
      text-align:center;
      line-height:100px;
    }
   
    .confirm-modal-btns{
      /* border:1px solid red; */
      display: inline-block;
      margin-right:160px;
    }
    
    .confirm-modal-btns button{
      
      width:75px;
      
    }

    #confirm-btn{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
    }
    
        
  	/* 요청처리  확인 모달창 영역 */
    #alert-message-modal h6{
    	margin-left:220px;
    }

    #alert-message-modal .modal-body{
	    height:130px;
	    text-align:center;
	    line-height:100px;
    }
   
    .alert-message-modal-btns{
	    /* border:1px solid red; */
	    display: inline-block;
	    margin-right:200px;
    }
    
    #close-btn{
	    border:1px solid #4E73DF;
	    background: #4E73DF;
	    color: white;
	    width:75px;
    }
    
</style>
</head>
<body class="hold-transition sidebar-mini">

	<!-- 요청처리 성공 시 =>  성공 메시디 담은 요청처리 확인 모달창 띄우기 -->
	<c:if test="${ not empty successMsg }">
		<script>
			$(function(){
				
				$("#alert-message").text("${ successMsg }");
				$("#alert-message-modal").modal({backdrop: "static"});
				
			});
		</script>
		
		<c:remove var="successMsg" scope="session" />
	</c:if>

	<div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
				<h1 id="page-title">${ deptName } 게시글 상세</h1>
				</div>
			</div>
			</div><!-- /.container-fluid -->
		</section>

		<!-- Main content -->
		<section class="content">
			<div class="container-fluid">
			<div class="row">
				<div class="col-12">
				<div class="card"> 

					<!-- 수정/삭제 버튼 영역 -->
					<div class="card-header board-btns-area"> 
						<c:if test="${ db.userNo eq loginUser.userNo }">
							<!-- 본인 게시글일 경우 -->
							<button type="button" class="btn btn-sm btn-default update-btn" onclick="postFormSubmit(1);">수정</button>
							<button type="button" id="delete-modal-btn" class="btn btn-sm btn-default delete-btn" onclick="postFormSubmit(2);">삭제</button>
						</c:if>
						<!-- 공통 -->
						<button type="button" class="btn btn-sm list-btn" onclick="location.href='list.dbo';">목록</button>
					
					</div>
					<!-- /.card-header -->
					
					<!-- 수정/삭제 버튼 클릭 시 부서별 게시글 번호 post 방식으로 전달 -->
					<form id="postForm" method="post">
						<input type="hidden" name="dbno" value="${ db.dbNo }" /> 
					</form>					

					<div class="card-body">

						<table id="board-detail">
							<thead>
							<tr>
								<th style="padding:0px 20px 20px 20px">제목</th>
								<td style="padding-top:0">${ db.dbTitle }</td>
								<th style="padding:0px 20px 20px 20px">카테고리</th>
								<td style="padding-top:0">
									<c:choose>
										<c:when test="${ not empty db.dbCategory }">
											공지
										</c:when>
										<c:otherwise>
											일반
										</c:otherwise>	
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${ db.userRank } ${ db.userName }</td>
								<th>작성일</th>
								<td>${ db.dbDate }</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<c:choose>
										<c:when test="${ empty list }">
											첨부파일이 없습니다.
										</c:when>
										<c:otherwise>
											<c:forEach var="cf" items="${ list }">
												<a href="${ cf.cfPath }${ cf.cfChangeName }" download="${ cf.cfOriginName }" >${ cf.cfOriginName }</a><br>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr align="center">
								<th colspan="4">내용</th>
							</tr>
							<tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4">
										<div class="board-content-area">${ db.dbContent }</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.card-body -->


				<!-- 댓글 등록 영역 -->
				<div class="card-footer">

					<table class="reply-insert">
						<tr>
							<td class="reply-insert-contents">
								<textarea id="reply-insert-content" name="crContent"></textarea>
							</td>
							<td class="reply-insert-btns">
								<button id="reply-insert-btn" class="btn" onclick="addReply();">댓글등록</button>
							</td>
						</tr>
						<tr>
							<th colspan="2" style="padding-top:20px;">댓글 목록 (<span id="reply-count">0</span>)</th>
						</tr>
					</table>  

					<!-- 댓글 목록 영역 -->					
					
				</div>
				<!-- /.card-footer -->
				</div>
				<!-- /.card -->

				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</section>
		<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<jsp:include page="../common/footer.jsp" />
    
    </div>
    <!-- ./wrapper -->



    <!-- 요청처리 확인 모달창 -->
	<!-- The Modal -->
	<div class="modal fade" id="alert-message-modal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h6 class="modal-title"><b>확인</b></h6>
	        <button type="button" class="close" data-dismiss="modal">×</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
	        <b id="alert-message"><!-- 알림 메시지 --></b>
	      </div>
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
	          <div class="alert-message-modal-btns">
	            <button  id="close-btn" class="btn btn-sm btn-default" data-dismiss="modal">확인</button>
	          </div>
	      </div>
	      
	    </div>
	  </div>
	</div>



    <!-- 요청처리 여부 확인 모달창 -->
	<!-- The Modal -->
	<div class="modal fade" id="confirm-modal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h6 class="modal-title"><b>확인</b></h6>
	        <button type="button" class="close" data-dismiss="modal">×</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
	        <b>삭제하시겠습니까?</b>
	      </div>
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
	          <div class="confirm-modal-btns">
	            <button class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
	            <button id="confirm-btn" class="btn btn-sm">확인</button>
	          </div>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	
	
	<script>
		$(function(){
			
			// 실시간으로 댓글 조회
			selectReplyList();
		    
			
			// 본인 댓글 수정 버튼 클릭 시 => 수정폼 보이기
			$(document).on("click", ".reply-update-form-btn", function(){
				
				let crNo = $(this).parents(".reply-list").find("input[name=crNo]").val(); // 해당 댓글 번호
				
				let updateArea = $(this).parents(".reply-list").find(".reply-update-form"); // 해당 댓글 내용 영역
				
				let crContent = $(this).parents(".reply-list").find(".reply-content").text(); // 댓글 내용
				
				let cancelBtn = "<a class='reply-update-cancel-btn'>취소</a>"; // 취소버튼
				
				// 수정 폼
				let updateForm = "<td colspan='2' class='reply-update-content-area'>"
							   + "<textarea class='reply-update-content' name='crContent'>" + crContent + "</textarea></td>"
							   + " <td class='reply-update-btn-area'>"
							   + "<input type='hidden' name='crNo' value='" + crNo + "' />"
				               + "<button type='button' class='btn reply-update-btn'>수정</button></td>";    
				
				updateArea.text("");
				updateArea.html(updateForm);
				$(this).parent().html(cancelBtn);               
				
			});	
			
			
			// 댓글 수정폼에서 취소 버튼 클릭 시
			$(document).on("click", ".reply-update-cancel-btn", function(){
				
				$(this).parents(".reply-list").remove();
				selectReplyList();
				
			});
			
			
			// 댓글 수정용 ajax (수정폼에서 수정버튼 클릭 시)
			$(document).on("click", ".reply-update-btn", function(){
				
				// ajax 사용 시 $(this) 쓸 수 있는 방법 => context: this 속성 추가
				
				$.ajax({
					context: this,
					url:"rupdate.dbo",
					data:{
						crNo:$(this).prev().val(),
						crContent:$(this).parents(".reply-list").find(".reply-update-content").val()
					},
					type:"post",
					success:function(result){
						
						if(result == "success"){
							
							$(this).parents(".reply-list").remove();
							selectReplyList();
							
						}
											
					}, error:function(){
						
	    				console.log("댓글 수정용 ajax 통신 실패");		
	    				
					}
				});
				
			});
			
			
			// 댓글 삭제용 ajax (본인 댓글 삭제 버튼 클릭 시 => 삭제처리 여부 확인 모달창 띄우기)
			
			$(document).on("click", ".reply-delete-btn", function(){
				
				let crNo = $(this).parents(".reply-list").find("input[name=crNo]").val(); // 댓글 번호
				
				$("#confirm-modal").modal({backdrop: "static"});
				
				// 확인 버튼 클릭 시 삭제 요청 처리
			    $("#confirm-btn").click(function(){
			    	
			    	  $.ajax({
			    		 url:"rdelete.dbo",
			    		 data:{
			    			 crNo:crNo,
			    			 crRefNo:${ db.dbNo }
			    		 },
			    		 type:"post",
			    		 success:function(result){
			    			
			    			if(result == "success"){
			    				
				 				$("#confirm-modal").modal("hide"); 
				 				
				 				$("#alert-message").text("성공적으로 삭제되었습니다");
								$("#alert-message-modal").modal({backdrop: "static"});
								
								$("#close-btn").click(function(){
									
									location.reload();
									
								});
			    				
			    			}
			    			 
			    		 }, error:function(){
			    			 
			    			 console.log("댓글 삭제용 ajax 통신 실패");		
			    			 
			    		 }
				      
			    	  });
			    	  
				});
				
			});

		});
		
		
		// 댓글 등록용 ajax
		function addReply(){
			
			if($("#reply-insert-content").val().trim().length != 0){ // 공백만 있는 댓글이 등록되지 못하도록 조건 검사
				
				$.ajax({
					url:"rinsert.dbo",
					data:{
						crRefNo:${ db.dbNo },
						crContent:$("#reply-insert-content").val()
					},
					type:"post",
					success:function(result){
						
						if(result == "success"){
							
							$("#reply-insert-content").val("");
							selectReplyList();
							
						}
						
					}, error:function(){
						
	    				console.log("댓글 등록용 ajax 통신 실패");		
	    				
					}
				});
								
			}else{
				
				alert("댓글 작성 후 등록 가능합니다.");
				
			}
			
		}
		
		
		// 댓글 목록 조회용 ajax
		function selectReplyList(){
			
			$.ajax({
				url:"rlist.dbo",
				data:{dbno:${ db.dbNo }},
				success:function(list){
					
					let reply = "";
					
					for(let i in list){
						
						reply += "<table class='reply-list'>"
							   + 	"<input type='hidden' name='crNo' value='" + list[i].crNo + "' />"
							   + 	"<input type='hidden' name='crUserNo' value='" + list[i].crUserNo + "' />"
							   + 	"<tr>"
						       + 		"<td class='reply-list-img' rowspan='2'>";
						    
						if(list[i].userFilePath != null){ // 프로필 이미지 있을 경우
							
							reply += "<img src='" + list[i].userFilePath + "' class='img-circle img-bordered-sm reply-img'>"
							
						}else{ // 프로필 이미지 없을 경우
							
							reply += "<i class='fas fa-user-circle fa-3x reply-no-img'></i>" 
						}
						
						reply += "</td>"
							   + "<td class='reply-list-name'>"
							   + 	"<b>" + list[i].userRank + " " + list[i].userName + "</b>"
							   + "</td>"
							   + "<td class='reply-list-btns'>";
							   
						if(list[i].crUserNo == ${ loginUser.userNo }){ // 본인 댓글인 경우 => 수정/삭제버튼 보이기
							
							reply += "<a class='reply-update-form-btn'>수정</a>"
								   + "<a class='reply-delete-btn'>삭제</a>"
							
						}
						
						reply += "</td></tr>"
							   + "<tr><td colspan='2'>"
							   + 	"<span>" + list[i].crDate + "</span></td></tr>"
							   + "<tr class='reply-update-form'><td colspan='3'>"
							   + 	"<p class='reply-content'>" + list[i].crContent + "</p></td></tr></table>";
						
					}
					
					$(".reply-list").remove(); // 요청 처리 전 댓글 목록 비워주기
					$("#reply-count").text(list.length);
					$(".reply-insert").after(reply);


					if($("input[name=crUserNo]").val() == ${ loginUser.userNo }){ // 본인 댓글인 경우 => 배경색 다르게 보이기
						
						$("input[value=${ loginUser.userNo }]").parent().css("backgroundColor", "#F0F0F0");
						
					}
					
				}, error:function(){
					
    				console.log("댓글 리스트 조회용 ajax 통신 실패");		
    				
				}
				
			});
			
		}
		
		
	  // 게시글 수정 삭제 영역
	  // 수정/삭제 버튼 클릭 시 post 방식으로 게시글 번호 전달
	  function postFormSubmit(num){
		  
		  if(num == 1){ // 수정버튼 클릭
			  
			  $("#postForm").attr("action", "updateForm.dbo").submit();
			  
		  }else{ // 삭제버튼 클릭
			  
			  // 요청처리 여부 확인 모달창 오픈
		      $("#confirm-modal").modal({backdrop: "static"});
		      
				// 확인 버튼 클릭 시 삭제 요청 처리
			    $("#confirm-btn").click(function(){
			    	
			    	$("#postForm").attr("action", "delete.dbo").submit();
				      
				});
			  
		  }
		  
	  }
	  
	</script>	

</body>
</html>