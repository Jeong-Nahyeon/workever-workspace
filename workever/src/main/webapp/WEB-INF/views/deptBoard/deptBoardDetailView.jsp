<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부서별 게시글 상세</title>

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
				<h1 id="page-title">OO부 게시글 상세</h1>
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
					<!-- 본인 게시글일 경우 -->
					<button class="btn btn-sm btn-default update-btn">수정</button>
					<button class="btn btn-sm btn-default delete-btn">삭제</button>
					<!-- 공통 -->
					<button class="btn btn-sm list-btn">목록</button>
					</div>
					<!-- /.card-header -->

					<div class="card-body">

					<table id="board-detail">
						<thead>
						<tr>
							<th style="padding-top:0">제목</th>
							<td style="padding-top:0">제목들어가는자리</td>
							<th>카테고리</th>
							<td>공지</td>
						</tr>
							<th>작성자</th>
							<td>홍길동</td>
							<th>작성일</th>
							<td>2022-00-00</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">
							<a href="#">dddddd.jpg</a><br>
							<a href="#">bbbbbb.png</a>
							</td>
						</tr>
						<tr align="center">
							<th colspan="4">내용</th>
						</tr>
						<tr>
						</thead>
						<tbody>
							<td colspan="4">
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
					<tr>
						<td class="reply-list-img" rowspan="2">
						<!-- case 1. 프로필 이미지 있을 경우 -->
						<img class="img-circle img-bordered-sm reply-img">
						<!-- case 2. 프로필 이미지 없을 경우 -->
						<!-- <i class="fas fa-user-circle fa-3x reply-no-img"></i> -->
						</td>
						<td class="reply-list-name">
						<b>김말똥</b>
						</td>
						<td class="reply-list-btns">
						<!-- 본인 댓글일 경우 -->
						<a>수정</a>
						<a>삭제</a>
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
						<td class="reply-list-img" rowspan="2">
						<i class="fas fa-user-circle fa-3x reply-no-img"></i>
						</td>
						<td class="reply-list-name">
						<b>김말순</b>
						</td>
						<td class="reply-list-btns">
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

	<jsp:include page="../common/scripts.jsp" />

</body>
</html>