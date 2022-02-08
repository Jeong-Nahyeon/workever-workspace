<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../common/links.jsp" />
  
<style>

    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
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
		          <h1 id="page-title">공지사항 게시판</h1>
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
		              <div class="col-sm-3 board-header-area-left">
		                <select class="form-control">
		                  <option>최신순</option>
		                  <option>오래된순</option>
		                </select>
		              </div>
		              <div class="col-sm-6 board-header-area-center" align="center">
		                <select class="form-control">
		                  <option>제목</option>
		                  <option>내용</option>
		                </select>
		                <input type="text" class="form-control">
		                <button class="btn btn-sm">검색</button>
		              </div>
		              <div class="col-sm-3 board-header-area-right">
		                <!-- 관리자일 경우에만 보임 -->
		                <button class="btn btn-sm">글작성</button>
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
		                  <!-- case 1. 게시글 목록 존재하지 않을 경우 -->
		                  <tr>
		                    <td colspan="4">게시글이 없습니다.</td>
		                  </tr>
		                  <!-- case 2. 게시글 목록 존재할 경우 -->
		                  <tr>
		                    <td>10</td>
		                    <td align="center">
		                      <div class="board-title">
		                        여기는게시글제목들어가는자리입니다
		                        게시글제목이설정한영역범위를넘어서면
		                        ...으로표시되는거보이쥬?????????
		                        800px이상넘어가면그렇게보임
		                      </div>
		                    </td>
		                    <td>203</td>
		                    <td>2022-00-00</td>
		                  </tr>
		
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td>
		                    <td>2022-00-00</td>
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
		
		<jsp:include page="../common/footer.jsp" />
	
	</div>
	<!-- ./wrapper -->
	
	<jsp:include page="../common/scripts.jsp" />
	
</body>
</html>