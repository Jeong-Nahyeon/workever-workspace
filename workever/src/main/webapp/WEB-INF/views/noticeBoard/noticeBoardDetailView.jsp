<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 게시글 상세</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

<style>

    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
    }

    /* 수정/삭제 버튼 영역 */
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
        border:1px solid #858796;
        background: #858796;
        color: white;
        width:75px;
    }

    .board-btns-area .delete-btn:hover{
        color: white;
    }  

    /* 내용 제외 입력 정보 영역 */
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
    .baord-content-area{
      padding:20px;
    }


    /* 목록 버튼 영역 */
    .btns-area{
        /* border:1px solid red; */
        padding:10px;
        text-align:center;
    }

    .btns-area a{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
    }

    .btns-area a:hover{
        color: white;
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
		          <h1 id="page-title">공지사항 게시글 상세</h1>
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
		            <!-- 관리자일 경우에만 보임 -->
		            <div class="card-header board-btns-area"> 
		            
		            <c:if test="${ loginUser.userRank eq '관리자' }">
		              <button type="button" class="btn btn-sm btn-default update-btn" onclick="postFormSubmit(1);">수정</button>
		              <button type="button" id="delete-modal-btn" class="btn btn-sm delete-btn" onclick="postFormSubmit(2);">삭제</button>
		            </c:if>  
		            
		            </div>
		            <!-- /.card-header -->
		            
					<!-- 수정/삭제 버튼 클릭 시 공지사항 게시글 번호 post 방식으로 전달 -->
					<form id="postForm" method="post">
						<input type="hidden" name="nbno" value="${ nb.nbNo }" /> 
					</form>			            
		
		            <div class="card-body">
		
		              <table id="board-detail">
		                <thead>
		                  <tr>
		                    <th style="padding:0px 20px 20px 20px">제목</th>
		                    <td style="padding-top:0">${ nb.nbTitle }</td>
		                  </tr>
		                  <tr>
		                    <th>작성일</th>
		                    <td>${ nb.nbDate }</td>
		                  </tr>
		                  <tr>
		                    <th>첨부파일</th>
		                    <td>
		                      <c:choose>
			                      <c:when test="${ empty list }">
			                      	  첨부파일이 없습니다.
			                      </c:when>
			                      <c:otherwise>
			                      	  <c:forEach var="cf" items="${ list }">
					                      <a href="${ cf.cfPath }${ cf.cfChangeName }" download="${ cf.cfOriginName }">${ cf.cfOriginName }</a><br>
				                      </c:forEach>
			                      </c:otherwise>
		                      </c:choose>
		                    </td>
		                  </tr>
		                  <tr align="center">
		                    <th colspan="2">내용</th>
		                  </tr>
		                  <tr>
		                </thead>
		                <tbody>
		                  <tr>
		                    <td colspan="2">
		                      <div class="board-content-area">${ nb.nbContent }</div>
		                    </td>
		                  </tr>
		               </tbody>
		              </table>
		            </div>
		            <!-- /.card-body -->
		
		
		          <!-- 목록 버튼 영역 -->
		          <div class="card-footer">
		
		            <div class="btns-area">
		              <a class="btn btn-sm" href="list.nbo">목록</a>
		            </div>
		
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
	
	  // 게시글 수정 삭제 영역
	  // 수정/삭제 버튼 클릭 시 post 방식으로 게시글 번호 전달
	  function postFormSubmit(num){
		  
		  if(num == 1){ // 수정버튼 클릭
			  
			  $("#postForm").attr("action", "updateForm.nbo").submit();
			  
		  }else{ // 삭제버튼 클릭
			  
			  // 요청처리 여부 확인 모달창 오픈
		      $("#confirm-modal").modal({backdrop: "static"});
		      
				// 확인 버튼 클릭 시 삭제 요청 처리
			    $("#confirm-btn").click(function(){
			    	
			    	$("#postForm").attr("action", "delete.nbo").submit();
				      
				});
			  
		  }
		  
	  }
	  
	</script>	

</body>
</html>