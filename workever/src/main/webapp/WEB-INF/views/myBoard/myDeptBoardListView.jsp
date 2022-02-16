<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 부서 게시글</title>
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

    /* 게시글 분류/삭제버튼 영역 */
    .board-header-area {
      /* border:1px solid red; */
        border-bottom:none;
        padding-top:25px;
        padding-bottom:0;
    }

    /* 게시글 분류 영역 */
    .board-header-area-left{
        /* border:1px solid red; */
        box-sizing: border-box;
        padding:0;
        float:left;
    }

    .board-header-area-left button{
        width:75px;
        height:30px;
        font-size:13px;
    }

    .dept-board-btn{
        border:1px solid #4E73DF;
        background: #4E73DF;
        color: white;
    }

    .dept-board-btn:hover{
        color: white;
    }  

    /* 게시글 삭제버튼 영역 */
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
    .board-title-area{
      text-align:center;
    }

    .board-title-group{
      display:inline-block;
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
        line-height: 25px;
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
		          <h1 id="page-title">나의 부서 게시글</h1>
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
		
		            <!-- 부서별 게시글 정렬/등록버튼 영역 -->
		            <div class="card-header board-header-area">
		              <div class="col-sm-6 board-header-area-left">
		                <div class="btn-group">
		                  <button type="button" class="btn btn-sm dept-board-btn" onclick="location.href='list.mdbo';">부서별</button>
		                  <button type="button" class="btn btn-sm btn-default">익명</button>
		                </div>
		              </div>
		              <div class="col-sm-6 board-header-area-right">
		                <!-- 관리자일 경우에만 보임 -->
		                <button type="button" id="delete-btn" class="btn btn-sm">삭제</button>
		              </div>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		              <table id="board-list" class="table table-hover">
		
		                <thead>
		                  <tr>
		                    <th width="5%">
		                      <input id="all-check-btn" type="checkbox"> 
		                    </th>
		                    <th width="10%">글번호</th>
		                    <th width="60%">제목</th>
		                    <th width="10%">조회수</th>
		                    <th  width="15%">작성일</th>
		                  </tr>
		                </thead>
		
		                <tbody>
			                <c:choose>
				              <c:when test="${ empty list }">	
				                  <!-- case 1. 게시글 목록 존재하지 않을 경우 -->
				                  <tr>
				                    <td colspan="5">게시글이 없습니다.</td>
				                  </tr>
			                  </c:when>
				              <c:otherwise>  
				                  <!-- case 2. 게시글 목록 존재할 경우 -->
				                  <c:forEach var="b" items="${ list }">
					                  <tr>
					                    <td>
					                      <input type="checkbox" name="deleteNo"> 
					                    </td>
					                    <td>${ b.dbNo }</td>
					                    <td class="board-title-area">
					                      <div class="board-title-group">
					                        <div class="board-title">
					                          <div class="board-title-setting">${ b.dbTitle }</div>
					                       </div>
					
					                        <div class="reply-count">
					                        	<c:if test="${ b.dbReplyCount > 0 }">
					                            	<label>[${ b.dbReplyCount }]</label> <!-- 댓글 개수 -->
					                        	</c:if>
					                        </div>
					                      </div>
					                    </td>
					                    <td>${ b.dbCount }</td>
					                    <td>${ b.dbDate }</td>
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
		
              			<c:if test="${ pi.currentPage ne 1 }">
	                		<a class="btn" href="dlist.mbo?cpage=${ pi.currentPage - 1 }">&lt;</a>
	                	</c:if>
		                
		                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
		                
                			<a class="btn" href="dlist.mbo?cpage=${ p }">${ p }</a>
                			
		                </c:forEach>
		                
                		<c:if test="${ pi.currentPage ne pi.maxPage }">
             	   			<a class="btn" href="dlist.mbo?cpage=${ pi.currentPage + 1 }">&gt;</a>
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
	
		
	
	<script>
		$(function(){
			
			// 게시글 상세 조회
			$("#board-list tbody .board-title").click(function(){
				
				const $dbNo = $(this).parents(".board-title-area").prev().text();
				location.href = "detail.dbo?dbno=" + $dbNo;
				
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
			
			
			// 나의 부서 게시글 삭제용 ajax(삭제할 게시글 체크 후 삭제 버튼 클릭 시)
			$("#delete-btn").click(function(){
				
				let checkedArr = [];
				
				$("input[name=deleteNo]:checked").each(function(){
					
					checkedArr.push($(this).parent().next().text());
					
				});
				
				// 삭제할 게시글 체크 하지 않고 삭제 버튼 클릭 시
				if(checkedArr.length == 0){
					
					alert("삭제할 게시글을 선택 후 삭제 가능합니다.");
					
				}else{ // 삭제할 게시글 체크 후 삭제 버튼 클릭 시
					
					$("#confirm-modal").modal({backdrop: "static"});
				
					$("#confirm-btn").click(function(){
						
						$.ajax({
							url:"delete.mdbo",
							dataType:"json",
							type:"post",
							data:{deleteList:checkedArr},
							success:function(result){
								
								if(result == "success"){
									
									location.reload();
									
								}
								
							}, error:function(){
								
								console.log("나의 부서 게시글 삭제용 ajax 통신 실패");	
								
							}
						});
						
					});

				}
				
				
			});
			
		});
	</script>
	
</body>
</html>