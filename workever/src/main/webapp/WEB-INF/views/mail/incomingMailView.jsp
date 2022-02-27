<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>받은메일</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

<style>
	
    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
    }

    /* 답장/전달/삭제 버튼 영역 */
    .mail-btns-area {
        /* border-bottom:none; */
        padding-top:25px;
        padding-bottom:20px;
    }

    /* 답장/전달 버튼 영역 */
    .mail-btns-area-left{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:50%;
        float: left;
    }

    .mail-btns-area-left button{
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

    /* 내용 제외 입력 정보 영역 */
    #mail-detail{
      box-sizing: border-box;
      width:100%;
      
    }

    #mail-detail thead tr{
      border-bottom:1px solid #DEE2E6;
    }

    #mail-detail thead th{
      padding:20px;
      text-align:center;
    }

    #mail-detail thead td{
      padding:20px;
    }

    /* 보낸사람 및 참조 영역 */
    .sender-area, .cc-area{
      padding:5px;
    }
   
    /* 참조영역 영역 : 설정한 영역 범위 넘어가면 ...으로 표시  */
    .hide-area{
      width:1400px;
      height:45px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .sender-area span, .cc-area span{
      border:2px solid #4E73DF;
	  background:white;
	  margin-right:10px;
	  margin-bottom:10px;
	  height:25px;
	  line-height:20px;
	  display:inline-block;
    }

    .sender-area label, .cc-area label{
      box-sizing:border-box;
	  margin-bottom:0;
	  margin-left:20px;
	  margin-right:20px;
	  font-size:13px;
	  font-weight:600 !important;
	  color:#4E73DF;
    }


    /* 메일 내용 영역 */
    .mail-content-area{
      padding:20px;
    }


    /* 목록 버튼 영역 */
    .btns-area{
        /* border:1px solid red; */
        padding:10px;
        text-align:center;
    }

    .btns-area button{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
    }

    .btns-area button:hover{
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
		          <c:choose>
		          	<c:when test="${ empty from }">
		          		<h1 id="page-title">받은메일</h1>
		          	</c:when>
		          	<c:otherwise>
		          		<h1 id="page-title">삭제메일</h1>
		          	</c:otherwise>
		          </c:choose>
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
		
		            <!-- 답장/전달/삭제 버튼 영역 -->
		            <div class="card-header mail-btns-area"> 
		              <div class="col-sm-6 mail-btns-area-left">
		              	<c:choose>
		              		<c:when test="${ empty from }">
				                <button type="button" class="btn btn-sm btn-default" onclick="postFormSubmit(1);">답장</button>
				                <button type="button" class="btn btn-sm btn-default" onclick="postFormSubmit(2);">전달</button>
			                </c:when>
			                <c:otherwise>
			                	<button type="button" class="btn btn-sm btn-default" style="width:120px;" onclick="postFormSubmit(4);">받은메일함 이동</button>
			                </c:otherwise>
		                </c:choose>
		              </div>
		              <div class="col-sm-6 mail-btns-area-right">
		                <c:choose>
		              		<c:when test="${ empty from }">
				                <button type="button" class="btn btn-sm" onclick="postFormSubmit(3);">삭제</button>
			                </c:when>
			                <c:otherwise>
			                	<button type="button" class="btn btn-sm" onclick="postFormSubmit(5);">완전삭제</button>
			                </c:otherwise>
		                </c:choose>
		              </div>
		            </div>
		            <!-- /.card-header -->
					<!-- 답장/전달/삭제 버튼 클릭 시 수신메일번호 post 방식으로 전달 -->
					<form id="postForm" method="post">
						<input type="hidden" name="mrNo" value="${ mail.mrNo }" /> 
						<input type="hidden" name="mrMsNo" value="${ mail.mrMsNo }" /> 
					</form>
					
		            <div class="card-body">
		              <table id="mail-detail">
		                <thead>
		                  <tr>
		                    <th style="padding-top:0; width:140px;">받는사람</th>
		                    <td style="padding-top:0">${ loginUser.userName }</td>
		                  </tr>
		                  <tr>
		                    <th>제목</th>
		                    <td>${ mail.msTitle }</td>
		                  </tr>
		                  <tr>
		                    <th>발신일시</th>
		                    <td>${ mail.msDate }</td>
		                  </tr>
		                  <tr>
		                    <th>보낸사람</th>
		                    <td>
		                      <div class="sender-area">
		                        <span>
		                          <label>
			                          <c:if test="${ mail.msDeptName ne '임원' }">
			                          	${ mail.msDeptName }
			                          </c:if>
			                          ${ mail.msUserRank }
			                          ${ mail.msUserName }
			                          &lt;${ mail.msSender }&gt;
		                          </label>
		                        </span>
		                      </div>
		                    </td>
		                  </tr>
		                  <tr>
		                    <th> <!-- ▼ 버튼 누르면 토글로 열려야함 -->
		                                             참조
		                      <button type="button" id="hide-control-btn" class="btn btn-sm btn-default">▼</button>
		                    </th>
		                    <td>
		                      <div class="cc-area hide-area">
		                      	<c:choose>
		                      		<c:when test="${ empty ccList }">
		                      			참조자 없음
			                        </c:when>
			                        <c:otherwise>
			                        	<c:forEach var="cc" items="${ ccList }">
					                        <span>
					                          <label>
					                          	<c:choose>
						                          	<c:when test="${ not empty cc.mrUserName }">
						                          		<c:if test="${ cc.mrDeptName ne '임원' }">
						                          			${ cc.mrDeptName }
						                          		</c:if>
						                          		${ cc.mrUserRank }
						                          		${ cc.mrUserName }
							                          	&lt;${ cc.mrReceiver }&gt;
						                          	</c:when>
						                          	<c:otherwise>
						                          		${ cc.mrReceiver }
						                          	</c:otherwise>
					                          	</c:choose>
					                          </label>
					                        </span>
				                        </c:forEach>
			                        </c:otherwise>
		                        </c:choose>
		                      </div>
		                    </td>
		                  </tr>
		                  <tr>
		                    <th>첨부파일</th>
		                    <td>
		                      <c:choose>
								<c:when test="${ empty mailFileList }">
									첨부파일 없음
								</c:when>
								<c:otherwise>
									<c:forEach var="mf" items="${ mailFileList }">
										<a href="${ mf.mfPath }${ mf.mfChangeName }" download="${ mf.mfOriginName }" >${ mf.mfOriginName }</a><br>
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
		                      <div class="mail-content-area">${ mail.msContent }</div>
		                    </td>
		                  </tr>
		               </tbody>
		              </table>
		            </div>
		            <!-- /.card-body -->
		
		
		          <!-- 목록 버튼 영역 -->
		          <div class="card-footer">
		
		            <div class="btns-area">
		              <c:choose>
			          	<c:when test="${ empty from }">
			              	<button type="button" class="btn btn-sm" onclick="location.href='inbox.mail';">목록</button>
			          	</c:when>
			          	<c:otherwise>
			              	<button type="button" class="btn btn-sm" onclick="location.href='trashbox.mail';">목록</button>
			          	</c:otherwise>
			          </c:choose>
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
			
			// 참조 영역 버튼 클릭 시 (참조자 목록 숨기기/보이기)
			$("#hide-control-btn").click(function(){
				
				const $ccArea = $(this).parent().next().find("div");
				
				if($ccArea.hasClass("hide-area")){
					
					$ccArea.removeClass("hide-area");
					$(this).text("▲");
					
				}else{
					
					$ccArea.addClass("hide-area");
					$(this).text("▼");
					
				}
		
			});
			
		});
		
		
		
	  // 답장/전달/삭제 버튼 클릭 시 post 방식으로 게시글 번호 전달
	  function postFormSubmit(num){
		  
		  if(num == 1){ // 답장 버튼 클릭
			  
			  $("#postForm").attr("action", "response.mail").submit();
			  
		  }else if(num == 2){ // 전달 버튼 클릭
			  
			  $("#postForm").attr("action", "deliver.mail").submit();
			  
		  }else if(num == 3){ // 삭제 버튼 클릭
			  
			  // 요청처리 여부 확인 모달창 오픈
		      $("#confirm-modal").modal({backdrop: "static"});
		      
				// 확인 버튼 클릭 시 삭제 요청 처리
			    $("#confirm-btn").click(function(){
			    	
			    	$("#postForm").attr("action", "trash.mail").submit();
				      
				});
			  
		  }else if(num == 4){ // 받은메일함 이동 버튼 클릭(삭제메일함에서 상세 조회)
			  
			  $("#postForm").attr("action", "detailtoinbox.mail").submit();
			  
		  }else{ // 완전삭제 버튼 클릭 (삭제메일함에서 상세 조회)
			  
			  // 요청처리 여부 확인 모달창 오픈
		      $("#confirm-modal").modal({backdrop: "static"});
		      
				// 확인 버튼 클릭 시 완전삭제 요청 처리
			    $("#confirm-btn").click(function(){
			    	
			    	$("#postForm").attr("action", "deleteic.mail").submit();
				      
				});
		  
		  }
		  
	  }

	</script>

</body>
</html>