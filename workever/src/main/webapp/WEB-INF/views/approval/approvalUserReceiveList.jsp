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
	
	    #userReceiveList-area{
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
	
		tbody div{
			display:inline-block;
			margin-right:20px;
			
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
			<h3>&nbsp;&nbsp;&nbsp;내가 수신한 결재</h3>
			<hr>
			<div id="userReceiveList-area">
                <div id="category-btn">
                    <div id="category-btn">
	                	<c:choose>
	                		<c:when test="${ empty category }">
			                    <button class="btn a" style="background: #4E73DF; color:white;" onclick="location.href='receiveList.ap'">전체</button>|
			                    <button class="btn c" value="S" onclick="location.href='receiveChangeCategory.ap?category=S'">대기중</button>|
			                    <button class="btn c" value="AR" onclick="location.href='receiveChangeCategory.ap?category=AR'">완료</button>
			                    <br><br>
				              	  수신한 전자 결재 총 ${ pi.listCount }건
				                <br><br>
	                    	</c:when>
	                    	<c:when test="${ category eq 'S'}">
	                    		<button class="btn a" onclick="location.href='receiveList.ap'">전체</button>|
			                    <button class="btn c" value="S" style="background: #4E73DF; color:white;" onclick="location.href='receiveChangeCategory.ap?category=S'">대기중</button>|
			                    <button class="btn c" value="AR" onclick="location.href='receiveChangeCategory.ap?category=AR'">완료</button>
			                    <br><br>
				              	  대기중 전자 결재 총 ${ pi.listCount }건
				                <br><br>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<button class="btn a" onclick="location.href='receiveList.ap'">전체</button>|
			                    <button class="btn c" value="S" onclick="location.href='receiveChangeCategory.ap?category=S'">대기중</button>|
			                    <button class="btn c" value="AR" style="background: #4E73DF; color:white;" onclick="location.href='receiveChangeCategory.ap?category=AR'">완료</button>
			                    <br><br>
				              	  완료된 전자 결재 총 ${ pi.listCount }건
				                <br><br>
	                    	</c:otherwise>
	                    </c:choose>
                	</div>
                </div>

                
                <!-- 게시판영역 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap" id="apvlReceiveList">
                                    <thead>
                                        <tr align="center">
                                            <th>결재 종류</th>
                                            <th>제목</th>
                                            <th>기안자</th>
                                            <th>기안일</th>
                                            <th>상태</th>
                                            <th>진행상황</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:choose>
                                    		<c:when test="${ empty list }">
                                    			<td colspan="6" align="center">리스트가 없습니다.</td>
                                    		</c:when>
                                    		<c:otherwise>
		                                    	<c:forEach var="a" items="${ list }">
			                                        <tr align="center">
			                                        	<input type="hidden" class="apvlNo" value="${ a.apvlNo }">
			                                            <td>${ a.apvlFormNo }</td>
			                                            <td>${ a.apvlTitle }</td>
			                                            <td>${ a.apvlWriterName } ${ a.apvlWriterRank}</td>
			                                            <td>${ a.apvlCreateDate }</td>
			                                            <td>${ a.apvlStatus }</td>
			                                            <td>
			                                            	<c:forEach var="lList" items="${ lineList }" varStatus="st">
			                                            		<c:if test="${ a.apvlNo eq lineList[st.index].apvlNo }">
			                                            			<c:choose>
				                                            			<c:when test="${ lineList[st.index].apvlLineStatus eq 'S' }">
				                                            				
				                                            				<div>
				                                            					<c:choose>
				                                            						<c:when test="${lineList[st.index].apvlLineTurn ne 1}">
				                                            							<c:choose>
				                                            								<c:when test="${ lineList[st.index-1].apvlLineStatus eq 'S' }">
							                                            						<i class="fas fa-ellipsis-h fa-lg"></i><br>
							                                            					</c:when>
							                                            					<c:otherwise>
							                                            						<i class="fas fa-edit fa-lg"></i><br>
							                                            					</c:otherwise>
							                                            				</c:choose>
							                                            			</c:when>
							                                            			<c:otherwise>
							                                            				<i class="fas fa-edit fa-lg"></i><br>
							                                            			</c:otherwise>
							                                            		</c:choose>
							                                            			${ lineList[st.index].userName } ${ lineList[st.index].userRank }
				                                            				</div>
				                                            			</c:when>
				                                            			<c:when test="${ lineList[st.index].apvlLineStatus eq 'A' }">
				                                            				<div>
						                                            			<i class="fas fa-check-circle fa-lg" style="color:green;"></i><br>
						                                            			${ lineList[st.index].userName } ${ lineList[st.index].userRank }
				                                            				</div>
				                                            			</c:when>
				                                            			<c:otherwise>
				                                            				<div>
						                                            			<i class="fas fa-reply fa-lg" style="color:red;"></i><br>
						                                            			${ lineList[st.index].userName }${ lineList[st.index].userRank }
				                                            				</div>
				                                            			</c:otherwise>
			                                            			</c:choose>
			                                            		</c:if>
			                                            	</c:forEach>
			                                            </td>
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
	                    		<li class="page-item"><a class="page-link" href="receiveList.ap?cpage=${ pi.currentPage-1 }"><i class="fas fa-solid fa-angle-left"></i></a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:choose>
								<c:when test="${ empty category }">
									<li class="page-item"><a class="page-link" href="receiveList.ap?cpage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="receiveChangeCategory.ap?cpage=${ p }&category=${ category }">${ p }</a></li>
								</c:otherwise>
							</c:choose>
	                    	
	                    	
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    	</c:when>
	                    	<c:when test="${ pi.endPage eq 0 }">
	                    		<li class="page-item disabled"><a class="page-link" href="#"><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="receiveList.ap.ap?cpage=${ pi.currentPage+1 }"><i class="fas fa-solid fa-angle-right"></i></a></li>
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
                            <option value="">기안자</option>
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
  		  $("#apvlReceiveList>tbody>tr").click(function(){
  			  location.href= "detail.ap?apvlNo=" + $(this).children(".apvlNo").val();
  		  })
  	  })
     	/*
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
		       		  url:"receiveChangeCategory.ap",
		       		  data:{category:$(this).val(),
		       			    loginUser:'${loginUser.userNo}',
		       			    cpage:1
		       		  },success:function(result){
		       			  console.log("성공");
		       			  let value = "";
		       			  let lineValue = "";
		       			  let pagingValue = "";
		       			  if(result.pi.listCount == 0){
		       				  value += "<td colspan='6' align='center'>리스트가 없습니다.</td>"
		       			  }else {
		       				  
			       			  for(let i in result.list) {
						                      console.log(result.list[i].apvlFormNo)   
			       				 
				       				  value += "<tr align='center'>"
						                         +     "<td>" + result.list[i].apvlFormNo + "</td>"
						                         +     "<td>" + result.list[i].apvlTitle + "</td>"
						                         +     "<td>" + result.list[i].apvlWriterName + "&nbsp;" + result.list[i].apvlWriterRank + "</td>"
						                         +     "<td>" + result.list[i].apvlCreateDate + "</td>"
						                         +     "<td>" + result.list[i].apvlStatus + "</td>"
						                         +     "<td>";
						              for(let l in result.lineList) {
						            	  if(result.list[i].apvlNo == result.lineList[l].apvlNo){
		       				  				  
		       				  				  if(result.lineList[l].apvlLineStatus == 'S'){
					       				  		  value += "<div>" 
					                                  	+		"<i class='fas fa-edit fa-lg'></i>"+"<br>"
					                                	+		result.lineList[l].userName + "&nbsp;" + result.lineList[l].userRank
					                        			+	"</div>";	       					  
		       				 				  }else if(result.lineList[l].apvlLineStatus == 'A') {
		       				 					  value += "<div>" 
					                                  	+		"<i class='fas fa-check-circle fa-lg' style='color:green;'></i>"+"<br>"
					                                	+		result.lineList[l].userName + "&nbsp;" + result.lineList[l].userRank
					                        			+	"</div>"; 
		       				 				  }else {
			       				 				  value += "<div>" 
					                                  	+		"<i class='fas fa-reply fa-lg' style='color:red;'></i>"+"<br>"
					                                	+		result.lineList[l].userName + "&nbsp;" + result.lineList[l].userRank
					                        			+	"</div>";
		       				 				  }
		       				  			  }
						              }           
					            	  value += "</td>"
					                         + "</tr>";
						       }
		       			  }
					                         
					   pagingValue += "<ul class='pagination'>";
						                	if(result.pi.currentPage == 1){
					                    		pagingValue += "<li class='page-item disabled'><a class='page-link' href='#'><i class='fas fa-solid fa-angle-left'></i></a></li>";
						                		
						                	}else {
						                		pagingValue += "<li class='page-item'><a class='page-link' href='receiveList.ap?cpage=" + result.pi.currentPage-1 + "'><i class='fas fa-solid fa-angle-left'></i></a></li>";
						                		
						                	}
					                		
						                    for(var i = result.pi.startPage; i<=result.pi.endPage; i++){
						                    	pagingValue += "<li class='page-item'><a class='page-link' href='receiveList.ap?cpage='" + i + "'>" + i + "</a></li>";
						                    	
						                    }
					                    	
					                    	if(result.pi.currentPage == result.pi.maxPage) {
					                    		pagingValue += "<li class='page-item disabled'><a class='page-link' href='#'><i class='fas fa-solid fa-angle-right'></i></a></li>";
					                    	}else if(result.pi.endPage == 0) {
		       									pagingValue += "<li class='page-item disabled'><a class='page-link' href='#'><i class='fas fa-solid fa-angle-right'></i></a></li>";
					                    	}else{
					                    		pagingValue += "<li class='page-item'><a class='page-link' href='receiveList.ap?cpage='" + result.pi.currentPage+1  + "'><i class='fas fa-solid fa-angle-right'></i></a></li>";
					                    	}
					                    
					                    
					                    	
					                    
					                    
					    pagingValue += "</ul>";                    
		       				  	  
		       		
		       			  
			       		  
		      			console.log(value);	  
	       			   $("#userReceiveList-area tbody").html(value);
	       			   $("#paging-area").html(pagingValue);
	      			  
	       			 
	       			
	       		   },error:function(){
	       			  console.log("ajax통신 실패");
	       			  
	       		   }        		  
	       	  })
	       	  
	       	 
	         
	         })
	         $(".a").click(function(){
		       	  $("tbody").html(all);
		       	  $("#paging-area").html(paging);
	       	            	  
	         })
	     })*/
	 </script>
</body>
</html>