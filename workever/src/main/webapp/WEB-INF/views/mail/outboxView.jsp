<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보낸메일함</title>

<jsp:include page="../common/links.jsp" />

<style>
	
    /* 페이지 제목 */
    #page-title{
      margin-top:20px;
      margin-bottom:20px;
      font-weight:bolder;
    }

    /* 삭제 버튼 영역 */
    .mail-btns-area {
      /* border:1px solid red; */
      border-bottom:none;
      padding-top:25px;
      padding-bottom:0;
      text-align:right;
    }

    .mail-btns-area button{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
    }

    .mail-btns-area-right button:hover{
      color: white;
    }  

    /* 메일 목록 테이블 영역 */
    #mail-list{
      border-top:2px solid #DEE2E6;
      border-bottom:2px solid #DEE2E6;
      text-align:center;
      margin-bottom:20px;
    }
    
    /* 메일 목록 테이블 제목 영역 : 설정한 영역 범위 넘어가면 ...으로 표시  */
    #mail-list .mail-title{
    /* border:1px solid red; */
    width:700px;
    height:26px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    
    cursor:pointer;
    }

    /* 페이징 처리 영역 */
    .paging-area{
      /* border:1px solid red; */
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
		          <h1 id="page-title">보낸메일함</h1>
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
		              <button class="btn btn-sm">삭제</button>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		              <table id="mail-list" class="table table-hover">
		
		                <thead>
		                  <tr>
		                    <th width="5%">
		                      <input type="checkbox">
		                    </th>
		                    <th width="5%">읽음</th>
		                    <th width="20%">보낸사람</th>
		                    <th width="50%">제목</th>
		                    <th width="5%">첨부</th>
		                    <th  width="15%">발신일시</th>
		                  </tr>
		                </thead>
		
		                <tbody>
		                  <!-- case 1. 보낸 메일 목록 존재하지 않을 경우 -->
		                  <tr>
		                    <td colspan="6">보낸 메일이 없습니다.</td>
		                  </tr>
		                  <!-- case 2. 보낸 메일 목록 존재할 경우 -->
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <!-- case 1. 안읽음-->
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td align="center">
		                      <div class="mail-title">
		                        여기는메일제목들어가는자리입니다
		                        메일제목이설정한영역범위를넘어서면
		                        ...으로표시되는거보이쥬
		                      </div>
		                    </td>
		                    <td>
		                      <!-- case1. 첨부파일 있을 경우 -->
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <td>
		                      <input type="checkbox">  
		                    </td>
		                    <td>
		                      <i class="fas fa-envelope"></i>
		                    </td>
		                    <td>발신자명</td>
		                    <td>메일제목들어가는자리입니다</td>
		                    <td>
		                      <i class="fas fa-paperclip"></i>
		                    </td>
		                    <td>2022-00-00 00:00</td>
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