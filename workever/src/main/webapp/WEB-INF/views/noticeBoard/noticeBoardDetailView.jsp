<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 게시글 상세</title>

<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />

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

    .btns-area a{
      border:1px solid #4E73DF;
      background: #4E73DF;
      color: white;
      width:75px;
    }

    .btns-area a:hover{
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
		            
		            <c:if test="${ loginUser.userRank eq '관리자' }">
		              <button class="btn btn-sm btn-default update-btn">수정</button>
		              <button class="btn btn-sm delete-btn">삭제</button>
		            </c:if>  
		            
		            </div>
		            <!-- /.card-header -->
		
		            <div class="card-body">
		
		              <table id="board-detail">
		                <thead>
		                  <tr>
		                    <th style="padding-top:0">제목</th>
		                    <td style="padding-top:0">${ nb.nbTitle }</td>
		                  </tr>
		                  <tr>
		                    <th>작성일</th>
		                    <td>${ nb.nbDate }</td>
		                  </tr>
		                  <tr>
		                    <th>첨부파일</th>
		                    <td>
		                      <c:choose>
			                      <c:when test="${ empty list }">
			                      	  첨부파일이 없습니다.
			                      </c:when>
			                      <c:otherwise>
			                      	  <c:forEach var="cf" items="${ list }">
					                      <a href="${ cf.cfPath }${ cf.cfChangeName }" download="${ cf.cfOriginName }">${ cf.cfOriginName }</a><br>
				                      </c:forEach>
			                      </c:otherwise>
		                      </c:choose>
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
		                      <div class="mail-content-area">${ nb.nbContent }</div>
		                    </td>
		                  </tr>
		               </tbody>
		              </table>
		            </div>
		            <!-- /.card-body -->
		
		
		          <!-- 목록 버튼 영역 -->
		          <div class="card-footer">
		
		            <div class="btns-area">
		              <a class="btn btn-sm" href="list.nbo">목록</a>
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

</body>
</html>