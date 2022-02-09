<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Workever</title>
    
	<jsp:include page="../common/links.jsp" />
    <style>
    div, input, textarea{ box-sizing:border-box;}

    #userWriteList-area{
        /* border:1px solid black; */
        margin:auto;
        width:1300px;
        padding-top:50px;
        padding-bottom:100px;
    }
    
    #search-area button{
    	background:#4E73DF;
    	color:white;
    }
    

</style>
</head>

<body>
    <div class="wrapper">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<br><br>
			<h3>&nbsp;&nbsp;&nbsp;내가 작성한 결재</h3>
			<hr>
			<div id="userWriteList-area">
                <div id="category-btn">
                    <button class="btn a" style="background: #4E73DF; color:white;">전체</button>|
                    <button class="btn c">진행중</button>|
                    <button class="btn c">완료</button>
                </div>
                <br>
                작성한 전자 결재 총 19건
                <br><br>

                
                <!-- 게시판영역 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>결재 종류</th>
                                            <th>제목</th>
                                            <th>기안일</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>183</td>
                                            <td>John Doe</td>
                                            <td>11-7-2014</td>
                                            <td><span class="tag tag-success">Approved</span></td>
                                        </tr>
                                        <tr>
                                            <td>219</td>
                                            <td>Alexander Pierce</td>
                                            <td>11-7-2014</td>
                                            <td><span class="tag tag-warning">Pending</span></td>
                                        </tr>
                                        <tr>
                                            <td>657</td>
                                            <td>Bob Doe</td>
                                            <td>11-7-2014</td>
                                            <td><span class="tag tag-primary">Approved</span></td>
                                        </tr>
                                        <tr>
                                            <td>175</td>
                                            <td>Mike Doe</td>
                                            <td>11-7-2014</td>
                                            <td><span class="tag tag-danger">Denied</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 게시판 영역 끝-->
                
                <br>

                <div id="paging-area" align="center">

                    페이징처리
                </div>
                <br>
                <div id="search-area" align="center">
                    <form action="">
                        <select name="" id="">
                            <option value="">--선택--</option>
                            <option value="">결제 종류</option>
                            <option value="">제목</option>
                            <option value="">내용</option>
                        </select>
                        <input type="text">
                        <button class="btn btn-sm" type="submit">검색</button>
                    </form>
                </div>
                
                

			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
	<jsp:include page="../common/scripts.jsp" />
      <script>
          $(function(){
              $("#category-btn>button").click(function(){
                  $(this).css({backgroundColor:"#4E73DF", color:"white"});
                  $(this).css("font-weight", "700");
                  $(this).siblings().css({backgroundColor:"transparent", color:"black"});
                  $(this).siblings().css("font-weight", "500");
              })
          })
      </script>
</body>
</html>