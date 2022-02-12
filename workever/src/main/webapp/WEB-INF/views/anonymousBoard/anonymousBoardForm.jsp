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
<!-- 
<link rel="stylesheet" href="resources/plugins/summernote/summernote-bs4.min.css">
 -->
<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
  
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
								<textarea id="board-textarea" class="form-control">
								</textarea>
							</div>
							</td>
							</tr>
						</tbody>
						</table>
					</form>  
					</div>
					<!-- /.card-body -->
		
		
					<!-- 취소/등록 버튼 영역 -->
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
		
		<jsp:include page="../common/footer.jsp" />	
	
	</div>
	<!-- ./wrapper -->
	
	<jsp:include page="../common/scripts.jsp" />
	
	<!-- Summernote -->
	<!-- 
	<script src="resources/plugins/summernote/summernote-bs4.min.js"></script>
 	-->
	<script src="resources/plugins/summernote/summernote-lite.js"></script>
 	<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
 	
 	
	<!-- 스크립트 영역 -->  
	<!-- summernote -->

	<script>
	  $(function () {

	    $("#board-textarea").summernote({
			height: 300,                 // 에디터 높이
			lang: "ko-KR"				 // 한글 설정
			toolbar: [
					    // [groupName, [list of button]]
					    ['fontname', ['fontname']],
					    ['fontsize', ['fontsize']],
					    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
					    ['color', ['forecolor','color']],
					    ['table', ['table']],
					    ['para', ['ul', 'ol', 'paragraph']],
					    ['height', ['height']],
					    ['insert',['picture','link','video']],
					    ['view', ['fullscreen', 'help']]
					  ],
					fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
					fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	    });

	  });
	</script>
	
	
	
</body>
</html>