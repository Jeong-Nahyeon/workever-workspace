<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>익명 게시글 작성</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../common/links.jsp" />

<!-- summernote -->
<link rel="stylesheet" href="resources/plugins/summernote/summernote-bs4.min.css">
  
<style>

    /* 페이지 제목 */
    #page-title{
        margin-top:20px;
        margin-bottom:20px;
        font-weight:bolder;
    }

    /* 내용 제외 입력 정보 영역 */
    #board-insert-form{
      box-sizing: border-box;
      width:100%;
      
    }

    #board-insert-form thead th{
      padding-bottom:30px;
      text-align:center;
    }

    #board-insert-form thead td{
      padding-bottom:30px;
    }

  
    /* 첨부파일 영역 */
    #add-file-btn{
      background:#858796;
      color:white;
      width:75px;
    }

    #attach-comment{
      color:gray;
      font-size:13px;
    }

    .attach-preview-area{
      border:1px solid #DEE2E6;
      padding:5px;
      margin-top: 5px;
    }

    .attach-preview-area span{
      margin:10px;
    }

    .attach-preview-area label{
      margin-left:10px;
      margin-right:10px;
      font-size: 15px;
    }

    .attach-preview-area i{
      cursor: pointer;
    }

    /* 취소/등록 버튼 영역 */
    .board-btns-area{
        /* border:1px solid red; */
        text-align:center;
    }

    .board-btns-area button[type=button]{
      border:1px solid #DEE2E6;
      width:75px;
    }  

    .board-btns-area button[type=submit]{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
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
	          <h1 id="page-title">익명 게시글 작성</h1>
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
	            
	            <div class="card-body">
	              <form>
	                <table id="board-insert-form">
	                  <thead>
	                    <tr>
	                      <th>제목</th>
	                      <td>
	                        <input type="text" class="form-control">  
	                      </td>
	                    </tr>
	                    <tr>
	                      <th>첨부파일</th>
	                      <td style="padding:0">
	                        <button id="add-file-btn" class="btn btn-sm">파일추가</button>
	                        <span id="attach-comment">첨부파일은 최대 5개까지만 등록 가능합니다</span>
	                        <input type="file" class="form-control" style="display:none;">
	
	                        <div class="attach-preview-area">
	                          <span>
	                            <label>testimg.jpg</label>
	                            <i class="fas fa-times"></i>
	                          </span>
	                          <span>
	                            <label>testfile.xlsx</label>
	                            <i class="fas fa-times"></i>
	                          </span>
	                        </div>  
	                      </td>
	                    </tr>
	                  </thead>
	                  <tbody>
	                    <tr align="center">
	                      <th colspan="2" style="padding:10px;">내용</th>
	                    </tr>
	                    <tr>
	                      <td colspan="2">
	                        <div class="form-group">
	                          <textarea id="board-textarea" class="form-control" style="height: 300px">
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
	                          </textarea>
	                      </div>
	                      </td>
	                    </tr>
	                </tbody>
	                </table>
	              </form>  
	            </div>
	            <!-- /.card-body -->
	
	
	            <!-- 취소/발송 버튼 영역 -->
	            <div class="card-footer">
	            
	              <div class="board-btns-area">
	                <button type="button" class="btn btn-sm">취소</button>
	                <button type="submit" class="btn btn-sm">등록</button>
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
	
	</div>
	<!-- ./wrapper -->
	
	<jsp:include page="../common/scripts.jsp" />
	
	<!-- Summernote -->
	<script src="resources/plugins/summernote/summernote-bs4.min.js"></script>

	<!-- 스크립트 영역 -->  
	<!-- summernote -->
	<script>
	  $(function () {
	    //Add text editor
	    $("#mail-textarea").summernote();
	  });
	</script>
	
</body>
</html>