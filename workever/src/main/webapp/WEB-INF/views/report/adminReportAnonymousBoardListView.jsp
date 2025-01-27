<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명 게시판 신고 관리</title>
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

    /* 신고글 분류/삭제버튼 영역 */
    .board-header-area {
      /* border:1px solid red; */
        border-bottom:none;
        padding-top:25px;
        padding-bottom:0;
    }

    /* 신고글 분류 영역 */
    .board-header-area-left{
        /* border:1px solid red; */
        box-sizing: border-box;
        padding:0;
        float:left;
    }

    .board-header-area-left button{
        width:100px;
        height:30px;
        font-size:13px;
    }

    .anonymous-board-btn{
        border:1px solid #4E73DF;
        background: #4E73DF;
        color: white;
    }

    .anonymous-board-btn:hover{
        color: white;
    }  

    /* 신고글 삭제버튼 영역 */
    .board-header-area-right{
        /* border:1px solid red; */
        box-sizing: border-box;
        text-align:right;
        padding:0;
        float:left;
    }

    .board-header-area-right button{
        border:1px solid #858796;
        background: #858796;
        color: white;
        width:75px;
        height:30px;
    }

    .board-header-area-right button:hover{
        color: white;
    }  

    /* 신고글 목록 테이블 영역 */
    #board-list{
        border-top:2px solid #DEE2E6;
        border-bottom:2px solid #DEE2E6;
        text-align:center;
        margin-bottom:20px;
    }
    
    
	/* 제목 */
	.report-title{
		cursor:pointer;
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
        line-height: 25px;
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
         

    /* 신고 상세 모달창 영역 */
    #report-detail-modal h5{
      margin-left:320px;
    }
    
    #report-detail-modal table{
      width:100%;
      text-align:center;
    }

    #report-detail-modal table th, #report-detail-modal table td{
      padding:15px;
    }

    #report-detail-modal table thead td{
      text-align:left;
    }

    #report-group{
      color:red;
    }

    #report-content{
      border:1px solid lightgray;
      border-radius:5px;
      height:200px;
      padding:10px;
      text-align:left;
      overflow:scroll;
    }

    .report-modal-btns{
      /* border:1px solid red; */
      display: inline-block;
      margin-right:350px;
    }

    #blind-btn{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
      height:30px;
    }

    #blind-btn:hover{
      color: white;
    }

    #blind-cancel-btn{
      border:1px solid #858796;
      background: #858796;
      color: white;
      width:75px;
      height:30px;
    }

    #blind-cancel-btn:hover{
      color: white;
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
		          <h1 id="page-title">익명 게시판 신고 관리</h1>
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
		
		            <!-- 신고글 분류/삭제버튼 영역 -->
		            <div class="card-header board-header-area">
		              <div class="col-sm-6 board-header-area-left">
		                <div class="btn-group">
		                  <button type="button" class="btn btn-sm anonymous-board-btn" onclick="location.href='list.bo';">게시글 관리</button>
		                  <button type="button" class="btn btn-sm btn-default" onclick="location.href='list.re';">댓글 관리</button>
		                </div>
		              </div>
		              <div class="col-sm-6 board-header-area-right">
		                <button id="delete-btn" class="btn btn-sm">삭제</button>
		              </div>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		              <table id="board-list" class="table table-hover">
		
		                <thead>
		                  <tr>
		                    <th width="5%">
		                      <input type="checkbox" id="all-check-btn"> 
		                    </th>
		                    <th width="10%">신고번호</th>
		                    <th width="20%">신고유형</th>
		                    <th width="30%">신고글 제목</th>
		                    <th width="10%">익명글 번호</th>
		                    <th width="10%">블라인드 처리</th>
		                    <th  width="15%">신고시간</th>
		                  </tr>
		                </thead>
		
		                <tbody>
		                  <c:choose>
				              <c:when test="${ empty list }">	
				                  <!-- case 1. 게시글 목록 존재하지 않을 경우 -->
				                  <tr>
				                    <td colspan="7">게시글이 없습니다.</td>
				                  </tr>
			                  </c:when>
				              <c:otherwise>
				                  <!-- case 2. 게시글 목록 존재할 경우 -->
				                  <c:forEach var="b" items="${ list }">
					                  <tr>
					                    <td>
					                      <input type="checkbox" name="deleteNo"> 
					                    </td>
					                    <td class="report_no">${ b.reportNo }</td>
					                    <td>${ b.reportGroup }</td>
					                    <td class="report-title">익명 게시글 신고</td>
					                    <td class="report_ref_no">${ b.reportRefNo }</td>
					                    <td>
					                    	<c:if test="${ b.abStatus eq 'B' }">
			                    				완료
				                    		</c:if>    
					                    </td>
					                    <td>${ b.reportDate }</td>
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
		                		<a class="btn" href="list.bo?cpage=${ pi.currentPage - 1 }">&lt;</a>
		                	</c:if>
			                
			                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
	                			<c:choose>
				                	<c:when test="${ pi.currentPage eq p }">
		                				<a class="btn active-color" href="list.bo?cpage=${ p }">${ p }</a>
		                			</c:when>
		                			<c:otherwise>
		                				<a class="btn" href="list.bo?cpage=${ p }">${ p }</a>
		                			</c:otherwise>
	                			</c:choose>
			                </c:forEach>
			                
	                		<c:if test="${ pi.currentPage ne pi.maxPage }">
	             	   			<a class="btn" href="list.bo?cpage=${ pi.currentPage + 1 }">&gt;</a>
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



	<!-- 신고글 상세 모달창 -->
	<!-- The Modal -->
	<div class="modal fade" id="report-detail-modal">
	  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h5 class="modal-title"><b>익명 게시글 신고</b></h5>
	        <button type="button" class="close" data-dismiss="modal">×</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
	        <table id="report-detail">
	
	          <thead>
	            <tr>
	              <th>신고 작성 사원</th>
	              <td id="report-user-name" colspan="3"></td>
	            </tr>
	            <tr>
	              <th>신고 유형</th>
	              <td id="report-group"></td>
	              <th>신고 대상 글</th>
	              <td>
	                <a id="report-link-btn" class="btn btn-sm btn-default" href="#">링크이동</a>
	              </td>
	            </tr>
	            <tr>
	              <th colspan="4">신고 내용</th>
	            </tr>
	          </thead>
	
	          <tbody>
	            <tr>
	              <td colspan="4">
	                <div id="report-content"></div>
	              </td>
	            </tr>
	          </tbody>
	
	        </table>
	      </div>
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <div class="report-modal-btns">
	        </div>
	      </div>
      	  <!-- 블라인드/블라인드 해제 시 익명 게시글 번호 post 방식으로 전달 -->
		  <form id="postForm" method="post">
	      	<input type="hidden" name="abNo" value="" /> 
		  </form>
	      
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
			
			// 익명 게시글 신고 상세 조회
			$("#board-list tbody .report-title").click(function(){
				
				const reportNo = $(this).prev().prev().text();
				
				$.ajax({
					url:"detail.bo",
					data:{reportNo:reportNo},
					success:function(report){
						
						$("#report-detail").html("");
						$(".report-modal-btns").html("");
						$("#postForm input[name=abNo]").val("");
						
						if(report != null){
							
						  let detail  = "<thead><tr><th>신고 작성 사원</th>"
									  + "<td id='report-user-name' colspan='3'>" + report.deptName + " " + report.userRank + " " + report.userName + "</td></tr><tr>"
									  + "<th>신고 유형</th><td id='report-group'>" + report.reportGroup + "</td>"
									  + "<th>신고 대상 글</th><td><a id='report-link-btn' class='btn btn-sm btn-default' " 
									  + "href='detail.abo?abno=" + report.reportRefNo + "'>링크이동</a></td></tr>"
									  + "<tr><th colspan='4'>신고 내용</th></tr></thead>"
									  + "<tbody><tr><td colspan='4'><div id='report-content'>";
									  
									  if(report.reportContent != null){
										  
										  detail += report.reportContent;
										  
									  }
									  
							 detail += "</div></td></tr></tbody>";
								
							let blind = "";
							if(report.abStatus == "B"){ // 블라인드 처리 후에 보이는 버튼 => 블라인드 해제 버튼
								
								blind = "<button id='blind-cancel-btn' class='btn btn-sm'>해제</button>";
								
							} else { // 블라인드 처리 전에 보이는 버튼 => 블라인드 버튼
								
								blind = "<button id='blind-btn' class='btn btn-sm'>블라인드</button>";
								
							}
							
							$("#report-detail").html(detail);
							$("#postForm input[name=abNo]").val(report.reportRefNo);
							$(".report-modal-btns").html(blind);
							
							// 신고 상세 모달창 띄우기
							$("#report-detail-modal").modal({backdrop: "static"});
							
						}
						
						
					}, error:function(){
						
					}
				});
				
				
			
				
			});
			
			
			// 블라인드 버튼 클릭 시
			$(document).on("click", "#blind-btn", function(){
				
				$.ajax({
					url:"blind.bo",
					data:{abNo:$("#postForm input[name=abNo]").val()},
					success:function(result){
						
						if(result == "success"){
							
							$("#report-detail-modal").modal("hide");	
							$("#alert-message").text("블라인드 처리되었습니다");
							$("#alert-message-modal").modal({backdrop: "static"});
							
							$("#close-btn").click(function(){
								
								location.reload();
								
							});
							
						}
						
					}, error:function(){
						
						console.log("블라인드 처리용 ajax 통신 실패");	
						
					}
				});
				
			});
			
			
			// 블라인드 해제 버튼 클릭 시
			$(document).on("click", "#blind-cancel-btn", function(){
				
				$.ajax({
					url:"cancel.bo",
					data:{abNo:$("#postForm input[name=abNo]").val()},
					success:function(result){
						
						if(result == "success"){
							
							$("#report-detail-modal").modal("hide");
							$("#alert-message").text("블라인드 해제되었습니다");
							$("#alert-message-modal").modal({backdrop: "static"});
							
							$("#close-btn").click(function(){
								
								location.reload();
								
							});
							
						}
						
					}, error:function(){
						
						console.log("블라인드 처리용 ajax 통신 실패");	
						
					}
				});
				
			});
			
			
			// thead 체크 버튼 체크 시 => tbody 체크 버튼 모두 체크
			$("#all-check-btn").change(function(){
				
				if($(this).prop("checked")){ // 체크된 경우
					
					$("input[name=deleteNo]").prop("checked", true);
					
				} else {
					
					$("input[name=deleteNo]").prop("checked", false);
					
				}
				
			});
			
			// tbody 체크 버튼 모두 체크 시 => thead 체크 버튼 체크
			$("input[name=deleteNo]").change(function(){
				
				let checkbox = $("input[name=deleteNo]").length; // 체크박스 전체 개수
				let checked = $("input[name=deleteNo]:checked").length; // 체크된 체크박스 개수
				
				if(checkbox == checked){
					
					$("#all-check-btn").prop("checked", true);
					
				}else{
					
					$("#all-check-btn").prop("checked", false);
					
				}
				
			});
			
			
			// 신고글 삭제용 ajax(삭제할 게시글 체크 후 삭제 버튼 클릭 시)
			$("#delete-btn").click(function(){

				let checkedArr = [];
				
				$("input[name=deleteNo]:checked").each(function(){
					
					checkedArr.push($(this).parent().next().text());
					
				});
				
				// 삭제할 신고글 체크 하지 않고 삭제 버튼 클릭 시
				if(checkedArr.length == 0){
					
					alert("삭제할 신고글을 선택 후 삭제 가능합니다.");
					
				}else{ // 삭제할 신고글 체크 후 삭제 버튼 클릭 시
					console.log(checkedArr);
					$("#confirm-modal").modal({backdrop: "static"});
					
					$("#confirm-btn").click(function(){
						
						$.ajax({
							url:"delete.bo",
							dataType:"json",
							type:"post",
							data:{deleteList:checkedArr},
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
								
								console.log("신고글 목록 삭제용 ajax 통신 실패");	
								
							}
						});
						
					});
					
				}
				
				
			});
			
		});
	</script>
	
</body>
</html>