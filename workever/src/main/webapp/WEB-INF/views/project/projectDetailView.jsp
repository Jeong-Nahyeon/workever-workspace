<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert title here</title>
    
	<jsp:include page="../common/links.jsp" />
	<!-- 그래프 공간 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>

	
	<!-- datepicker 공간 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
    <style>
    	input[type="radio"]{
		display: none;
	}
    	label{
		position: relative;
		font-size: 15px;
		border: 2px ;
		border-radius: 3px;
		padding: 5px 32px ;
		align-items: center;
		cursor: pointer;
		background-color: rgb(216, 216, 216);
	}
	.workTitle{
		border:none;
		height:50px;
		width: 600px;
	}
	
		label:before{
		content: "";
		height: 30px;
		width: 30px;

	}
		input[type="radio"]:checked + label{
		background-color: rgb(78, 115, 223) !important;
		color: white !important;
	}


	.all div{
		margin-left: 40px;
	}

	.backpage p, .workLookup p{
		margin-top:5%;
	}
	
	.backpage, .workLookup{
		background-color: white;
		width: 350px;
		height: 55px;
		cursor: pointer;
		text-align: center;
		border: 1px solid rgb(255, 255, 255);
		font-size: 15px;
		font-weight: bold;
		left: 58%;
 
	}

	.invite{
			width:350px; height:500px;
			background-color: white;
			left: 58%; 
			top: -730px;

	}
	
	.memwrap{
			overflow:auto; 
			height:400px;
			margin-left:30px;
	}
	
	.container{
			position: relative; 
			left:25px;
	}


	.sidemenu{
		width:25%;
	}
	
	.all, .sidemenu{
		float:left;
		margin:30px;
		
	}
	
	.all{
		width: 50%;
		margin-left: 5%;
		/*border:1px solid black;*/
		overflow:scroll;
		height:850px;
	}
	
	.all::-webkit-scrollbar { display: none; }

	.contentWrap{
		/*border:1px solid red;*/
		width: 90%;
		background-color:white;
		margin-left:50px;
	}
	
	   .modal-content{
	   	   margin-top:35%;
	       height:500px;
	       width: 700px;
	   }
		.modal-title{
			margin-left:159px;
		}
		.memList{
			border:1px solid gray;
			overflow:auto;
			height:225px;
		}
		.form-control{
			width: 250px !important;
		}
		.input-group{
			margin-left:75px !important;
		}
		.workContent{
			resize:none;
			width: 430px;
			height:130px;
		}
		
		.EnrollBtn{
			background-color: rgb(78, 115, 223);
			color: white;
			border: none;
			border-radius: 5px;
			height:35px;
			width: 100px;
			font-weight: bolder;
			font-size: 14px;
			margin-left:80%;
		}
		
		.slidecontainer {
			left:40px;
			position: relative; 
            width:30%;

        }

        .slider {
            -webkit-appearance: none;
            width: 100%;
            height: 5px;
            border-radius: 5px;
            background: #d3d3d3;
            outline: none;
            opacity: 0.7;
            -webkit-transition: .2s;
            transition: opacity .2s;
        }

        .slider:hover {
            opacity: 1;
        }

        .slider::-webkit-slider-thumb {
            -webkit-appearance: none;
            appearance: none;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: #ff3b3b;
            cursor: pointer;
        }

        .slider::-moz-range-thumb {
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: #ff3b3b;
            cursor: pointer;
        }
	
    </style>
    
    
</head>

<body class="hold-transition sidebar-mini">
	
		<jsp:include page="../common/header.jsp" />
		
		<jsp:include page="../common/sidebar.jsp" />
		
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		
				<div class="all"><!--전체감싸는 div-->
					<div class="contentWrap">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<canvas id="myChart"></canvas>
							</div>
						</div>
					</div>
					<script>
						let myChart= document.getElementById('myChart').getContext('2d');
			
						let barChart = new Chart(myChart,{
							type:'pie',
							data:{
								labels:['진행','완료','보류'],
								datasets :[{
									labels: '바울랩매출액',
									data:[50,20,12],
									backgroundColor:[
										'rgb(95, 201, 95)',//초록색
										'rgb(101, 180, 233)',//파란색
										'rgb(247, 202, 54)'//노란색
									]
								}]
							}
						})
					</script>
					<br>
					
					<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@여기부터 작성란@@@@@@@@@@@@@@@@@@@@@@@ -->
					<form id="enrollForm" method="post" action="insert.work" enctype="multipart/form-data">
						<!--제목 결정-->
						
						<input type="hidden" name="workBoardWriter" value="${loginUser.userName}">
						<input type="hidden" name="userNo" value="${loginUser.userNo}">
						<input type="hidden" name="proNo" value= ${ proNo }>
						<br>
						<div>
							<input type="text" class="workTitle" name="workTitle" id="workTitle" placeholder="업무명을 입력하세요.(50자 이내)" autocomplete='off' required>
						</div>
						<hr>
						<!--진행 완료 보류 결정공간-->
						<div>
				
							<i class="fab fa-firefox fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" id="progress"  name="workStatus" value="진행">
							<label  for="progress">진행</label>
							
							<input type="radio" id="complete"  name="workStatus" value="완료">			
							<label for="complete">완료</label>
							
							<input type="radio" id="hold"  name="workStatus" value="보류">			
							<label for="hold">보류</label>
						
						</div>
				
						<hr>
				
						<!--담당자 결정공간-->
						<div>
							<i class="fas fa-user fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<select name="workManager" class="manager" style="width: 120px; height: 30px;"> 
									<c:forTokens var="n" items="${ list2.get(0).proUserName}" delims=",">
										<option value="${ n }">${ n }</option>
									</c:forTokens>
								</select>
						</div>
						
						<hr>
				
						<!--시작날짜 공간-->
						<div>
							<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" id="datepicker" name="workStartDate" placeholder="시작일시" autocomplete='off'>	
					
						</div>
						<br>
						<!--마감날짜 공간-->
						<div>
							<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="text" id="datepicker2" name="workEndDate" placeholder="마감일시" autocomplete='off'>
							
					    <script>
					        // 1) datepicker 공통 옵션 설정
					        $.datepicker.setDefaults({
					            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
					            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
					            monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
					            monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					            yearSuffix: '년',
					            dateFormat: 'yy-mm-dd',
					            showMonthAfterYear:true,
					            constrainInput: true    
					        });
					
					        // 2) datepicker 영역 선언
					        $("#datepicker").datepicker();
					        $("#datepicker2").datepicker();
					
					        // 3) 초기값 설정
					        // (today / -nD: n일전 / +nD: n일후 / -nM: n달전 / +nM: n달후 / -nY: n년전 / +nY: n년후)
					        //$("#datepicker").datepicker('setDate', 'today');
					        //$("#datepicker2").datepicker('setDate', '+1D');
					
					    </script>						
						</div>
						<hr>
				
						<!--업무 진행도-->
						<div class="slidecontainer">
						  <input type="range" name="workProgress" min="1" max="100" value="1" class="slider" id="myRange">
						  <p>진행도: <span id="value"></span></p>
						</div>
						
						<script>
						    var slider = document.getElementById("myRange");
						    var output = document.getElementById("value");
						    output.innerHTML = slider.value;
						
						    slider.oninput = function() {
						        output.innerHTML = this.value;
						    }
						</script>
				
						<hr>
				
						<!--업무 순위-->
						<div>
							<i class="fas fa-list-ol fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;
							<select name="workPriority" class="workrank" style="width: 120px; height: 30px;"> 
								<option value="높음">높음</option>
								<option value="중간" selected>중간</option>
								<option value="낮음">낮음</option>
							</select>
						</div>
						
						<hr>
						
						<!--업무 내용-->
						<div>
							<textarea name="workContent" class="workContent" required></textarea>
						</div>
						
						<hr>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="file" id="upfile" name="upfile">
						
						<button class="EnrollBtn" onclick="">등록하기</button>
					</form>
					<br>
				</div>
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@여기까지 작성란@@@@@@@@@@@@@@@@@@@@@@@ -->
				
				<br><br>
				<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%여기부터 밑에 보여지는 게시글 목록%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
				<c:if test="${ not empty list }">
					<c:forEach var="w" items="${ list }">
						<input type="hidden" class="workBoardNo${w.workBoardNo}" value="${w.workBoardNo }">
						<div style="background-color: white;" class="allBoard">
							<br>
							<div style="margin-right:30px">
								<i class="fas fa-user-circle fa-lg"></i>
								<b>${w.workBoardWriter}</b><br>&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="font-size:12px;">${w.workCreateDate }</span>
							</div>
							<br>
							
							<div>
								<input type="text" class="workTitle" name="workTitle" id="workTitle" value="${w.workTitle }">
							</div>
							<hr>
							<!--진행 완료 보류 결정공간-->
							<div class="workBoardNo${w.workBoardNo}">
								<i class="fab fa-firefox fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" id="progress"  name="type" value="진행">
								<label  for="progress">진행</label>
								
								<input type="radio" id="complete"  name="type" value="완료">			
								<label for="complete">완료</label>
								
								<input type="radio" id="hold"  name="type" value="보류">			
								<label for="hold">보류</label>
							</div>
							
							
							<script>
							
							$(".workBoardNo${w.workBoardNo} :radio[name='type']").each(function() {
						        if($(this).val() == '${w.workStatus}') {
						              $(this).attr('checked', true);
						              $(this).next().css({"backgroundColor": "rgb(78, 115, 223)", "color":"white"});
						        }
							});
							
							</script>
					
							<hr>
					
							<!--담당자 결정공간-->
							<div class="workBoardNo1${w.workBoardNo}">
								<i class="fas fa-user fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<select name="manager" class="manager" style="width: 120px; height: 30px;"> 
									<c:forTokens var="n" items="${ list2.get(0).proUserName}" delims=",">
										<option value="${ n }">${ n }</option>
									</c:forTokens>
								</select>
							</div>
							
							<script>
							$(".workBoardNo1${w.workBoardNo} .manager option").each(function() {
						        if($(this).val() == '${w.workManager}') {
						              $(this).attr('selected', true);
						        }
							});
							</script>
							<hr>
					
							<!--시작날짜 공간-->
							<div>
								<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="datepicker" name="workStartDate" value="${ w.workStartDate }">	
							</div>
							<br>
							<!--마감날짜 공간-->
							<div>
								<i class="far fa-calendar-alt fa-lg"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="text" id="datepicker2" name="workEndDate" value="${ w.workEndDate }">
							</div>
							
							<hr>
					
							<!--업무 진행도-->
							<div class="slidecontainer">
						 		<input type="range" name="workProgress" min="1" max="100" value="${ w.workProgress }" class="slider" id="myRange">
						  		<p>진행도: ${ w.workProgress }<span id="value"></span></p>
						  		
							</div>
	
					
							<hr>
					
							<!--업무 순위-->
							<div class="workBoardNo2${w.workBoardNo}">
								<i class="fas fa-list-ol fa-lg"></i>&nbsp;&nbsp;&nbsp;
								<select name="workPriority" class="workrank" style="width: 120px; height: 30px;"> 
									<option value="높음">높음</option>
									<option value="중간">중간</option>
									<option value="낮음">낮음</option>
								</select>
							</div>
							
							<script>
								$(".workBoardNo2${w.workBoardNo} .workrank option").each(function() {
							        if($(this).val() == '${w.workPriority}') {
							              $(this).attr('selected', true);
							        }
								});
							</script>
							
							<hr>
							
							<!--업무 내용-->
							<div>
								<textarea name="workContent" class="workContent" readonly>${w.workContent}</textarea>
							</div>
							<hr>
							<div>
							<!-- 첨부파일 넣는곳 -->
								<c:choose>
		                    		<c:when test="${ empty w.atOriginName }">
		                    			첨부파일이 없습니다.
		                    		</c:when>
		                    		<c:otherwise>
		                        		첨부파일 <br> <a href="${ b.atChangeName }" download="${ w.atOriginName }">${ w.atOriginName }</a>
		                    		</c:otherwise>
	                    		</c:choose>
							</div>
							<br>
							<hr>
							<!-- 댓글보이는곳  -->
							<div class="z">
								<span style="margin-left:660px">댓글 (<span id="rcount">3</span>)</span>
								<table id="replyArea${w.workBoardNo}" class="table" align="center">
					                <thead class="zzz">
	
					                </thead>
					                <tbody>
					                    <tr>
				                    	  <th colspan="2">
				                          	<textarea id="reply${w.workBoardNo}" cols="55" rows="2" style="resize:none; width:100%"></textarea>
					                      </th>
					                      
					                      <th style="vertical-align: middle">
					                      	<button onclick="addReply(${w.workBoardNo});" class="btn btn-secondary">등록하기</button>
					                      </th>
					                    </tr>
					                </tbody>
					            </table>
							</div>
							
						</div><br><br>
						<!-- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%여기까지 밑에 보여지는 게시글 목록%%%%%%%%%%%%%%%%%%%%%%%%%%%%% -->
					</c:forEach>	
				</c:if>
				<script>
				
			    		
			    	$(function(){ 
			    		selectReplyList();
			    	})
			    	
			    	
			    	
			    	function selectReplyList(){
			    		$(".allBoard").each(function(){
			    		    $.ajax({
			    		         url:"rlist.bo",
			    		         data:{bno:$(this).prev().val()},
			    		         context:this,
			    		         success:function(list){
			    		        	 console.log(list);
			    		        	 let value = "";
			    		        	 if(list.length > 0){
				    		        	 for(let i in list){
					                         value += "<tr>"
									               +	"<th>" + list[i].replyWriter + "</th>"
									               +	"<td>" + list[i].replyContent + "</td>"
									               +	"<td>" + list[i].replyCreateDate + "</td>"
					                    		   + "</tr>";
					    				}
			    		        	 }else{
			    		        		 value += "<tr>"
			    		        			  	+	"<th>" + "댓글이 존재하지 않습니다." + "</th>"
			    		        			 	+ "</tr>";
			    		        	 }
									 //$(this).children("div").eq(10).children().eq(1).children().eq(0).html(value);
									 $(this).find(".z thead").html(value);
									 
									 console.log($(this).children("div").eq(10));
			    		         },error:function(){
			    		        	 console.log("댓글리스트 조회용 ajax통신실패")
			    		         }
			    			})
			    		})
			    			
			    	}
			    	
			    	// 댓글 작성용 메소드
					function addReply(refWorkBoard){

			    		if($("#reply"+refWorkBoard).val().trim().length != 0){ // 유효한 댓글작성시 => insert ajax요청 (trim 공백제거 메소드)
			    			$.ajax({
			    				url:"rinsert.bo",
			    				data:{
			    					refWorkBoard:refWorkBoard,
			    					replyContent:$("#reply"+refWorkBoard).val(),
			    					replyWriter:"${loginUser.userName}",
			    					userNo:"${loginUser.userNo}"
			    				
			    				},success:function(status){
			    					if(status == "success"){
			    						selectReplyList();
			    						$("#reply"+refWorkBoard).val("");//작성란 비워주기
			    					
			    					}
			    				},error:function(){
			        				console.log("댓글 입력용 ajax통신실패")
			        			}
			    			})
			    		}else{
			    			alertify.alert("댓글 작성후 등록해주세요!");
			    		}
					}	
			    	
				</script>
			
				<div id="pagingArea">
	                <ul class="pagination">
	                
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq 1 }">
		                    	<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                  			<li class="page-item"><a class="page-link" href="detail.pro?cpage=${ pi.currentPage - 1 }&proNo=${list2.get(0).proNo}">Previous</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
	                   		<li class="page-item"><a class="page-link" href="detail.pro?cpage=${ p }&proNo=${list2.get(0).proNo}"> ${ p } </a></li>
	                    </c:forEach>
	                    
	                    
	                    <c:choose>
	                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    		<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                  			<li class="page-item"><a class="page-link" href="detail.pro?cpage=${ pi.currentPage + 1 }&&proNo=${list2.get(0).proNo}">Next</a></li>
	                    	</c:otherwise>
	                    </c:choose>                    
	                </ul>
	            </div>
		
					
			</div><!--전체감싸는 div 끝-->
		
			<div class="sidemenu">
			
			
				<!-- 이전페이지 -->
				<div class="backpage" onclick="javascript:history.go(-1);">
					<p><i class="fas fa-chevron-left"></i>&nbsp;&nbsp;이전페이지</p>
				</div>
				
			
				<br>
				
				<!-- 업무조회 -->
				<div class="workLookup">
					<p>업무조회</p>
				</div>
				
				<script>
				$(function(){
					$(".workLookup").click(function(){
						console.log("${list2.get(0).proNo}");
						location.href='list.work?proNo='+ ${list2.get(0).proNo};
					});
				})
				</script>
				<br>
				<div class="invite"><!-- 전체 참여자-->
					<div style=""><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<b>전체참여자 &nbsp; ${ list2.get(0).proNumberPeople + 1 }명</b>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
						    초대하기
						</button>
					</div><hr>
					<div class="memwrap">
						<div class="part-title">관리자&nbsp;(1)</div><hr>
							<div id="pjmemlist">
									<ul>
										<li>
											<span style="font-weight:bold" class="pjusername">${ list2.get(0).proManager }</span>
										</li>
									</ul>
								
								<div class="part-title">내부참여자&nbsp;(${ list2.get(0).proNumberPeople })</div><hr>
									<ul id="proMemberList">
										<li>
											<b>홍길동</b><br><br>
										</li>
										
									</ul>
							</div>
							<script>
								$(function(){
									var Member = '${ list2.get(0).proUserName}';
									var MemberSplit = Member.split(',');
									
									let value = "";
									
									for(let i in MemberSplit){
										
										value += "<li>"
										      +		"<b>" + MemberSplit[i] + "</b><br><br>"
										      + "</li>";
									}
									$("#proMemberList").html(value);
								})
							
							</script>
							
							
					</div>
				</div>
			</div>
		<!-- /.content-wrapper -->
		
	</div>    
		
			<!-- 모달창 부분 -->
			<div class="modal" id="myModal">
			    <div class="modal-dialog modal-dialog-scrollable">
			      <div class="modal-content">
			      
			        <!-- Modal 헤더 부분-->
			        <div class="modal-header">
			          <h4 class="modal-title">사원 초대하기</h4>
			          <button type="button" class="close" data-dismiss="modal">×</button>
			        </div>
			        
			        <!-- Modal 바디부분 -->
			        <div class="modal-body">
			        	<!-- 사원 검색구역 -->
				        <nav class="navbar navbar-expand-sm">
						  <form class="form-inline">
						    <div class="input-group">
						      <div class="input-group-prepend">
						        <span class="input-group-text">@</span>
						      </div>
						      <input type="text" class="form-control" placeholder="초대할 사원을 입력하세요.">
						    </div>    
						  </form>
						</nav>
						<hr>
						
						<!-- 검색한 사원 띄워지게 -->
						<div class="memList">
							<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
						
						</div>
			        </div>
			        
			        <!-- Modal 푸터 부분 -->
			        <div class="modal-footer">
			          <button type="button" class="btn btn-primary" data-dismiss="modal">초대하기</button>
			        </div>
			        
			      </div>
				</div>
			</div>
		<!-- 모달창 부분끝 -->
	<jsp:include page="../common/scripts.jsp" />
	<script src="plugins/jquery-ui/jquery-ui.min.js"></script>

	

</body>
</html>