<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
  
<style>

    /* 페이지 제목 */
    #page-title{
      margin-top:20px;
      margin-bottom:20px;
      font-weight:bolder;
    }

    /* 게시글 등록버튼 영역 */
    .board-header-area {
    /* border:1px solid red; */
      border-bottom:none;
      padding-top:25px;
      padding-bottom:0;
      text-align:right;
    }

    .board-header-area button{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
      height:30px;
    }

    .board-header-area button:hover{
      color: white;
    }  

    /* 게시글 목록 테이블 영역 */
    #board-list{
      border-top:2px solid #DEE2E6;
      border-bottom:2px solid #DEE2E6;
      text-align:center;
      margin-bottom:20px;
    }
    
    /* 게시글 목록 테이블 제목 영역 : 설정한 영역 범위 넘어가면 ...으로 표시  */
    .board-title-area{
      text-align:center;
    }

    .board-title-group{
      display:inline-block;
    }

    .board-title-group .report-badge{
      /* border:1px solid red; */
      height:25px;
      margin-left:10px;
      display:table-cell;
    }

    .report-badge>span{
      margin-right:10px;
    }

    .board-title-group .board-title{
      display:table-cell;
      cursor:pointer;
    }
    
    /*
    .board-title-group .board-title-setting{
      width:800px;
      height:25px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
   */
   
   .board-title-group .blind-title{
   	  color:lightgray;	
   }
   
    .board-title-group .reply-count{
      /* border:1px solid red; */
      height:25px;
      display:table-cell;
    }

    .board-title-group .reply-count>label{
      margin:0;
      margin-left:10px;
    }

    /* 페이징 처리 영역 */
    .paging-area{
      /* border:1px solid red; */
      /* padding:10px; */
      text-align:center;
    }

    .paging-area a{
      border:1px solid #DEE2E6;
      /* color:#DEE2E6; */
      width:25px;
      height:25px;
      padding:0;
      text-align:center;
      line-height:25px;
    }
    
    .active-color{
   	  color:#4E73DF;
   	  font-weight:bold;
    }
    
    .active-color:hover{
   	  color:#4E73DF;
   	  font-weight:bold;
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
    
    /* 요청처리 확인 모달창 영역 */
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
		          <h1 id="page-title">익명 게시판</h1>
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
		
		            <!-- 익명게시글 등록버튼 영역 -->
		            <div class="card-header board-header-area">
						<c:if test="${ loginUser.userRank ne '관리자' }">		            	
		            		<button type="button" class="btn btn-sm" onclick="location.href='enrollForm.abo';">글작성</button>
		            	</c:if>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		              <table id="board-list" class="table table-hover">
		
		                <thead>
		                  <tr>
		                    <th width="10%">글번호</th>
		                    <th width="70%">제목</th>
		                    <th width="10%">조회수</th>
		                    <th  width="10%">작성일</th>
		                  </tr>
		                </thead>
		
		                <tbody>
		                  <c:choose>
		                      <c:when test="${ empty list }">	
				                  <!-- case 1. 게시글 목록 존재하지 않을 경우 -->
				                  <tr>
				                    <td colspan="4">게시글이 없습니다.</td>
				                  </tr>
			                  </c:when>
			                  <c:otherwise>
				                  <!-- case 2. 게시글 목록 존재할 경우 -->
				                  <c:forEach var="b" items="${ list }">
					                  <tr>
					                    <td>${ b.abNo }</td>
					                    <td class="board-title-area">
					                      <div class="board-title-group">
					                      
					                        <c:choose>
						                        <c:when test="${ loginUser.userRank eq '관리자' }">
							                        <!-- case 1. 로그인한 회원이 관리자인 경우 -->
							                        <c:if test="${ b.abReportCount > 0 }">
							                        	<c:choose>
								                        	<c:when test="${ b.abStatus eq 'B' }">
								                        	
										                        <div class="report-badge">
										                          <span class="right badge badge-primary">블라인드</span> <!-- 블라인드 뱃지 -->
										                        </div>
										                        
									                        </c:when>
									                        <c:otherwise>
									                        
										                        <div class="report-badge">
										                          <span class="right badge badge-danger">신고</span> <!-- 신고 뱃지 -->
										                        </div>
										                        
									                        </c:otherwise>
								                        </c:choose>
							                        </c:if>
							                        
							                        <div class="board-title">
						                            	${ b.abTitle }
							                        </div>
							                        
							                        <div class="reply-count">
							                        	<c:if test="${ b.abReplyCount > 0 }">
							                        		<label>[${ b.abReplyCount }]</label> <!-- 댓글 개수 -->
							                        	</c:if>
							                        </div>
						                        </c:when>
						                        <c:otherwise>
						                        	<!-- case 2. 로그인한 회원이 일반 사원인 경우 -->
							                        <c:choose>
								                    	<c:when test="${ b.abStatus eq 'B' }">
						                            		<span class="blind-title">블라인드 처리된 게시글입니다</span>
								                        </c:when>
									                	<c:otherwise>
									                		<div class="board-title">
								                        		${ b.abTitle }
								                        	</div>
								                        	<div class="reply-count">
								                        		<c:if test="${ b.abReplyCount > 0 }">
									                        		<label>[${ b.abReplyCount }]</label> <!-- 댓글 개수 -->
									                        	</c:if>
									                        </div>
								                        </c:otherwise>
								                    </c:choose>
												</c:otherwise>
											</c:choose>
											
					                      </div>
					                    </td>
					                    <td>${ b.abCount }</td>
					                    <td>${ b.abDate }</td>
					                  </tr>
				                  </c:forEach>
				              </c:otherwise>  
					      </c:choose> 
		                </tbody>
		            
		              </table>
		
		            </div>
		            <!-- /.card-body -->
		
		            <!-- 페이징 처리 영역 -->
		            <div class="card-footer">
		            
		              <div class="paging-area">
						<c:if test="${ not empty list }">
	              			<c:if test="${ pi.currentPage ne 1 }">
		                		<a class="btn" href="list.abo?cpage=${ pi.currentPage - 1 }">&lt;</a>
		                	</c:if>
			                
			                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
			                	<c:choose>
				                	<c:when test="${ pi.currentPage eq p }">
		                				<a class="btn active-color" href="list.abo?cpage=${ p }">${ p }</a>
		                			</c:when>
		                			<c:otherwise>
		                				<a class="btn" href="list.abo?cpage=${ p }">${ p }</a>
		                			</c:otherwise>
	                			</c:choose>
			                </c:forEach>
			                
	                		<c:if test="${ pi.currentPage ne pi.maxPage }">
	             	   			<a class="btn" href="list.abo?cpage=${ pi.currentPage + 1 }">&gt;</a>
	             	   		</c:if>
						</c:if>
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
	        <b id="modal-massege">삭제하시겠습니까?</b>
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
	
	
	
	<script>
		$(function(){
			
			// 게시글 상세 조회
			$("#board-list tbody .board-title").click(function(){
				
				const $abNo = $(this).parents(".board-title-area").prev().text();
				location.href = "detail.abo?abno=" + $abNo;
				
			});		
			
		});
	</script>
</body>
</html>