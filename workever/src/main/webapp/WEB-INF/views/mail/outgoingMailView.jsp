<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보낸메일</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

<style>
	
    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
    }

    /* 삭제 버튼 영역 */
    .mail-btns-area {
        /* border-bottom:none; */
        padding-top:25px;
        padding-bottom:20px;
        text-align:right;
    }    
    
    .mail-btns-area button{
        border:1px solid #4E73DF;
        background: #4E73DF;
        color: white;
        width:75px;
    }

    .mail-btns-area button:hover{
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
    .receivers-area, .cc-area{
      padding:5px;
    }

    .receivers-area span, .cc-area span{
      border:2px solid #4E73DF;
	  background:white;
	  margin-right:10px;
	  margin-bottom:10px;
	  height:25px;
	  line-height:20px;
	  display:inline-block;
    }

    .receivers-area label, .cc-area label{
      box-sizing:border-box;
	  margin-bottom:0;
	  margin-left:20px;
	  margin-right:20px;
	  font-size:13px;
	  font-weight:600 !important;
	  color:#4E73DF;
    }
    
    /* 설정한 영역 범위 넘어가면 ...으로 표시  */
    .hide-area{
      width:1400px;
      height:45px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
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

</style>
</head>
<body class="hold-transition sidebar-mini">

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
		          <h1 id="page-title">보낸메일</h1>
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
		
		            <!-- 삭제 버튼 영역 -->
		            <div class="card-header mail-btns-area"> 
		              <button type="button" id="delete-btn" class="btn btn-sm" onclick="postFormSubmit();">완전삭제</button>
		            </div>
		            <!-- /.card-header -->
					<!-- 완전삭제 버튼 클릭 시 발신메일번호 post 방식으로 전달 -->
					<form id="postForm" method="post">
						<input type="hidden" name="msNo" value="${ mail.msNo }" /> 
					</form>
					
		            <div class="card-body">
		              <table id="mail-detail">
		                <thead>
		                  <tr>
		                    <th style="padding-top:0; width:140px;">보낸사람</th>
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
		                    <th>
		                    	받는사람
		                    	<button type="button" id="r-control-btn" class="btn btn-sm btn-default">▼</button>
		                    </th>
		                    <td>
		                      <div class="receivers-area hide-area">
		                        <c:forEach var="r" items="${ receiverList }">
			                        <span>
			                          <label>
			                          	<c:choose>
				                          	<c:when test="${ not empty r.mrUserName }">
				                          		<c:if test="${ r.mrDeptName ne '임원' }">
				                          			${ r.mrUserName }
				                          		</c:if>
				                          		${ r.mrUserRank }
				                          		${ r.mrUserName }
					                          	&lt;${ r.mrReceiver }&gt;
				                          	</c:when>
				                          	<c:otherwise>
				                          		${ r.mrReceiver }
				                          	</c:otherwise>
			                          	</c:choose>
			                          </label>
			                        </span>
		                        </c:forEach>
		                      </div>
		                    </td>
		                  </tr>
		                  <tr>
		                    <th> <!-- ▼ 버튼 누르면 토글로 열려야함 -->
		                     	 참조
		                      <button type="button" id="cc-control-btn" class="btn btn-sm btn-default">▼</button>
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
						                          			${ cc.mrUserName }
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
		              <button type="button" class="btn btn-sm" onclick="location.href='outbox.mail';">목록</button>
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
	
	
	
	<script>
		
		$(function(){
			
			// 보낸사람 영역 버튼 클릭 시 (수신자 목록 숨기기/보이기)
			$("#r-control-btn").click(function(){
				
				const $rArea = $(this).parent().next().find("div");
				
				if($rArea.hasClass("hide-area")){
					
					$rArea.removeClass("hide-area");
					$(this).text("▲");
					
				}else{
					
					
					$rArea.addClass("hide-area");
					$(this).text("▼");
				}
		
			});
			
			// 참조 영역 버튼 클릭 시 (참조자 목록 숨기기/보이기)
			$("#cc-control-btn").click(function(){
				
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
		
		
		
	  // 완전삭제 버튼 클릭 시 post 방식으로 게시글 번호 전달
	  function postFormSubmit(){
		  
	    // 요청처리 여부 확인 모달창 오픈
        $("#confirm-modal").modal({backdrop: "static"});
      
		  // 확인 버튼 클릭 시 완전삭제 요청 처리
	      $("#confirm-btn").click(function(){
	    	
	      $("#postForm").attr("action", "deleteog.mail").submit();
		      
		});
		  
	  }

	</script>
	
</body>
</html>