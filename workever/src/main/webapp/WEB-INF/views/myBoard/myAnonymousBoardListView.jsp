<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시글</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../common/links.jsp" />
  
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

    .anonymous-board-btn{
        border:1px solid #4E73DF;
        background: #4E73DF;
        color: white;
    }

    .anonymous-board-btn:hover{
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
		          <h1 id="page-title">나의 익명 게시글</h1>
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
		                  <button type="button" class="btn btn-sm btn-default">부서별</button>
		                  <button type="button" class="btn btn-sm anonymous-board-btn">익명</button>
		                </div>
		              </div>
		              <div class="col-sm-6 board-header-area-right">
		                <!-- 관리자일 경우에만 보임 -->
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
		                    <th width="10%">글번호</th>
		                    <th width="60%">제목</th>
		                    <th width="10%">조회수</th>
		                    <th  width="15%">작성일</th>
		                  </tr>
		                </thead>
		
		                <tbody>
		                  <!-- case 1. 게시글 목록 존재하지 않을 경우 -->
		                  <tr>
		                    <td colspan="5">게시글이 없습니다.</td>
		                  </tr>
		                  <!-- case 2. 게시글 목록 존재할 경우 -->
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>10</td>
		                    <td class="board-title-area">
		                      <div class="board-title-group">
		                        <div class="board-title">
		                          <div class="board-title-setting"> <!-- 게시글 제목 -->
					                                여기는게시글제목들어가는자리입니다
					                                게시글제목이설정한영역범위를넘어서면
		                            ...으로표시되는거보이쥬?????????
		                            800px이상넘어가면그렇게보임
		                          </div>
		                        </div>
		
		                        <div class="reply-count">
		                          <label>[25]</label> <!-- 댓글 개수 -->
		                        </div>
		                      </div>
		                    </td>
		                    <td>203</td>
		                    <td>2022-00-00</td>
		                  </tr>
		
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
		                    <td>9</td>
		                    <td>게시글제목자리</td>
		                    <td>182</td> 
		                    <td>2022-00-00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox"> 
		                    </td>
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