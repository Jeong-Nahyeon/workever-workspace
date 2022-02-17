<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Workever</title>
<jsp:include page="../common/links.jsp" />
<style>
	#detailView-area{
		/* border:1px solid black; */
		margin:auto;
		width:1300px;
		padding-top:50px;
		padding-bottom:100px;
	}
	
	#inner-area{
		width:1100px;
		margin:auto;
		padding-top:20px;
	}

	#enroll-tb{
		border-top:1px solid gray;
		border-bottom:1px solid gray;
	}

	th{
		background:rgb(224, 224, 224);
		height:40px;
		text-align:center;
	}

	#approve-btn, #update-btn{
		background: #4E73DF;
		color:white;
	}

	#return-btn, #list-btn, #delete-btn{
		background: rgb(133, 135, 150);
		color:white;
	}

	#form>table{
		margin:auto;
		margin-top:30px;
		margin-bottom:30px;
	}
	
	#apvlContent{
		height:500px;
		padding:30px;
	}
	.lineArea{
		display: inline-block;
	}

	.lineTb{
		width:150px;
		text-align: center;
		font-weight: 700;		
	}
	
	#btn-area, #returnComment{
		width:1020px;
		margin-top:30px;
	}
	
	#btn-area>div{
		width:50%;
		height:60px;
		float: left;
		margin-top:30px;
	}
	
	.modal{
		margin-top:300px;
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
			<c:choose>
				<c:when test="${ loginUser.userNo eq apvl.apvlWriter }">
					<h3>&nbsp;&nbsp;&nbsp;내가 작성한 결재</h3>
				</c:when>
				<c:otherwise>
					<h3>&nbsp;&nbsp;&nbsp;내가 수신한 결재</h3>
				</c:otherwise>
			</c:choose>
			<hr>
			<div id="detailView-area">
			
				<div id="inner-area">
	                <table border>
				        <tr>
				            <td colspan="2" height="200" align="center"><h4>연장 근무 신청서</h4></td>
				            <td colspan="4"  width="700" style="text-align:right;padding-right:10px;">
								<c:forEach var="list" items="${ lineList }">
									<div class="lineArea">

										<table border class="lineTb">
											<tr style="height:40px;">
												<td>${ list.userName }</td>
											</tr>
											<tr style="height:130px;">
												<c:choose>
													<c:when test="${ list.apvlLineStatus eq 'A'}">
														<td>승인</td>
													</c:when>
													<c:when test="${ list.apvlLineStatus eq 'R'}">
														<td>반려</td> 
													</c:when>
													<c:otherwise>
														<td></td>
													</c:otherwise>
												</c:choose>
											</tr>
										</table>
									</div>
								</c:forEach>
				            </td> 
				        </tr>
				        <tr>
				            <th>제목</th>
				            <td colspan="5">
				                &nbsp;&nbsp;&nbsp;${ apvl.apvlTitle }
				            </td>
				        </tr>
				        <tr>
				            <th width="130">소속 부서</th>
				            <td width="170">&nbsp;&nbsp;&nbsp;${ apvl.apvlWriterDeptName }</td>
				            <th width="130">기안자</th>
				            <td width="170">&nbsp;&nbsp;&nbsp;${ apvl.apvlWriterName }</td> 
				            <th width="130">기안일</th>
				            <td width="230">&nbsp;&nbsp;&nbsp;${ apvl.apvlCreateDate }</td>
				        </tr>
				        <tr>
				            <th>업무명</th>
				            <td>&nbsp;&nbsp;&nbsp;${ form.otTitle }</td>
				            <th>연장 근무 일자</th>
				            <td>&nbsp;&nbsp;&nbsp;${ form.otDate }</td>
				            <th>연장 시간</th>
				            <td>&nbsp;&nbsp;&nbsp;${ form.otWorkingHours }시간</td> 
				        </tr>
				        <tr>
				            <th colspan="6" >사유</th>
				        </tr>
				        <tr>
				        	<td colspan="6">
					            <div id="apvlContent">
				                	${ form.otContent }
				                </div>
				        	</td>
				        </tr>
				    </table>
					<div id="btn-area">
						<c:choose>
							<c:when test="${ loginUser.userNo eq apvl.apvlWriter }"> <%-- 내가 작성한 결재 일때 --%>
								<c:choose>
									<c:when test="${ apvl.apvlStatus eq 'S'}">  <%-- 작성한 결재 아무도 처리 안했을 때 삭제,수정 가능 --%>
										<div>
											<button id="list-btn" class="btn btn-lg" onclick="location.href='writeList.ap'">목록</button>
										</div>
										<div align="right">
											<button id="delete-btn" class="btn btn-lg" data-toggle="modal" data-target="#deleteModal">삭제</button>
											<button id="update-btn" class="btn btn-lg" onclick="location.href='update.ap?apvlNo=${ apvl.apvlNo }'">수정</button>
										</div>
									</c:when>
									<c:when test="${ apvl.apvlStatus eq 'R' }">  <%-- 작성한 결재가 반려 처리 됐을 때, 반려 코멘트와, 목록 --%>
										<table id="returnComment">
											<tr>
												<th width="30%">이름</th>
												<th width="70%">반려 코멘트</th>
											</tr>
											<c:forEach var="list" items="${ lineList }">
												<c:if test="${ list.apvlLineStatus eq 'R' }">
													<tr align="center" height="50px" style="background:white;font-weight:700;">
														<td>${ list.userName }</td>
														<td>${ list.apvlReturnComment }</td>
													</tr>
												</c:if>
											</c:forEach>
										</table>
										<div>
											
										</div>
										<div align="right">
											<button id="list-btn" class="btn btn-lg" onclick="location.href='writeList.ap'">목록</button>
										</div>
									</c:when>
									<c:otherwise>	<%-- 작성한 결재가 진행중 또는 승인 처리 됐을 떄, 목록버튼만 --%>
										<div>
											
										</div>
										<div align="right">
											<button id="list-btn" class="btn btn-lg" onclick="location.href='writeList.ap'">목록</button>
										</div>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>     <%-- 내가 수신한 결재일때 (반려 버튼은 무조건 결재상태를 반려로 바꿈) --%>
								<c:forEach var="list" items="${ lineList }" varStatus="st">	<%-- lineList 반복문 돌려서 로그인유저 기준 상황으로 버튼 처리 --%>
										<c:if test="${ loginUser.userNo eq lineList[st.index].userNo }">	<%-- 로그인유저와 결재선번호가 같을 때 --%>
											<c:choose>
												<c:when test="${ lineList[st.index].apvlLineStatus eq 'S' }"> <!-- 내가 수신한 결재 아직 처리하기 전일 때 -->
													<c:choose>
														<c:when test="${ lineList[st.index].apvlLineTurn eq 1 }">	<%-- 내 결재 순서가 1이고 --%>
															<c:choose>
																<c:when test="${ lineList[st.index].apvlLineTurn eq fn:length(lineList) }">	<%-- 1이 마지막순번일 때 결재라인상태와 결재상태 둘다 변경 --%>
																	<div>
																		<button type="reset" id="list-btn" class="btn btn-lg" onclick="location.href='receiveList.ap'">목록</button>
																	</div>
																	<div align="right">
																		<button id="return-btn" class="btn btn-lg" data-toggle="modal" data-target="#returnModal">반려</button>
																		<button id="approve-btn" class="btn btn-lg" data-toggle="modal" data-target="#lastApproveModal">승인</button>
																	</div>
																</c:when>
																<c:otherwise>	<%-- 1이 마지막 순번이 아닐 때 결재라인 상태만 변경 --%>
																	<div>
																		<button type="reset" id="list-btn" class="btn btn-lg" onclick="location.href='receiveList.ap'">목록</button>
																	</div>
																	<div align="right">
																		<button id="return-btn" class="btn btn-lg" data-toggle="modal" data-target="#returnModal">반려</button>
																		<button id="approve-btn" class="btn btn-lg" data-toggle="modal" data-target="#approveModal">승인</button>
																	</div>
																</c:otherwise>	
															</c:choose>
														</c:when>
														<c:otherwise>	<%-- 내 결재 순서가 1이 아닐 때 --%>
															<c:choose>
																<c:when test="${ lineList[st.index-1].apvlLineStatus eq 'S' }">	<%-- 직전 결재 순번의 결재라인상태가 대기일 때 반려, 승인 버튼 비활성화 --%>
																	<div>
																		<button type="reset" id="list-btn" class="btn btn-lg" onclick="location.href='receiveList.ap'">목록</button>
																	</div>
																	<div align="right">
																		<button id="return-btn" class="btn btn-lg" disabled>반려</button>
																		<button id="approve-btn" class="btn btn-lg" disabled>승인</button>
																	</div>
																</c:when>
																<c:otherwise>	<%-- 직전 결재 순번의 결재라인상태가 승인이고 --%>
																	<c:choose>
																		<c:when test="${ lineList[st.index].apvlLineTurn eq fn:length(lineList) }"> <%-- 내 결재 순번이 마지막일때 결재라인상태와 결재 상테 둘 다 번경 --%>
																			<div>
																				<button type="reset" id="list-btn" class="btn btn-lg" onclick="location.href='receiveList.ap'">목록</button>
																			</div>
																			<div align="right">
																				<button id="return-btn" class="btn btn-lg" data-toggle="modal" data-target="#returnModal">반려</button>
																				<button id="approve-btn" class="btn btn-lg" data-toggle="modal" data-target="#lastApproveModal">승인</button>
																			</div>
																		</c:when>
																		<c:otherwise>	<%-- 내 결재 순번이 마지막이 아닐 때 결재라인상태만 변경 --%>
																			<div>
																				<button type="reset" id="list-btn" class="btn btn-lg" onclick="location.href='receiveList.ap'">목록</button>
																			</div>
																			<div align="right">
																				<button id="return-btn" class="btn btn-lg" data-toggle="modal" data-target="#returnModal">반려</button>
																				<button id="approve-btn" class="btn btn-lg" data-toggle="modal" data-target="#approveModal">승인</button>
																			</div>
																		</c:otherwise>
																	</c:choose>
																</c:otherwise>
															</c:choose>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>	<!-- 이미 처리한 결재일때 -->
													<c:if test="${ list.apvlLineStatus eq 'R' }">
														<c:forEach var="list" items="${ lineList }">
															<table id="returnComment">
																<tr>
																	<th width="30%">이름</th>
																	<th width="70%">반려 코멘트</th>
																</tr>
																	<tr align="center" height="50px" style="background:white;font-weight:700;">
																		<td>${ list.userName }</td>
																		<td>${ list.apvlReturnComment }</td>
																	</tr>
															</table>
														</c:forEach>
													</c:if>
													<div>
											
													</div>
													<div align="right">
														<button id="list-btn" class="btn btn-lg" onclick="location.href='receiveList.ap'">목록</button>
													</div>
												</c:otherwise>
											</c:choose>
										</c:if>
								
								</c:forEach>
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
			</div>
		</div>
		
		<!-- delete 모달 -->
		<div class="modal fade" id="deleteModal">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" align="center">
              <p>삭제하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="location.href='delete.ap?apvlNo=${ apvl.apvlNo }'">확인</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>

      
      <!-- approve 모달 -->
      <div class="modal fade" id="approveModal">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" align="center">
              <p>승인하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="location.href='approve.ap?apvlNo=${ apvl.apvlNo }'">확인</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
  
      
      <!-- lastApprove 모달 -->
      <div class="modal fade" id="lastApproveModal">
        <div class="modal-dialog modal-sm">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body" align="center">
              <p>승인하시겠습니까?</p>
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
              <button type="button" class="btn btn-primary" onclick="location.href='lastApprove.ap?apvlNo=${ apvl.apvlNo }'">확인</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>

      
		<!-- return 모달 -->
		<div class="modal fade" id="returnModal">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title"></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form action="return.ap?apvlNo=${ apvl.apvlNo }" method="post">
	            <div class="modal-body" align="center">
	              <p>반려하시겠습니까?</p>
	              <p>반려 코멘트 : <input type="text" name="apvlReturnComment" size="30"></p>
	            </div>
	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	              <button type="submit" class="btn btn-primary" >확인</button>
	            </div>
            </form>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
		<jsp:include page="../common/footer.jsp" />
	</div>
	<jsp:include page="../common/scripts.jsp" />

</body>
</html>
