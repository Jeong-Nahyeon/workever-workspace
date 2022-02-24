<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>받은메일함</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

<style>
	
	/* 페이지 제목 */
	#page-title{
	    margin-top:20px;
	    margin-bottom:20px;
	    font-weight:bolder;
	}
	
	/* 읽음/안읽음/삭제 버튼 영역 */
	.mail-btns-area {
	    border-bottom:none;
	    padding-top:25px;
	    padding-bottom:0;
	}
	
	/* 읽음/안읽음 버튼 영역 */
	.mail-btns-area-left{
	    /* border:1px solid red; */
	    box-sizing: border-box;
	    width:50%;
	    float: left;
	}
	
	.mail-btns-area-left button{
	    /* border:1px solid #DEE2E6; */
	    width:75px;
	}  
	
	/* 삭제 버튼 영역 */
	.mail-btns-area-right{
	    /* border:1px solid red; */
	    box-sizing: border-box;
	    width:50%;
	    float: left;
	    text-align:right;
	}
	
	.mail-btns-area-right button{
	    border:1px solid #4E73DF;
	    background: #4E73DF;
	    color: white;
	    width:75px;
	}
	
	.mail-btns-area-right button:hover{
	    color: white;
	}  
	
	/* 메일 목록 테이블 영역 */
	#mail-list{
	    border-top:2px solid #DEE2E6;
	    border-bottom:2px solid #DEE2E6;
	    text-align:center;
	    margin-bottom:20px;
	}
	
	/* 메일 목록 테이블 제목 영역 : 설정한 영역 범위 넘어가면 ...으로 표시  */
	#mail-list .mail-title{
		/* border:1px solid red; */
		width:700px;
		height:26px;
	 overflow: hidden;
	 text-overflow: ellipsis;
	 white-space: nowrap;
	 
	 cursor:pointer;
	}
	
	/* 페이징 처리 영역 */
	.paging-area{
	    /* border:1px solid red; */
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

</style>
</head>
<body class="hold-transition sidebar-mini">

	<!-- 요청처리 성공 시 =>  성공 메시지 담은 요청처리 확인 모달창 띄우기 -->
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
	                <h1 id="page-title">받은메일함</h1>
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
	    
	                  <!-- 안 읽음/읽음/삭제 버튼 영역 -->
	                  <div class="card-header mail-btns-area"> 
	                    <div class="col-sm-6 mail-btns-area-left">
	                      <button id="no-read-btn" class="btn btn-sm btn-default">안읽음</button>
	                      <button id="read-btn" class="btn btn-sm btn-default">읽음</button>
	                    </div>
	                    <div class="col-sm-6 mail-btns-area-right">
	                      <button id="trash-box-btn" class="btn btn-sm">삭제</button>
	                    </div>
	                  </div>
	                  <!-- /.card-header -->
	    
	                  <div class="card-body">
	                    <table id="mail-list" class="table table-hover">
	    
	                      <thead>
	                        <tr>
	                          <th width="5%">
	                            <input type="checkbox" id="all-check-btn">
	                          </th>
	                          <th width="10%">읽음/안읽음</th>
	                          <th width="20%">보낸사람</th>
	                          <th width="45%">제목</th>
	                          <th width="5%">첨부</th>
	                          <th width="15%">발신일시</th>
	                        </tr>
	                      </thead>
	    
	                      <tbody>
	                      	<c:choose>
		                      	<c:when test="${ empty list }">
			                        <!-- case 1. 받은 메일 목록 존재하지 않을 경우 -->
			                        <tr>
			                          <td colspan="6">받은 메일이 없습니다.</td>
			                        </tr>
		                        </c:when>
		                        <c:otherwise>
			                        <!-- case 2. 받은 메일 목록 존재할 경우 -->
			                        <c:forEach var="m" items="${ list }">
				                        <tr>
				                          <td>
				                            <input type="checkbox" name="checkedNo">
				                            <input type="hidden" name="mrNo" value="${ m.mrNo }" />  
				                          </td>
				                          <td>
				                            <c:choose>
				                            	<c:when test="${ m.mrRead eq 'N' }">
						                            <!-- case 1. 안읽음-->
						                            <i class="fas fa-envelope"></i>
					                            </c:when>
					                            <c:otherwise>
						                            <!-- case 2. 읽음-->
						                            <i class="fas fa-envelope-open"></i>
					                            </c:otherwise>
				                            </c:choose>
				                          </td>
				                          <td>
				                          	<c:if test="${ m.msDeptName ne '임원' }">
				                          	${ m.msDeptName }
				                          	</c:if>
				                          	${ m.msUserRank } ${ m.msUserName }
				                          </td>
				                          <td align="center">
				                            <div class="mail-title">
				                            	<input type="hidden" name="mrMsNo" value="${ m.mrMsNo }" />
				                            	<c:choose>
					                            	<c:when test="${ m.mrRead eq 'N' }">
					                            		<input type="hidden" name="mrRead" value="${ m.mrRead }" />
					                            		<b>${ m.msTitle }</b>
					                            	</c:when>
					                            	<c:otherwise>
					                            		<input type="hidden" name="mrRead" value="${ m.mrRead }" />
					                            		${ m.msTitle }
					                            	</c:otherwise>
				                            	</c:choose>
				                            </div>
				                          </td>
				                          <td>
				                            <!-- case1. 첨부파일 있을 경우 -->
				                            <c:if test="${ m.msFileCount > 0 }">
				                            	<i class="fas fa-paperclip"></i>
				                            </c:if>
				                          </td>
				                          <td>${ m.msDate }</td>
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
		                		<a class="btn" href="inbox.mail?cpage=${ pi.currentPage - 1 }">&lt;</a>
		                	</c:if>
			                
			                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
	                			<c:choose>
				                	<c:when test="${ pi.currentPage eq p }">
		                				<a class="btn active-color" href="inbox.mail?cpage=${ p }">${ p }</a>
		                			</c:when>
		                			<c:otherwise>
		                				<a class="btn" href="inbox.mail?cpage=${ p }">${ p }</a>
		                			</c:otherwise>
	                			</c:choose>
			                </c:forEach>
			                
	                		<c:if test="${ pi.currentPage ne pi.maxPage }">
	             	   			<a class="btn" href="inbox.mail?cpage=${ pi.currentPage + 1 }">&gt;</a>
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
			
			// 받은 메일 상세 조회
			$(".mail-title").click(function(){
				
				let mrNo = $(this).parent().prev().prev().prev().find("input[name=mrNo]").val();
				let mrMsNo = $(this).find("input[name=mrMsNo]").val();
				let mrRead = $(this).find("input[name=mrRead]").val();
				
				location.href = "incoming.mail?mrNo=" + mrNo + "&mrMsNo="+ mrMsNo + "&mrRead=" + mrRead;
				
			});
			
			
			
			// thead 체크 버튼 체크 시 => tbody 체크 버튼 모두 체크
			$("#all-check-btn").change(function(){
				
				if($(this).prop("checked")){ // 체크된 경우
					
					$("input[name=checkedNo]").prop("checked", true);
					
				} else {
					
					$("input[name=checkedNo]").prop("checked", false);
					
				}
				
			});
			
			// tbody 체크 버튼 모두 체크 시 => thead 체크 버튼 체크
			$("input[name=checkedNo]").change(function(){
				
				let checkbox = $("input[name=checkedNo]").length; // 체크박스 전체 개수
				let checked = $("input[name=checkedNo]:checked").length; // 체크된 체크박스 개수
				
				if(checkbox == checked){
					
					$("#all-check-btn").prop("checked", true);
					
				}else{
					
					$("#all-check-btn").prop("checked", false);
					
				}
				
			});
			
			
			// 메일 삭제용(삭제메일함으로 이동) ajax(삭제할 메일 체크 후 삭제 버튼 클릭 시)
			$("#trash-box-btn").click(function(){

				let checkedArr = [];
				
				$("input[name=checkedNo]:checked").each(function(){
					
					checkedArr.push($(this).next().val());
					
				});
				
				// 삭제할 메일 체크 하지 않고 삭제 버튼 클릭 시
				if(checkedArr.length == 0){
					
					alert("삭제할 메일을 선택 후 삭제 가능합니다.");
					
				}else{ // 삭제할 메일 체크 후 삭제 버튼 클릭 시
					
					$("#confirm-modal").modal({backdrop: "static"});
					
					$("#confirm-btn").click(function(){
						
						$.ajax({
							url:"trashlist.mail",
							dataType:"json",
							type:"post",
							data:{trashList:checkedArr},
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
								
								console.log("메일 목록 삭제용 ajax 통신 실패");	
								
							}
						});
						
					});
					
				}
				
				
			});

			
			
			// 메일 읽음 ajax(메일 체크 후 읽음 버튼 클릭 시)
			$("#read-btn").click(function(){

				let checkedArr = [];
				
				$("input[name=checkedNo]:checked").each(function(){
					
					checkedArr.push($(this).next().val());
					
				});
				
				// 읽음 처리할 메일 체크 하지 않고 읽음 버튼 클릭 시
				if(checkedArr.length == 0){
					
					alert("메일 선택 후 해당 버튼을 눌러주세요.");
					
				}else{ // 읽음 처리할 메일 체크 후 읽음 버튼 클릭 시
					
					$.ajax({
						url:"read.mail",
						dataType:"json",
						type:"post",
						data:{readList:checkedArr},
						success:function(result){
							
							if(result == "success"){
								
								$("#confirm-modal").modal("hide"); 
								
									location.reload();
				 			
							}
							
						}, error:function(){
							
							console.log("메일 목록 삭제용 ajax 통신 실패");	
							
						}
					});
					
				}
				
				
			});
			
			
			
			// 메일 안읽음 ajax(메일 체크 후 안읽음 버튼 클릭 시)
			$("#no-read-btn").click(function(){

				let checkedArr = [];
				
				$("input[name=checkedNo]:checked").each(function(){
					
					checkedArr.push($(this).next().val());
					
				});
				
				// 안읽음 처리할 메일 체크 하지 않고 안읽음 버튼 클릭 시
				if(checkedArr.length == 0){
					
					alert("메일 선택 후 해당 버튼을 눌러주세요.");
					
				}else{ // 안읽음 처리할 메일 체크 후 안읽음 버튼 클릭 시
					
					$.ajax({
						url:"noread.mail",
						dataType:"json",
						type:"post",
						data:{noReadList:checkedArr},
						success:function(result){
							
							if(result == "success"){
								
								$("#confirm-modal").modal("hide"); 
								
									location.reload();
				 			
							}
							
						}, error:function(){
							
							console.log("메일 목록 삭제용 ajax 통신 실패");	
							
						}
					});
					
				}
				
				
			});

		});
	</script>
</body>
</html>