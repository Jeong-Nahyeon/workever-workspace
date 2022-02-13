<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
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
    
    #page-title a{
    	text-decoration:none;
    	color:black;
    }

    /* 게시글 정렬설정/검색/등록버튼 영역 */
    .board-header-area {
      /* border:1px solid red; */
        border-bottom:none;
        padding-top:25px;
        padding-bottom:0;
    }

    /* 게시글 정렬설정 영역 */
    .board-header-area-left{
        /* border:1px solid red; */
        box-sizing: border-box;
        padding:0;
        float:left;
    }

    .board-header-area-left select{
        width:100px;
        height:30px;
        font-size:12px;
    }  

    /* 게시글 검색 영역 */
    .board-header-area-center{
      /* border:1px solid red; */
      box-sizing: border-box;
      text-align:center !important;
      padding:0;
      float:left;
    }

    .board-header-area-center select{
      margin-right:10px;
      width:80px;
      height:30px;
      font-size:12px;
      display:table-cell;
    }  

    .board-header-area-center input{
      margin-right:10px;
      width:300px;
      height:30px;
      display:table-cell;
    }  

    .board-header-area-center button{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
      height:30px;
    }
    
    .board-header-area-center button:hover{
        color: white;
    }      

    /* 게시글 등록버튼 영역 */
    .board-header-area-right{
        /* border:1px solid red; */
        box-sizing: border-box;
        text-align:right;
        padding:0;
        float:left;
    }

    .board-header-area-right button{
        border:1px solid #4E73DF;
        background: #4E73DF;
        color: white;
        width:75px;
        height:30px;
    }

    .board-header-area-right button:hover{
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
    #board-list .board-title{
      /* border:1px solid red; */
      width:800px;
      height:26px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      
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
    
    /* 요청처리 여부 확인 모달창 영역 */
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
		          <h1 id="page-title"><a href="list.nbo">공지사항 게시판</a></h1>
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
		
		            <!-- 공지게시글 정렬/검색/등록버튼 영역 -->
		            <div class="card-header board-header-area">
		              
		              <!-- 게시글 정렬 -->	
		              <div class="col-sm-3 board-header-area-left">
		                <select name="orderList" class="form-control">
		                  <option value="desc">최신순</option>
		                  <option value="asc">오래된순</option>
		                </select>
		              </div>
		              
		              <!-- 게시글 검색 -->
		              <div class="col-sm-6 board-header-area-center" align="center">
		              	  <form id="search-area" action="search.nbo" method="get">
			                  <select name="condition" class="form-control">
			                  	<option value="title">제목</option>
			                  	<option value="content">내용</option>
			                  </select>
			                  <input type="text" name="keyword" class="form-control">
			                  <button type="submit" class="btn btn-sm">검색</button>
			              </form>
			          </div>
		              
		              <!-- 게시글 등록 -->
		              <div class="col-sm-3 board-header-area-right">
		                <!-- 관리자일 경우에만 보임 -->
		                <c:if test="${ loginUser.userRank eq '관리자' }">
		                	<button type="button" id="enroll-form-btn" class="btn btn-sm" onclick="location.href = 'enrollForm.nbo';">글작성</button>
		                </c:if>
		              </div>
		              
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
				                    <td>${ b.nbNo }</td>
				                    <td align="center">
				                      <div class="board-title">
				                      	${ b.nbTitle }
				                      </div>
				                    </td>
				                    <td>${ b.nbCount }</td>
				                    <td>${ b.nbDate }</td>
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
		              	
		              	<c:choose>
		              		<c:when test="${ empty orderList }"> <!-- 최신순 -->
		              		
		              			<c:choose>
			              			<c:when test="${ empty condition }"> <!-- 검색 전 -->
										<c:if test="${ pi.currentPage ne 1 }">
						                	<a class="btn" href="list.nbo?cpage=${ pi.currentPage - 1 }">&lt;</a>
						                </c:if>
					                </c:when>
					                <c:otherwise> <!-- 검색 후 -->
					                	<c:if test="${ pi.currentPage ne 1 }">
						                	<a class="btn" href="search.nbo?cpage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }">&lt;</a>
						                </c:if>
					                </c:otherwise>
				                </c:choose>
				                
			                </c:when>
			                <c:otherwise> <!-- 오래된순 -->
			                	
				                <c:choose>
			              			<c:when test="${ empty condition }"> <!-- 검색 전 -->
										<c:if test="${ pi.currentPage ne 1 }">
						                	<a class="btn" href="list.nbo?cpage=${ pi.currentPage - 1 }&orderList=${ orderList }">&lt;</a>
						                </c:if>
					                </c:when>
					                <c:otherwise> <!-- 검색 후 -->
					                	<c:if test="${ pi.currentPage ne 1 }">
						                	<a class="btn" href="search.nbo?cpage=${ pi.currentPage - 1 }&orderList=${ orderList }&condition=${ condition }&keyword=${ keyword }">&lt;</a>
						                </c:if>
					                </c:otherwise>
				                </c:choose>
				                
		                	</c:otherwise>
		                </c:choose>
		                
		                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
		              	  
			                <c:choose>
			                	<c:when test="${ empty orderList }"> <!-- 최신순 -->
			                	
			                		<c:choose>
			              				<c:when test="${ empty condition }"> <!-- 검색 전 -->
				                			<a class="btn" href="list.nbo?cpage=${ p }">${ p }</a>
				                		</c:when>
						                <c:otherwise> <!-- 검색 후 -->
				                			<a class="btn" href="search.nbo?cpage=${ p }&condition=${ condition }&keyword=${ keyword }">${ p }</a>
						                </c:otherwise>
				                	</c:choose>
				                	
				                </c:when>
				                <c:otherwise> <!-- 오래된순 -->
				                
			                		<c:choose>
			              				<c:when test="${ empty condition }"> <!-- 검색 전 -->
				                			<a class="btn" href="list.nbo?cpage=${ p }&orderList=${ orderList }">${ p }</a>
				                		</c:when>
						                <c:otherwise> <!-- 검색 후 -->
				                			<a class="btn" href="search.nbo?cpage=${ p }&orderList=${ orderList }&condition=${ condition }&keyword=${ keyword }">${ p }</a>
						                </c:otherwise>
				                	</c:choose>
			                		
				                </c:otherwise>
			                </c:choose>
			                
		                </c:forEach>
		                
		                <c:choose>
		                	<c:when test="${ empty orderList }"> <!-- 최신순 -->
		                	
		                		<c:choose>
		              				<c:when test="${ empty condition }"> <!-- 검색 전 -->
					                	<c:if test="${ pi.currentPage ne pi.maxPage }">
					             	   		<a class="btn" href="list.nbo?cpage=${ pi.currentPage + 1 }">&gt;</a>
					             	 	</c:if>
				             	 	</c:when>
							        <c:otherwise> <!-- 검색 후 -->
					                	<c:if test="${ pi.currentPage ne pi.maxPage }">
					             	   		<a class="btn" href="search.nbo?cpage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }">&gt;</a>
					             	 	</c:if>
							        </c:otherwise>
			                	</c:choose>
			                	
		             	    </c:when>
		             	    <c:otherwise> <!-- 오래된순 -->
		             	    
			             	 	<c:choose>
		              				<c:when test="${ empty condition }"> <!-- 검색 전 -->
					                	<c:if test="${ pi.currentPage ne pi.maxPage }">
					             	   		<a class="btn" href="list.nbo?cpage=${ pi.currentPage + 1 }&orderList=${ orderList }">&gt;</a>
					             	 	</c:if>
				             	 	</c:when>
							        <c:otherwise> <!-- 검색 후 -->
					                	<c:if test="${ pi.currentPage ne pi.maxPage }">
					             	   		<a class="btn" href="search.nbo?cpage=${ pi.currentPage + 1 }&orderList=${ orderList }&condition=${ condition }&keyword=${ keyword }">&gt;</a>
					             	 	</c:if>
							        </c:otherwise>
			                	</c:choose>
			             	 	
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
	
	
	
	
	<!-- 스크립트 작성 영역 -->
	
	<!-- 검색 후  => 사용자가 요청한 검색조건 및 검색 키워드 유지 -->
	<c:if test="${ not empty condition }">
		<script>
			$(function(){
				
				$("select[name=condition] option[value=${ condition }]").attr("selected", true);
				$("#search-area input[type=text]").val("${ keyword }");
				
			});
		</script>
	</c:if>	
	
	<!-- 오래된순으로 조회 시 => 오래된순 옵션 유지 -->
	<c:if test="${ not empty orderList }">
		<script>
			$(function(){
				
				$("select[name=orderList] option[value=${ orderList }]").attr("selected", true);
				
			});
		</script>
	</c:if>
	
	<script>
		$(function(){
			
			// 공지사항 게시판 목록 및 검색 목록 순차 정렬 조회 (최신순/오래된순)
			$("select[name=orderList]").change(function(){
				
				const $option = $(this).children("option:selected").val();
				
				if("" == "${ condition }"){ // 검색 전
					
					if($option == "asc"){ // 오래된순
						location.href = "list.nbo?orderList=" + $option;
					}else{ // 최신순
						location.href = "list.nbo";
					}
					
				}else{ // 검색 후
					
					if($option == "asc"){ // 오래된순
						location.href = "search.nbo?orderList=" + $option + "&condition=${ condition }&keyword=${ keyword }";
					}else{ // 최신순
						location.href = "search.nbo?condition=${ condition }&keyword=${ keyword }";
					}
						
				}
				
			});
			
			// 공지사항 게시글 상세 조회
			$("#board-list tbody .board-title").click(function(){
				
				const $nbNo = $(this).parent().prev().text();
				
				location.href = "detail.nbo?nbno=" + $nbNo;
				
			});
			
			
		});
		
	</script>
	
	
</body>
</html>