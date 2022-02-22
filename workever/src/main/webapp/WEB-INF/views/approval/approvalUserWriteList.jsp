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

	tbody div{
			display:inline-block;
			margin-right:20px;
			
	}
		
	.searchResult{
		font-weight:500;
		font-size:20px;
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
                	<c:choose>
                		<c:when test="${ empty category }">
		                    <button class="btn a" style="background: #4E73DF; color:white;" onclick="location.href='writeList.ap'">전체</button>|
		                    <button class="btn c" value="SI" onclick="location.href='writeChangeCategory.ap?category=SI'">진행중</button>|
		                    <button class="btn c" value="CR" onclick="location.href='writeChangeCategory.ap?category=CR'">완료</button>
		                    <br><br>
			              	  작성한 전자 결재 총 ${ pi.listCount }건
			                <br><br>
                    	</c:when>
                    	<c:when test="${ category eq 'SI'}">
                    		<button class="btn a" onclick="location.href='writeList.ap'">전체</button>|
		                    <button class="btn c" value="SI" style="background: #4E73DF; color:white;" onclick="location.href='writeChangeCategory.ap?category=SI'">진행중</button>|
		                    <button class="btn c" value="CR" onclick="location.href='writeChangeCategory.ap?category=CR'">완료</button>
		                    <br><br>
			              	  진행중 전자 결재 총 ${ pi.listCount }건
			                <br><br>
                    	</c:when>
                    	<c:when test="${ category eq 'CR' }">
                    		<button class="btn a" onclick="location.href='writeList.ap'">전체</button>|
		                    <button class="btn c" value="SI" onclick="location.href='writeChangeCategory.ap?category=SI'">진행중</button>|
		                    <button class="btn c" value="CR" style="background: #4E73DF; color:white;" onclick="location.href='writeChangeCategory.ap?category=CR'">완료</button>
		                    <br><br>
			              	  완료된 전자 결재 총 ${ pi.listCount }건
			                <br><br>
                    	</c:when>
                    	<c:when test="${ category eq 'title' }">
                    		<button class="btn a" style="background: #4E73DF; color:white;" onclick="location.href='writeList.ap'">전체보기</button><br><br>
                    		<p class="searchResult">제목으로 "${ keyword }" 검색 결과<p>
                    		<br>
                    	</c:when>
                    	<c:otherwise>
                    		<button class="btn a" style="background: #4E73DF; color:white;" onclick="location.href='writeList.ap'">전체보기</button><br><br>
                    		<p class="searchResult">결재 종류로 "${ keyword }" 검색 결과<p>
                    		<br>
                    	</c:otherwise>
                    </c:choose>
                </div>
                

                
                <!-- 게시판영역 -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover text-nowrap" id="apvlWriteList">
                                    <thead>
                                        <tr align="center">
                                            <th>결재 종류</th>
                                            <th>제목</th>
                                            <th>기안일</th>
                                            <th>상태</th>
                                            <th>진행 상황</th>
                                        </tr>
                                    </thead>
                                    <tbody>
	                                    <c:choose>
                                    		<c:when test="${ empty list }">
                                    			<td colspan="5" align="center">리스트가 없습니다.</td>
                                    		</c:when>
                                    		<c:otherwise>
		                                    	<c:forEach var="a" items="${ list }">
			                                        <tr align="center">
			                                        	<input type="hidden" class="apvlNo" value="${ a.apvlNo }">
			                                            <td>${ a.apvlFormNo }</td>
			                                            <td>${ a.apvlTitle }</td>
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
							                                            					<c:when test="${ lineList[st.index-1].apvlLineStatus eq 'R' }">
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
	                    		<c:choose>
	                    			<c:when test="${ empty category }">
	                    				<li class="page-item"><a class="page-link" href="writeList.ap?cpage=${ pi.currentPage-1 }"><i class="fas fa-solid fa-angle-left"></i></a></li>
	                    			</c:when>
	                    			<c:otherwise>
	                    				<c:choose>
	                    					<c:when test="${ empty keyword }">
	                    						<li class="page-item"><a class="page-link" href="writeChangeCategory.ap?cpage=${ pi.currentPage-1 }&category=${ category }"><i class="fas fa-solid fa-angle-left"></i></a></li>
	                    					</c:when>
	                    					<c:otherwise>
	                    						<li class="page-item"><a class="page-link" href="writerSearch.ap?cpage=${ pi.currentPage-1 }&category=${ category }&keyword=${ keyword }""><i class="fas fa-solid fa-angle-left"></i></a></li>
	                    					</c:otherwise>
	                    				</c:choose>
	                    			</c:otherwise>
	                    		</c:choose>
	                    		
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                    	<c:choose>
								<c:when test="${ empty category }">
									<li class="page-item"><a class="page-link" href="writeList.ap?cpage=${ p }">${ p }</a></li>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${ empty keyword }">
											<li class="page-item"><a class="page-link" href="writeChangeCategory.ap?cpage=${ p }&category=${ category }">${ p }</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="writerSearch.ap?cpage=${ p }&category=${ category }&keyword=${ keyword }">${ p }</a></li>
										</c:otherwise>
									</c:choose>
									
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
	                    		<c:choose>
	                    			<c:when test="${ empty category }">
	                    				<li class="page-item"><a class="page-link" href="writeList.ap?cpage=${ pi.currentPage+1 }"><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    			</c:when>
	                    			<c:otherwise>
	                    				<c:choose>
	                    					<c:when test="${ empty keyword }">
	                    						<li class="page-item"><a class="page-link" href="writeChangeCategory.ap?cpage=${ pi.currentPage+1 }&category=${ category }"><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    					</c:when>
	                    					<c:otherwise>
	                    						<li class="page-item"><a class="page-link" href="writerSearch.ap?cpage=${ pi.currentPage+1 }&category=${ category }&keyword=${ keyword }""><i class="fas fa-solid fa-angle-right"></i></a></li>
	                    					</c:otherwise>
	                    				</c:choose>
	                    			</c:otherwise>
	                    		</c:choose>
	                    	</c:otherwise>
	                    </c:choose>
	                </ul>
	            </div>
                <!-- 페이징 영역 끝 -->
                <br>
                
                <!-- 검색 영역 -->
                <div id="search-area" align="center">
                    <form action="writerSearch.ap">
                        <select name="category" required>
                            <option value="">--선택--</option>
                            <option value="kind">결재 종류</option>
                            <option value="title">제목</option>
                        </select>
                        <input type="text" name="keyword" required>
                        <input type="hidden" name="cpage" value="1">
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
   		  $("#apvlWriteList>tbody>tr").click(function(){
   			  location.href= "detail.ap?apvlNo=" + $(this).children(".apvlNo").val();
   		  })
   	  })
            
            

        
    </script>
</body>
</html>