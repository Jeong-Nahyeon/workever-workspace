<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>익명 게시글 상세</title>

<jsp:include page="../common/links.jsp" />

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
    .mail-content-area{
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
      cursor:pointer;
    }

    .reply-list .reply-content{
      padding:20px;
    }

    /* 댓글 블라인드용 영역 */
    .reply-blind{
      padding:20px;
      color:lightgray;
      text-align:center;
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
  

    /* 신고 모달창 영역 */
    #report-modal h5{
      margin-left:360px;
    }
    
    #report-modal table{
      width:100%;
      text-align:center;
    }

    #report-modal table th, #report-modal table td{
      padding:15px;
    }
    
    #report-modal select{
      width:100%;
    }

    #report-content{
      box-sizing:border-box;
      width:100%;
      height:200px;
      resize:none;
    }

    .report-modal-btns{
      /* border:1px solid red; */
      display: inline-block;
      margin-right:325px;
    }

    #report-btn{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
      height:30px;
    }

    #report-btn:hover{
      color: white;
    }

    #report-cancel-btn{
      width:75px;
      height:30px;
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
		          <h1 id="page-title">익명 게시글 상세</h1>
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
		              <!-- case 1. 본인 게시글일 경우 -->
		              <button class="btn btn-sm btn-default update-btn">수정</button>
		              <button class="btn btn-sm btn-default delete-btn">삭제</button>
		              <!-- case 2. 타사원 게시글일 경우 -->
		              <button  id="test-report" class="btn btn-sm report-btn">신고</button>
		              <!-- 공통 -->
		              <button class="btn btn-sm list-btn">목록</button>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		
		              <table id="board-detail">
		                <thead>
		                  <tr>
		                    <th style="padding-top:0">제목</th>
		                    <td style="padding-top:0">
		                      <span class="right badge badge-primary">블라인드</span>
		                      	제목들어가는자리
		                    </td>
		                  </tr>
		                    <th>작성일</th>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <th>첨부파일</th>
		                    <td>
		                      <a href="#">dddddd.jpg</a><br>
		                      <a href="#">bbbbbb.png</a>
		                    </td>
		                  </tr>
		                  <tr align="center">
		                    <th colspan="2">내용</th>
		                  </tr>
		                  <tr>
		                </thead>
		                <tbody>
		                    <td colspan="2">
		                      <div class="mail-content-area">
		                        <h1><u>Heading Of Message</u></h1>
		                        <h4>Subheading</h4>
		                        <p>But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain
		                          was born and I will give you a complete account of the system, and expound the actual teachings
		                          of the great explorer of the truth, the master-builder of human happiness. No one rejects,
		                          dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know
		                          how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again
		                          is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain,
		                          but because occasionally circumstances occur in which toil and pain can procure him some great
		                          pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise,
		                          except to obtain some advantage from it? But who has any right to find fault with a man who
		                          chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that
		                          produces no resultant pleasure? On the other hand, we denounce with righteous indignation and
		                          dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so
		                          blinded by desire, that they cannot foresee</p>
		                        <ul>
		                          <li>List item one</li>
		                          <li>List item two</li>
		                          <li>List item three</li>
		                          <li>List item four</li>
		                        </ul>
		                        <p>Thank you,</p>
		                        <p>John Doe</p>
		                    </div>
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
		                    <textarea id="reply-insert-content"></textarea>
		                  </td>
		                  <td class="reply-insert-btns">
		                    <button id="reply-insert-btn" class="btn">댓글등록</button>
		                  </td>
		                </tr>
		                <tr>
		                  <th colspan="2" style="padding-top:20px;">댓글 목록 (5)</th>
		                </tr>
		            </table>  
		
		            <!-- 댓글 목록 영역 -->
		            <table class="reply-list">
		              <!-- case 1. 블라인드 처리된 댓글일 경우 -->
		              <!-- <tr>
		                <td class="reply-blind" colspan="3">
		                  <span style="color:lightgray;">블라인드 처리된 댓글입니다</span>
		                </td>
		              </tr> -->
		
		              <!-- case 2. 일반 댓글일 경우 -->
		              <tr>
		                <td class="reply-list-img" rowspan="2">
		                  <!-- case 1. 프로필 이미지 있을 경우 -->
		                  <!-- <img class="img-circle img-bordered-sm reply-img"> -->
		                  <!-- case 2. 프로필 이미지 없을 경우 -->
		                  <i class="fas fa-user-circle fa-3x reply-no-img"></i>
		                </td>
		                <td class="reply-list-name">
		                  <b>익명</b>
		                  <!-- 관리자가 접속했을 경우 => 블라인드 처리된 댓글 보이고, 블라인드 뱃지 붙어있음 -->
		                  <span class="right badge badge-primary">블라인드</span>
		                </td>
		                <td class="reply-list-btns">
		                  <!-- case 1. 본인 댓글일 경우 -->
		                  <a>수정</a>
		                  <a>삭제</a>
		                  <!-- case 2. 타사원 댓글일 경우 -->
		                  <!-- <a>신고</a> -->
		                </td>
		              </tr>
		              <tr>
		                <td>
		                  <span>2022.01.00 00:00</span>
		                </td>
		                <td></td>
		              </tr>
		              <tr>
		                <td colspan="3">
		                  <p class="reply-content">댓글 내용 영역입니다.</p>
		                </td>
		              </tr>
		            </table>
		            
		            
		            <table class="reply-list">
		              <tr>
		                <td class="reply-blind" colspan="3">
		                  <span style="color:lightgray;">블라인드 처리된 댓글입니다</span>
		                </td>
		              </tr>
		            </table>
		
		            
		            <table class="reply-list">
		              <tr>
		                <td class="reply-list-img" rowspan="2">
		                  <i class="fas fa-user-circle fa-3x reply-no-img"></i>
		                </td>
		                <td class="reply-list-name">
		                  <b>익명</b>
		                </td>
		                <td class="reply-list-btns">
		                  <a>신고</a>
		                </td>
		              </tr>
		              <tr>
		                <td>
		                  <span>2022.01.00 00:00</span>
		                </td>
		                <td></td>
		              </tr>
		              <tr>
		                <td colspan="3">
		                  <p class="reply-content">댓글 내용 영역입니다.</p>
		                </td>
		              </tr>
		            </table>              
		
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
	<div class="modal fade" id="report-modal">
	  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h5 class="modal-title"><b>신고</b></h5>
	        <button type="button" class="close" data-dismiss="modal">×</button>
	      </div>
	      
	      <!-- Modal body -->
	      <div class="modal-body">
	        <form id="">
	          <table>
	              <tr>
	                <th>신고 유형</th>
	                <td>
	                  <select class="form-control">
	                    <option>개인정보 노출</option>
	                    <option>게시글 도배</option>
	                    <option>성적 불쾌감 유발</option>
	                    <option>욕설/혐오/불쾌/차별적 표현</option>
	                    <option>타사원 비방</option>
	                  </select>
	                </td>
	              </tr>
	              <tr>
	                <th colspan="2">신고 내용</th>
	              </tr>
	              <tr>
	                <td colspan="2">
	                  <textarea id="report-content"></textarea>
	                </td>
	              </tr>
	          </table>
	        </form>
	      </div>
	      
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <div class="report-modal-btns">
	          <button id="report-cancel-btn" class="btn btn-sm btn-default" data-dismiss="modal">취소</button>
	          <button id="report-btn" class="btn btn-sm" form="">등록</button>
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

	<!-- 스크립트 영역 -->
	<script>
	  $(document).ready(function(){
	
	    $("#test-report").click(function(){
	      $("#report-modal").modal({backdrop: "static"});
	    });
	
	    $("#report-btn").click(function(){
	      $("#confirm-modal").modal({backdrop: "static"});
	    });
	
	  });
	</script>  

</body>
</html>