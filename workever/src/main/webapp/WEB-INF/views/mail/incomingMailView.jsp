<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>받은메일</title>

<jsp:include page="../common/links.jsp" />

<style>
	
    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
    }

    /* 답장/전달/삭제 버튼 영역 */
    .mail-btns-area {
        /* border-bottom:none; */
        padding-top:25px;
        padding-bottom:20px;
    }

    /* 답장/전달 버튼 영역 */
    .mail-btns-area-left{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:50%;
        float: left;
    }

    .mail-btns-area-left button{
        width:75px;
    }  

    /* 삭제 버튼 영역 */
    .mail-btns-area-right{
        /* border:1px solid red; */
        box-sizing: border-box;
        width:50%;
        float: left;
        text-align:right;
    }

    .mail-btns-area-right button{
        border:1px solid #4E73DF;
        background: #4E73DF;
        color: white;
        width:75px;
    }

    .mail-btns-area-right button:hover{
        color: white;
    }  

    /* 내용 제외 입력 정보 영역 */
    #mail-detail{
      box-sizing: border-box;
      width:100%;
      
    }

    #mail-detail thead tr{
      border-bottom:1px solid #DEE2E6;
    }

    #mail-detail thead th{
      padding:20px;
      text-align:center;
    }

    #mail-detail thead td{
      padding:20px;
    }

    /* 보낸사람 및 참조 영역 */
    .sender-area, .cc-area{
      padding:5px;
    }

    .sender-area span, .cc-area span{
      background:#dce6ff;
      margin-right:10px;
      cursor: pointer;
    }

    .sender-area label, .cc-area label{
      box-sizing:border-box;
      margin-bottom:0;
      margin-left:20px;
      margin-right:20px;
      font-size: 13px;
      font-weight:600 !important;
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
		          <h1 id="page-title">받은메일</h1>
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
		
		            <!-- 답장/전달/삭제 버튼 영역 -->
		            <div class="card-header mail-btns-area"> 
		              <div class="col-sm-6 mail-btns-area-left">
		                <button class="btn btn-sm btn-default">답장</button>
		                <button class="btn btn-sm btn-default">전달</button>
		              </div>
		              <div class="col-sm-6 mail-btns-area-right">
		                <button class="btn btn-sm">삭제</button>
		              </div>
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		
		              <table id="mail-detail">
		                <thead>
		                  <tr>
		                    <th style="padding-top:0">받는사람</th>
		                    <td style="padding-top:0">홍길동</td>
		                  </tr>
		                  <tr>
		                    <th>제목</th>
		                    <td>메일제목들어가는자리</td>
		                  </tr>
		                  <tr>
		                    <th>발신일시</th>
		                    <td>2022-00-00 00:00</td>
		                  </tr>
		                  <tr>
		                    <th>보낸사람</th>
		                    <td>
		                      <div class="sender-area">
		                        <span>
		                          <label>김말똥 &lt;workever_f@gmail.com&gt;</label>
		                        </span>
		                      </div>
		                    </td>
		                  </tr>
		                  <tr>
		                    <th> <!-- ▼ 버튼 누르면 토글로 열려야함 -->
		                      참조
		                      <button class="btn btn-sm btn-default">▼</button>
		                    </th>
		                    <td>
		                      <div class="cc-area">
		                        <span>
		                          <label>workever_b@gmail.com</label>
		                        </span>
		                        <span>
		                          <label>김말순 &lt;workever_g@gmail.com&gt;</label>
		                        </span>
		                        <span>
		                          <label>workever_d@gmail.com</label>
		                        </span>
		                      </div>
		                    </td>
		                  </tr>
		                  <tr>
		                    <th>첨부파일</th>
		                    <td>
		                      <a href="#">dddddd.jpg</a>
		                    </td>
		                  </tr>
		                  <tr align="center">
		                    <th colspan="2">내용</th>
		                  </tr>
		                  <tr>
		                </thead>
		                <tbody>
		                	<tr>
		                    <td colspan="2">
		                      <div class="mail-content-area">
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
		
		
		          <!-- 페이징 처리 영역 -->
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