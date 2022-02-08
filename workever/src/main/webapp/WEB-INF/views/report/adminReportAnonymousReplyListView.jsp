<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명 게시판 신고 관리</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../common/links.jsp" />
  
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

    .anonymous-reply-btn{
        border:1px solid #4E73DF;
        background: #4E73DF;
        color: white;
    }

    .anonymous-reply-btn:hover{
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
    
    /* 신고글 목록 테이블 제목 영역 : 설정한 영역 범위 넘어가면 ...으로 표시  */
    .board-title-area{
      text-align:center;
    }

    .board-title-group{
      display:inline-block;
    }
    
    .board-title-group .board-title{
      display:table-cell;
    }
    
    .board-title-group .board-title-setting{
      /* border:1px solid red; */
      width:800px;
      height:25px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
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
        line-height: 25px;
    }

    
    /* 요청처리 여부 확인 모달창 영역 */
    #confirm-modal h6{
      margin-left:120px;
    }

    #confirm-modal .modal-body{
      text-align:center;
    }

    .confirm-modal-btns{
      /* border:1px solid red; */
      display: inline-block;
      margin-right:90px;
    }

    #confirm-btn{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
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
      padding:10px;
      text-align:left;
    }

    .report-detail-btns{
      /* border:1px solid red; */
      display: inline-block;
      margin-right:325px;
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
		                  <button type="button" class="btn btn-sm btn-default">게시글 관리</button>
		                  <button type="button" class="btn btn-sm anonymous-reply-btn">댓글 관리</button>
		                </div>
		              </div>
		              <div class="col-sm-6 board-header-area-right">
		                <button class="btn btn-sm">삭제</button>
		              </div>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		              <table id="board-list" class="table table-hover">
		
		                <thead>
		                  <tr>
		                    <th width="5%">
		                      <input type="checkbox"> 
		                    </th>
		                    <th width="10%">신고번호</th>
		                    <th width="20%">신고유형</th>
		                    <th width="35%">신고글 제목</th>
		                    <th width="10%">익명글 번호</th>
		                    <th width="10%">블라인드 처리</th>
		                    <th  width="10%">신고시간</th>
		                  </tr>
		                </thead>
		
		                <tbody>
		                  <!-- case 1. 게시글 목록 존재하지 않을 경우 -->
		                  <tr>
		                    <td colspan="6">게시글이 없습니다.</td>
		                  </tr>
		                  <!-- case 2. 게시글 목록 존재할 경우 -->
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>10</td>
		                    <td>타사원 비방</td>
		                    <td>익명 댓글 신고</td>
		                    <td>20</td>
		                    <td>완료</td>
		                    <td>2022-02-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>10</td>
		                    <td>성적 불쾌감 유발</td>
		                    <td>익명 댓글 신고</td>
		                    <td>20</td>
		                    <td>완료</td>
		                    <td>2022-02-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>10</td>
		                    <td>욕설/혐오/불쾌/차별적 표현</td>
		                    <td>익명 댓글 신고</td>
		                    <td>20</td>
		                    <td>완료</td>
		                    <td>2022-02-00 00:00</td>
		                  </tr>
		                  <tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>10</td>
		                    <td>게시글 도배</td>
		                    <td>익명 댓글 신고</td>
		                    <td>20</td>
		                    <td>완료</td>
		                    <td>2022-02-00 00:00</td>
		                  </tr>
		                  <tr> 
		                    <tr>
		                      <td>
		                        <input type="checkbox"> 
		                      </td>
		                      <td>10</td>
		                      <td>개인정보 노출</td>
		                      <td>익명 댓글 신고</td>
		                      <td>20</td>
		                      <td>완료</td>
		                      <td>2022-02-00 00:00</td>
		                    </tr>
		                    <tr>
		                    <tr>
		                      <td>
		                        <input type="checkbox"> 
		                      </td>
		                      <td>10</td>
		                      <td>욕설/혐오/불쾌/차별적 표현</td>
		                      <td>익명 댓글 신고</td>
		                      <td>20</td>
		                      <td>완료</td>
		                      <td>2022-02-00 00:00</td>
		                    </tr>    
		                    <tr>
		                      <td>
		                        <input type="checkbox"> 
		                      </td>
		                      <td>10</td>
		                      <td>욕설/혐오/불쾌/차별적 표현</td>
		                      <td>익명 댓글 신고</td>
		                      <td>20</td>
		                      <td>완료</td>
		                      <td>2022-02-00 00:00</td>
		                    </tr>    
		                    <tr>
		                      <td>
		                        <input type="checkbox"> 
		                      </td>
		                      <td>10</td>
		                      <td>욕설/혐오/불쾌/차별적 표현</td>
		                      <td>익명 댓글 신고</td>
		                      <td>20</td>
		                      <td>완료</td>
		                      <td>2022-02-00 00:00</td>
		                    </tr>    
		                    <tr>
		                      <td>
		                        <input type="checkbox"> 
		                      </td>
		                      <td>10</td>
		                      <td>욕설/혐오/불쾌/차별적 표현</td>
		                      <td>익명 댓글 신고</td>
		                      <td>20</td>
		                      <td>완료</td>
		                      <td>2022-02-00 00:00</td>
		                    </tr>    
		                    <tr>
		                      <td>
		                        <input type="checkbox"> 
		                      </td>
		                      <td>10</td>
		                      <td>욕설/혐오/불쾌/차별적 표현</td>
		                      <td>익명 댓글 신고</td>
		                      <td>20</td>
		                      <td>완료</td>
		                      <td>2022-02-00 00:00</td>
		                    </tr>    
		
		                </tbody>
		            
		              </table>
		
		            </div>
		            <!-- /.card-body -->
		
		            <!-- 페이징 처리 영역 -->
		            <div class="card-footer">
		            
		              <div class="paging-area">
		
		                <a class="btn">&lt;</a>
		                <a class="btn">1</a>
		                <a class="btn">2</a>
		                <a class="btn">3</a>
		                <a class="btn">&gt;</a>
		
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
		
		<button type="button" class="btn btn-primary" id="myBtn">Open Modal</button>
		
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
	        <h5 class="modal-title"><b>익명 댓글 신고</b></h5>
	        <button type="button" class="close" data-dismiss="modal">×</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
	        <table>
	
	          <thead>
	            <tr>
	              <th>신고 작성 사원</th>
	              <td id="report-user-name" colspan="3">홍길동</td>
	            </tr>
	            <tr>
	              <th>신고 유형</th>
	              <td id="report-group">욕설/혐오/불쾌/차별적 표현</td>
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
	                <div id="report-content">
	                  신고글내용들어가는자리입니다<br>
	                  신고글내용들어가는자리입니다<br>
	                  신고글내용들어가는자리입니다<br>
	                  신고글내용들어가는자리입니다<br>
	                  신고글내용들어가는자리입니다<br>
	                </div>
	              </td>
	            </tr>
	          </tbody>
	
	        </table>
	      </div>
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <div class="report-detail-btns">
	          <!-- case 1. 블라인드 처리 전에 보이는 버튼 => 블라인드 버튼 -->
	          <button id="blind-btn" class="btn btn-sm">블라인드</button>
	          <!-- case 2. 블라인드 처리 후에 보이는 버튼 => 블라인드 해제 버튼 -->
	          <button id="blind-cancel-btn"class="btn btn-sm">해제</button>
	        </div>
	      </div>
	      
	    </div>
	  </div>
	</div>
	
	
	<!-- 요청처리 여부 확인 모달창 -->
	<!-- The Modal -->
	<div class="modal fade" id="confirm-modal">
	  <div class="modal-dialog modal-sm modal-dialog-centered">
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
	
	<jsp:include page="../common/scripts.jsp" />
	
	<script>
	  $(document).ready(function(){
	
	    $("#myBtn").click(function(){
	      $("#report-detail-modal").modal({backdrop: "static"});
	    });
	
	    
	    $("#blind-btn").click(function(){
	      $("#confirm-modal").modal({backdrop: "static"});
	    });
	
	  });
	</script>
	
</body>
</html>