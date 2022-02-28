<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 답장</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../common/links.jsp" />

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- autocomplete --> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>

<!-- summernote -->
<link rel="stylesheet" href="resources/plugins/summernote/summernote-bs4.min.css">
<script src="resources/plugins/summernote/summernote-bs4.min.js"></script>

<style>

	/* 페이지 제목 */
	#page-title{
	    margin-top:20px;
	    margin-bottom:20px;
	    font-weight:bolder;
	}
	
	/* 내용 제외 입력 정보 영역 */
	#mail-compose-form{
	  box-sizing: border-box;
	  width:100%;
	  
	}
	
	#mail-compose-form thead th{
	  padding-bottom:30px;
	  text-align:center;
	}
	
	#mail-compose-form thead td{
	  padding-bottom:30px;
	}
	
	/* 받는사람 및 참조 영역 */
	.receivers-area, .cc-area{
	  padding:5px;
	  margin-top: 5px;
	}
	
	.receivers-area span, .cc-area span{
	  border:2px solid #4E73DF;
	  background:white;
	  margin-right:10px;
	  margin-bottom:10px;
	  height:25px;
	  line-height:20px;
	  display:inline-block;
	}
	
	.receivers-area label, .cc-area label{
	  box-sizing:border-box;
	  margin-bottom:0;
	  margin-left:20px;
	  margin-right:20px;
	  font-size:13px;
	  font-weight:600 !important;
	  color:#4E73DF;
	}
	
	.receivers-area a, .cc-area a{
	  text-decoration:none;
	  color:#4E73DF;
	}
	
	.receivers-area i, .cc-area i{
	  color:#4E73DF;
	  margin-right:10px;
	  cursor: pointer;
	}
	
	/* 자동완성 영역 */
	.ui-autocomplete {
	  max-height: 200px;
	  overflow-y: scroll;
	  overflow-x: hidden;
	}
	
	/* 첨부파일 영역 */
    .attach-hidden-area{
      width:100%;
      height: 0;
      overflow: hidden;
    }
    
    .attach-hidden-area input{
      display:block;
    }
    
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
      height: 200px;
      padding:5px;
      margin-top: 5px;
    }

    .attach-preview-area .preview{
      /* border:1px solid red; */
      margin:10px;
      margin-bottom:0;
    }

    .attach-preview-area .origin-name{
      /* border:1px solid red; */
      margin-left:10px;
      margin-right:10px;
      margin-bottom:0;
      font-size: 15px;
      display:inline-block;
    }

    .attach-preview-area a{
      /* border:1px solid red; */
      color: lightgray;
      display:inline-block;
      cursor: pointer;
    }
	
	/* 취소/발송 버튼 영역 */
	.mail-btns-area{
	    /* border:1px solid red; */
	    text-align:center;
	}
	
	.mail-btns-area button[type=button]{
	  border:1px solid #DEE2E6;
	  width:75px;
	}  
	
	.mail-btns-area #send-btn{
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
		          <h1 id="page-title">메일 답장</h1>
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
						<form id="mail-form" name="mailForm" action="" method="post" enctype="multipart/form-data" onsubmit="postFormSubmit(2);">
						  
						  <input type="hidden" name="msUserNo" value="${ loginUser.userNo }" />
						  <input type="hidden" name="msSender" value="${ loginUser.userEmail }" />
						  <input type="hidden" name="msFileCount" value="" />
						  
			              <table id="mail-compose-form">
			                <thead>
			                  <tr>
			                    <th width="140px">제목</th>
			                    <td>
			                      <input type="text" name="msTitle" class="form-control" value="RE: ${ mail.msTitle }" maxlength="65" required>  
			                    </td>
			                  </tr>
			                  <tr>
			                    <th>받는사람</th>
			                    <td>
			                      <input type="text" id="receiverInput" class="form-control" placeholder="유효한 수신 메일 입력 후  enter를 누르세요">
			                      <div class="receivers-area"></div>
			                    </td>
			                  </tr>
			                  <tr>
			                    <th>참조</th>
			                    <td>
			                      <input type="text" id="ccInput" class="form-control" placeholder="유효한 참조 이메일 입력 후 enter를 누르세요">
			                      <div class="cc-area"></div>
			                    </td>
			                  </tr>
			                  <tr>
			                    <th>첨부파일</th>
			                    <td style="padding:0">
			                      <!-- 히든영역 -->
      						      <div class="attach-hidden-area"></div>
      						    
									<button type="button" id="add-file-btn" class="btn btn-sm">파일추가</button>
									<span id="attach-comment">첨부파일은 최대 5개까지만 등록 가능합니다</span>
								  <!-- 미리보기 영역 -->
								  <div class="attach-preview-area"></div>
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
			                        <textarea id="mail-textarea" name="msContent" class="form-control" required><br><br><br>
			                        	
			                        	<blockquote>
			                        		<b>----- Original Message -----</b><br>
			                        		<c:choose>
				                        		<c:when test="${ mail.mrCc eq 'N' }">
					                        		<b>From : </b>
					                        		<c:if test="${ mail.msDeptName  ne '임원' }">
					                        			${ mail.msDeptName }
					                        		</c:if> 
					                        		${ mail.msUserRank } ${ mail.msUserName } &lt; ${ mail.msSender } &gt;
					                        		<br><b>To : </b>
					                        		<c:if test="${ loginUser.deptName  ne '임원' }">
					                        			${ loginUser.deptName }
					                        		</c:if> 
					                        		${ loginUser.userRank } ${ loginUser.userName } &lt; ${ loginUser.userEmail } &gt;
					                        		<br><b>Cc : </b>
					                        		<br><b>Sent : </b> ${ mail.msDate }
					                        		<br><b>Subject : </b> ${ mail.msTitle }
				                        		</c:when>
				                        		<c:otherwise>
				                        			<b>From : </b>
					                        		<c:if test="${ mail.msDeptName  ne '임원' }">
					                        			${ mail.msDeptName }
					                        		</c:if> 
					                        		${ mail.msUserRank } ${ mail.msUserName } &lt; ${ mail.msSender } &gt;
					                        		<br><b>To : </b>
					                        		<br><b>Cc : </b>
					                        		<c:if test="${ loginUser.deptName  ne '임원' }">
					                        			${ loginUser.deptName }
					                        		</c:if> 
					                        		${ loginUser.userRank } ${ loginUser.userName } &lt; ${ loginUser.userEmail } &gt;
				                        			<br><b>Sent : </b> ${ mail.msDate }
					                        		<br><b>Subject : </b> ${ mail.msTitle }
				                        		</c:otherwise>
			                        		</c:choose><br><br>${ mail.msContent }
			                        	</blockquote>
			                        	
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
		            
		              <div class="mail-btns-area">
		                <button type="button" class="btn btn-sm" onclick="location.href='inbox.mail';">취소</button>
		                <button type="button" id="send-btn" class="btn btn-sm" onclick="postFormSubmit(1);">발송</button>
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
	
	
	
	<!-- 받는사람 정보 입력  -->
	<script>
		$(function(){
			if("${ mail.mrUserNo  }" != null){
				
	        	let id = makeid(10);
	        	
	            let result = "<span id='"+ id +"'>"
	            		   + "<input type='hidden' name='mrUserNoList' value='${ mail.msUserNo }' required/>"
	            		   + "<label>";
	            		   
			               if( "${ mail.msDeptName }" != '임원'){
			                	
			                	result += "${ mail.msDeptName }";
			                	
			               }		   
	            		   
	               result += " ${ mail.msUserRank } ${ mail.msUserName } &lt; ${ mail.msSender } &gt;</label>"
	            		   + "<a href='#" + id + "' class='delete-address-btn'><i class='fas fa-times'></i></a>"
	          			   + "</span>";
	          			   
	          	$(".receivers-area").append(result);
				
			}
			
		});
	</script>
	
	
	
	<!-- form input 엔터키 누를 때 submit 방지 -->	
	<script>
		function postFormSubmit(num){
			
			if(num == 1){ // 발송 버튼 클릭 시 mail-form submit
				
				let title = $("input[name=msTitle]").val().trim();
				let content = $("#mail-textarea").val().trim();
				let receiver = $(".receivers-area").text().trim();
				
				if(title != "" && content != "" && receiver != ""){
					
					let fileCount = $(".attach-preview-area").children().length;
					
					if(fileCount > 0){ // 첨부파일 등록되었을 경우
						
						$("input[name=msFileCount]").val(fileCount); // 첨부파일 개수 추가
						
					}else{
						
						$("input[name=msFileCount]").val("0");
						
					}
					
					$("#mail-form").attr("action", "send.mail").submit();
					
				}else{
					
					if(title == ""){
						
						alert("메일 제목을 입력해주세요.");
						$("input[name=msTitle]").focus();
						
					}else if(content == ""){
						
						alert("메일 내용을 입력해주세요.");
						$("#mail-textarea").focus();
						
					}else{
						
						alert(" 받는사람의 이메일을 입력해주세요.");
						$("#receiverInput").focus();
						
					}
					
				}
				
			}else{ // 발송 버튼 클릭 아니면 submit 안 되도록
				
				return false;
				
			}
			
		}
	</script>


    <!-- 회사 사원들 주소록 자동 검색 -->
    <script>
	    $(function(){
	    	
	    	// 받는사람 이메일 입력 시 이메일 키워드가 포함된 현재 재직 중인 사원 목록 자동 검색 / 검색된 이메일 없으면 유효한 이메일 형식만 입력 가능
	        $("#receiverInput").autocomplete({
	            source : function(request, response) {
	                 $.ajax({
	                        type : "get",
	                        url : "userList.search",
	                        dataType : "json",
	                        data : {
	                            searchValue:request.term // 현재 input에 입력되는 value 값
	                        },
	                        success : function(data) {
	                            
	                            response(
	                                $.map(data, function(item) {
	                                	
	                                    return {
	                                        label:item.deptName + " / " + item.userRank + " / " + item.userName + " / " + item.userEmail,
	                                        value:" ",
	                                        userNo:item.userNo,
											deptName:item.deptName,
											userRank:item.userRank,
											userName:item.userName,
											userEmail:item.userEmail
	                                    }
	                                    
	                                })
	                                
	                            );
	                            
	                        }
	                   });
	                },    // source 는 자동 완성 대상
	            select : function(event, ui) {    //아이템 선택시
	            	
	            	let id = makeid(10);
	            	
	                let result = "<span id='"+ id +"'>"
	                		   + "<input type='hidden' name='mrUserNoList' value='" + ui.item.userNo + "' required/>"
	                		   + "<label>";
	                		   
				               if( ui.item.deptName != '임원'){
				                	
				                	result += ui.item.deptName;
				                	
				               }		   
	                		   
	                   result += " " + ui.item.userRank + " " + ui.item.userName + " &lt; " + ui.item.userEmail + " &gt;</label>"
                    		   + "<a href='#" + id + "' class='delete-address-btn'><i class='fas fa-times'></i></a>"
                  			   + "</span>";
                  			   
                  	$(".receivers-area").append(result);
	                
	            },
	            response : function(event, ui) {
	                
	                if (ui.content.length === 0) {
	                	
	                	$("#receiverInput").keypress(function(e){
	                		
	                		if(e.keyCode == 13){ 
	                			
	                			let extEmail = $("#receiverInput").val().trim();
		                		
		                		const exptext = /^[0-9a-zA-Z]+([-_.]*[0-9a-zA-Z])+@[0-9a-zA-Z]+.[a-zA-Z]{2,3}$/;
								
		                		let result = exptext.test(extEmail);
		                		
	                			if(result == false){ // 유효하지 않은 이메일 입력 시
	                				
	                				$("#receiverInput").val("");
	                				$("#receiverInput").focus();
	                				

	                			} else {
	                			
		                			let id = makeid(10);
		                			
		                			let result = "<span id='"+ id +"'>"
					                		   + "<input type='hidden' name='extMailList' value='" + extEmail + "' required/>"
					                		   + "<label>&lt; " + extEmail + " &gt;</label>"
				                    		   + "<a href='#" + id + "' class='delete-address-btn'><i class='fas fa-times'></i></a>"
				                  			   + "</span>";
				                  			   
				                  	$(".receivers-area").append(result);
				                  	$("#receiverInput").val("");
			                  	
	                			}
	                			
	                		}
	                		
	                	});
                		
	                }
	                
	            },
	            focus : function(event, ui) {
	                return false;//한글 에러 잡기용
	            },
	            minLength : 1,
	            classes : {
	                "ui-autocomplete":"highlight"
	            },
	            delay : 200,
	            position : { my :"right top", at:"right bottom" },
	            close: function(event, ui){ // 검색 목록 닫힐 때
	            	
	            	const keyword = $("#receiverInput").val().trim();
	            	
	            	if(keyword.length == 0){ // value 공백까지 제거한 후 길이가 0일 시
	            		
	            		$("#receiverInput").val("");
	            		
	            	}else{
	            		
	            		return false;
	            		
	            	}
	            	
	            }
	            
	        });
	    	
	    	
	    	
	    	// 참조 이메일 입력 시 이메일 키워드가 포함된 현재 재직 중인 사원 목록 자동 검색 / 검색된 이메일 없으면 유효한 이메일 형식만 입력 가능
	        $("#ccInput").autocomplete({
	            source : function(request, response) {
	                 $.ajax({
	                        type : "get",
	                        url : "userList.search",
	                        dataType : "json",
	                        data : {
	                            searchValue:request.term // 현재 input에 입력되는 value 값
	                        },
	                        success : function(data) {
	                            
	                            response(
	                                $.map(data, function(item) {
	                                	
	                                    return {
	                                        label:item.deptName + " / " + item.userRank + " / " + item.userName + " / " + item.userEmail,
	                                        value:" ",
	                                        userNo:item.userNo,
											deptName:item.deptName,
											userRank:item.userRank,
											userName:item.userName,
											userEmail:item.userEmail
	                                    }
	                                    
	                                })
	                                
	                            );
	                            
	                        }
	                   });
	                },    // source 는 자동 완성 대상
	            select : function(event, ui) {    //아이템 선택시
	            	
	            	let id = makeid(10);
	            	
	                let result = "<span id='"+ id +"'>"
	                		   + "<input type='hidden' name='ccMrUserNoList' value='" + ui.item.userNo + "' />"
	                		   + "<label>";
	                		   
				               if( ui.item.deptName != '임원'){
				                	
				                	result += ui.item.deptName;
				                	
				               }		   
	                		   
	                   result += " " + ui.item.userRank + " " + ui.item.userName + " &lt; " + ui.item.userEmail + " &gt;</label>"
                    		   + "<a href='#" + id + "' class='delete-address-btn'><i class='fas fa-times'></i></a>"
                  			   + "</span>";
                  			   
                  	$(".cc-area").append(result);
	                
	            },
	            response : function(event, ui) {
	                
	                if (ui.content.length === 0) {
	                	
	                	$("#ccInput").keypress(function(e){
	                		
	                		if(e.keyCode == 13){
	                			
	                			let extEmail = $("#ccInput").val().trim();
		                		
		                		//const exptext = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		                		const exptext = /^[0-9a-zA-Z]+([-_.]*[0-9a-zA-Z])+@[0-9a-zA-Z]+.[a-zA-Z]{2,3}$/;
								
		                		let result = exptext.test(extEmail);
		                		
	                			if(result == false){ // 유효하지 않은 이메일 입력 시
	                				
	                				$("#ccInput").val("");
	                				$("#ccInput").focus();
	                				

	                			} else {
	                			
		                			let id = makeid(10);
		                			
		                			let result = "<span id='"+ id +"'>"
					                		   + "<input type='hidden' name='ccExtMailList' value='" + extEmail + "' />"
					                		   + "<label>&lt; " + extEmail + " &gt;</label>"
				                    		   + "<a href='#" + id + "' class='delete-address-btn'><i class='fas fa-times'></i></a>"
				                  			   + "</span>";
				                  			   
				                  	$(".cc-area").append(result);
				                  	$("#ccInput").val("");
			                  	
	                			}
	                			
	                		}
	                		
	                	});
                		
	                }
	                
	            },
	            focus : function(event, ui) {
	                return false;//한글 에러 잡기용
	            },
	            minLength : 1,
	            classes : {
	                "ui-autocomplete":"highlight"
	            },
	            delay : 200,
	            position : { my :"right top", at:"right bottom" },
	            close: function(event, ui){ // 검색 목록 닫힐 때
	            	
	            	const keyword = $("#ccInput").val().trim();
	            	
	            	if(keyword.length == 0){ // value 공백까지 제거한 후 길이가 0일 시
	            		
	            		$("#ccInput").val("");
	            		
	            	}else{
	            		
	            		return false;
	            		
	            	}
	            	
	            }
	            
	        });
	        
	        
	        
	     	// 받는사람 이메일 x버튼 클릭 시
		    $(document).on("click", ".delete-address-btn", function(){
		    	
		        const id = $(this).attr("href"); // href="#고유한아이디값" => id = "#고유한아이디값"
		        $(id).remove(); // 해당 아이디가 부여된 input:file 요소 제거
		        $(this).parent().remove(); // 미리보기 영역의 해당 미리보기용 요소 제거
		        
		    });
	    	
	    });
    </script>



	<!-- 첨부파일 기능 -->
	<script>
		
		$(function(){
			
		    // 파일 추가 버튼 클릭 시
		    $(document).on("click", "#add-file-btn", function(){
		    	
		    	let fileLength = $(".attach-preview-area").children().length;
		    	
		    	if(fileLength < 5){ // 첨부파일 5개까지만 등록 가능하도록 조건 검사
		    		
			        addFile({id:makeid(10)}); // 고유하게 생성된 아이디값을 담은 객체 매개변수로 전달
			        
		    	} else {
		    		alert("첨부파일은 5개까지만 등록 가능합니다.");
		    	}
		    });
		
		    // 미리보기용 요소의 삭제버튼 클릭 시
		    $(document).on("click", ".delete-file-btn", function(){
		    	
		        const id = $(this).attr("href"); // href="#고유한아이디값" => id = "#고유한아이디값"
		        $(id).remove(); // 해당 아이디가 부여된 input:file 요소 제거
		        $(this).parent().remove(); // 미리보기 영역의 해당 미리보기용 요소 제거
		        
		    });
		    
		});
	
	
	    // input:file 요소 생성  
	    function hiddenFile(o){ // '고유한 아이디값' 담긴 객체
	    	
	        let file = "";
	        file += "<input type='file' name='upfile' id='" + o.id + "' style='display:none'/>"; // 해당 객체의 id 속성에 접근해 아이디값 부여하면서 input:file 요소 생성
	        
	        return file;
	        
	    }
	
	    // 미리보기용 요소 생성
	    function file(o){ // '고유한 아이디값' + '원본파일명' + '확장자' 담긴 객체
	    	
	        let preview = "";
	    
	        preview += "<div class='preview'>";
	        preview += 	"<p class='origin-name'>" + o.name + "</p>"; // 원본파일명
	        preview += 	"<a href='#" + o.id + "' class='delete-file-btn'><i class='fas fa-times'></i></a>"; // input:file 요소의 아이디값을 href 속성에 담은 삭제용 a태그 버튼 요소
	        preview += "</div>";
	        
	        return preview;
	        
	    }
	
	    // 첨부파일 추가 버튼 클릭 시 => 히든영역 input:file 요소 / 미리보기 영역 미리보기용 요소 자손으로 추가
	    function addFile(o){ // o : 고유한 아이디값 담긴 객체
	    	
	        $(".attach-hidden-area").append(hiddenFile(o)); // 히든 영역에 고유한 아이디값 부여한 input:file 요소 생성
	        $("#" + o.id).click(); // 해당 요소 클릭 이벤트까지 실행해서 파일 찾기 띄워짐
	        $("#" + o.id).on("change", function(e){ // input:file 요소에 첨부파일이 담겨질 때
	            
	            // e.target.value = "C:\fakepath\원본파일명.jpg"
	            const arr1 = e.target.value.split("\\"); // ['C:', 'fakepath', '원본파일명.jpg']
	            const name = arr1[arr1.length-1]; // "원본파일명.jpg"
	            o.name = name; // o 객체에 name 속성으로 파일원본명 담기
	
	            const arr2 = e.target.value.split("."); // ['C:', 'fakepath', '원본파일명.jpg']
	            const ext = arr2[arr2.length-1]; // "jpg"
	            o.ext = ext; // o 객체에 ext 속성으로 파일확장자 담기
	
	            $(".attach-preview-area").append(file(o)); // o 객체 매개변수로 전달하면서 미리보기 영역에 미리보기용 요소 생성
	
	        });
	        
	    }
	
	    // 히든 영역에 생성될 file의 고유한 id 값 생성
	    function makeid(length) { // length : 설정된 고유한 아이디값의 길이
	    	
	        let result = "";
	        const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"; // 랜덤으로 선택될 문자들(문자열)
	        const charactersLength = characters.length; // 랜덤 문자열의 길이
	        
	        for ( let i = 0; i < length; i++ ) { // 설정한 길이만큼 고유한 아이디값 랜덤으로 선택된 문자 연이어서 반복 생성 
	            result += characters.charAt(Math.floor(Math.random() * charactersLength)); 
	        }
	        
	        return result; // 설정한 길이만큼 생성된 고유한 아이디값
	        
	    }
	
    </script>
    
    
    
	<!-- summernote 기능 -->
	<script>
	  $(function() {
		
		// 섬머노트 툴바 세팅
		let toolbar = [
		    ["fontname", ["fontname"]], // 글꼴 설정
		    ["fontsize", ["fontsize"]], // 글자 크기 설정
		    ["style", ["bold", "italic", "underline","strikethrough", 'clear']], // 글꼴 스타일
		    ["color", ["forecolor","color"]], // 글자색
		    ["table", ["table"]], // 표
		    ["para", ["ul", "ol", "paragraph"]], // 문장, 문단 설정
		    ["height", ["height"]], // 줄간격 설정
		    ["insert",["picture","link","video"]], // 사진, 링크, 동영상 첨부
		    ["view", ["codeview", "fullscreen", "help"]] // 전체화면, 코드보기, 도움말
		];  
		
		// 섬머노트 설정
		let setting = {
			height : 400,
            minHeight : null,
            maxHeight : null,
            lang : "ko-KR",
            toolbar : toolbar,
    		fontNames : ["맑은 고딕","궁서","굴림체","굴림","돋움체","바탕체","Arial", "Arial Black", "Comic Sans MS", "Courier New"],
    		fontSizes : ["8","9","10","11","12","14","16","18","20","22","24","28","30","36","50","72"],
            callbacks : { //콜백 함수	
            	
            	onImageUpload : function(files, editor, welEditable) {
            		
		            // 파일 업로드 (다중 업로드를 위해 반복문 사용)
		            for (let i = files.length - 1; i >= 0; i--) {
		            	
		            uploadSummernoteImageFile(files[i], this);
		            
		            }
	            
               }
    		
          }
            
		};  

	    $("#mail-textarea").summernote(setting);
	    
	    $("#mail-textarea").summernote("fontSize", "12");
	    $("#mail-textarea").summernote("fontName", "맑은 고딕");

	    
	  });
	  
	  // 내용에 섬머노트 기능으로 이미지 등록 시 자동으로 내부 경로에 저장하는 ajax 실행
	  function uploadSummernoteImageFile(file, el) {
		  
		  data = new FormData();
		  data.append("file", file);
		  
		  $.ajax({
			  url : "uploadSummernoteImageFile.mail",
			  data : data,
		   	  type : "POST",
			  enctype : 'multipart/form-data',
			  contentType : false,
			  processData : false,
			  success : function(data) {
				  
			  	$(el).summernote('editor.insertImage', data.url);

			  }
		  
		  });
	  }
	  
	</script>
	
</body>
</html>