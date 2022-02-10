<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
    #paging-area{width:fit-content;margin:auto;}

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
                    <button class="btn c" value="SI">진행중</button>|
                    <button class="btn c" value="CR">완료</button>
                </div>
                <br>
              	  작성한 전자 결재 총 ${ pi.listCount }건
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
	                                    <c:choose>
                                    		<c:when test="${ empty list }">
                                    			<td colspan="4" align="center">리스트가 없습니다.</td>
                                    		</c:when>
                                    		<c:otherwise>
		                                    	<c:forEach var="a" items="${ list }">
			                                        <tr>
			                                            <td>${ a.apvlFormNo }</td>
			                                            <td>${ a.apvlTitle }</td>
			                                            <td>${ a.apvlCreateDate }</td>
			                                            <td>${ a.apvlStatus }</td>
			                                        </tr>
			                                    </c:forEach>
		                                    </c:otherwise>
                                        </c:choose>
                                    	
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 게시판 영역 끝-->
                
                <br>
				<!-- 페이징 영역 -->
                <div id="paging-area">
	                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${ pi.currentPage eq 1 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-solid fa-angle-left"></i></a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="writeList.ap?cpage=${ pi.currentPage-1 }"><i class="fas fa-solid fa-angle-left"></i></a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<li class="page-item"><a class="page-link" href="writeList.ap?cpage=${ p }">${ p }</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    	</c:when>
	                    	<c:when test="${ pi.endPage eq 0 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="writeList.ap.ap?cpage=${ pi.currentPage+1 }"><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                </ul>
	            </div>
                <!-- 페이징 영역 끝 -->
                <br>
                
                <!-- 검색 영역 -->
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
                <!-- 검색 영역 끝 -->
                

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
              
              let all = $("tbody").html();
              let paging = $("#paging-area").html();

              $(".c").click(function(){
            	  console.log($(this).val());
            	  $.ajax({
            		  url:"writeChangeCategory.ap",
            		  data:{category:$(this).val(),
            			    loginUser:'${loginUser.userNo}'
            		  },success:function(list){
            			  console.log("성공");
            			  let value = "";
            			  for(let i in list) {
            				  value += "<tr>"
			                         +     "<td>" + list[i].apvlFormNo + "</td>"
			                         +     "<td>" + list[i].apvlTitle + "</td>"
			                         +     "<td>" + list[i].apvlCreateDate + "</td>"
			                         +     "<td>" + list[i].apvlStatus + "</td>"
			                         + "</tr>"
            			  }
            			  
            			  $("#userWriteList-area tbody").html(value);
            			  $("#paging-area").html("");
            			
            		  },error:function(){
            			  console.log("ajax통신 실패");
            			  
            		  }        		  
            	  })
            	  
            	  $.ajax({
            		  url:"changecategoryPaging.ap",
            		  data:{cpage: 1,
            			    loginUser:'${loginUser.userNo}'            			  
            		  },success:function(pi){
            			  console.log("성공");
            			  let value = "";
            			  
            		  },error:function(){
            			  console.log("ajax통신 실패");
            		  }
            	  })
              })
              
              $(".a").click(function(){
            	  $("tbody").html(all);
            	  $("#paging-area").html(paging);
            	            	  
              })
          })
      </script>
</body>
</html>