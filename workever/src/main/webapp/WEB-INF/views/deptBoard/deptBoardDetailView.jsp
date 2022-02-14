<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부서별 게시글 상세</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

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
    .board-content-area{
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
				<h1 id="page-title">${ deptName } 게시글 상세</h1>
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
					<button type="button" class="btn btn-sm btn-default update-btn" onclick="location.href='';">수정</button>
					<button type="button" class="btn btn-sm btn-default delete-btn" onclick="location.href='';">삭제</button>
					<!-- 공통 -->
					<button type="button" class="btn btn-sm list-btn" onclick="location.href='list.dbo';">목록</button>
					</div>
					<!-- /.card-header -->

					<div class="card-body">

						<table id="board-detail">
							<thead>
							<tr>
								<th style="padding:0px 20px 20px 20px">제목</th>
								<td style="padding-top:0">${ db.dbTitle }</td>
								<th style="padding:0px 20px 20px 20px">카테고리</th>
								<td style="padding-top:0">
									<c:if test="${ not empty db.dbCategory }">
										공지
									</c:if>
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${ db.userRank } ${ db.userName }</td>
								<th>작성일</th>
								<td>${ db.dbDate }</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<c:choose>
										<c:when test="${ empty list }">
											첨부파일이 없습니다.
										</c:when>
										<c:otherwise>
											<c:forEach var="cf" items="${ list }">
												<a href="${ cf.cfPath }${ cf.cfOriginName }" download="${ cf.cfChangeName }" >${ cf.cfChangeName }</a><br>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr align="center">
								<th colspan="4">내용</th>
							</tr>
							<tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4">
										<div class="board-content-area">${ db.dbContent }</div>
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
								<textarea id="reply-insert-content" name="crContent"></textarea>
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



</body>
</html>