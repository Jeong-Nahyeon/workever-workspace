<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 게시글 상세</title>

<jsp:include page="../common/links.jsp" />

<style>

    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
    }

    /* 수정/삭제 버튼 영역 */
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
        border:1px solid #858796;
        background: #858796;
        color: white;
        width:75px;
    }

    .board-btns-area .delete-btn:hover{
        color: white;
    }  

    /* 내용 제외 입력 정보 영역 */
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
		          <h1 id="page-title">공지사항 게시글 상세</h1>
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
		            <!-- 관리자일 경우에만 보임 -->
		            <div class="card-header board-btns-area"> 
		              <button class="btn btn-sm btn-default update-btn">수정</button>
		              <button class="btn btn-sm delete-btn">삭제</button>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		
		              <table id="board-detail">
		                <thead>
		                  <tr>
		                    <th style="padding-top:0">제목</th>
		                    <td style="padding-top:0">제목들어가는자리</td>
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
		
		
		          <!-- 목록 버튼 영역 -->
		          <div class="card-footer">
		
		            <div class="btns-area">
		              <button class="btn btn-sm">목록</button>
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