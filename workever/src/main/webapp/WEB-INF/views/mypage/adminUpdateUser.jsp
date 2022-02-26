<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.css">

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>
    div{box-sizing: border-box;}
    .content-wrapper{overflow: hidden; position: relative;}
    .content-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }
    .content-title span{
        font-size: 25px;
        font-weight: 600;
    }

    .card{
        margin-left: 100px; margin-right: 100px;
    }
    .table{
        text-align: center;
    }
    
    .card-sub{
        width: 500px;
        margin: auto;
        text-align: center;
    }
    .card-footer ul{
        margin-bottom: 0;
    }

    .select2{
        width: 100px;
        border: 1px solid lightgray;
        border-radius: 1px;
        margin-right: 10px; margin-top: 7px;
    }
    .card-header{overflow: hidden;}
    .card-tools{float: left !important; }
    .user-modal{
        border: none;
        color: blue;
        background-color: white;
    }

    /* 사원 정보변경 모달 */
    .modal-profileImg{
        height: 370px; width: 340px;
        float: left; 
        text-align: center;
    }
    .modal-userProfile{
        display: block;
        border-bottom: 1px solid gray;
        height: 170px; width: 420px;
        float: right;
        padding-left: 30px;
    }
    .modal-comProfile{
        display: block;
        height: 200px; width: 420px;
        float: right;
        padding-left: 30px;
    }
    .modal-label{
        width: 150px;
    }
    .modal-userRank{
        border: 1px solid lightgray;
        font-size: 15px;
        width: 180px;
    }
    .profile-image, .status-userImg{
        width: 170px; height: 170px;
        border-radius: 70%;
        overflow: hidden;
        display: inline-block;
    }
    .status-userImg{
        width: 100px; height: 100px;
        margin: auto;
        margin-left: 5px;
    }
    .profile-image img, .status-userImg img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    #modal-userRank{
        border: 1px solid lightgray;
        width: 180px; font-size: 15px;
    }

    #userResDate{
        border: none;
        border-bottom: 1px solid lightgray;
        width: 150px;
        font-size: 13px;
    }

    /* 검색 영역*/
    .search-select{
        width: 100px;
        margin-left: 45px;
        display: inline;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
    <jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        <div class="content-title">
            <span>사원 정보</span>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="card-tools">
                    <div></div>
                    <div class="input-group input-group-sm" style="width: 100px; float: left;">
                        <select class="select2 form-control" name="category" id="category">
                            <option value="전체">전체</option>
                            <option value="재직">재직</option>
                            <option value="휴직">휴직</option>
                            <option value="퇴사">퇴사</option>
                        </select>
                    </div>
                </div>
                <div class="cart-tools" style="float: right; width: 450px;">
                    <form action="searchUser.ad" class="search-area">
                        <select name="group" class="form-control search-select">
                            <option value="user-Name">사원명</option>
                            <option value="dept-Name">부서명</option>
                            <option value="user-Rank">직급</option>
                        </select>
                        <div class="input-group" style="width: 300px; float:right">
                            <input type="text" name="keyword" class="form-control float-right" placeholder="Search">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card-body p-0">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 10px">
                                <input type="checkbox" name="" id="">
                            </th>
                            <th>사원명</th>
                            <th>부서</th>
                            <th>직급</th>
                            <th style="width: 100px">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <input type="hidden" class="userEmail" value="${user.userEmail}">
                                <input type="hidden" class="comName" value="${user.comName}" >
                                <input type="hidden" class="userRank" value="${user.userRank}" >
                                <input type="hidden" class="comPhone" value="${user.comPhone}" >
                                <input type="hidden" class="userFilePath" value="${user.userFilePath}" >
                                <input type="hidden" class="userPhone" value="${user.userPhone}">
                                <input type="hidden" class="deptNo" value="${user.deptNo}">
                                <input type="hidden" class="userResDate" value="${user.userResDate}">
                                <td><input type="checkbox" name="" class="info-check"></td>
                                <td><a class="openUserInfo userName">${user.userName}</a></td>
                                <td class="deptName">${user.deptName}</td>
                                <td class="userRank">${user.userRank}</td>
                                <td>
                                    <button class="user-modal">${user.userStatus}</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body    usermanage.ad   -->

            <div class="card-footer clearfix">
                <div class="card-sub">
                    <ul class="pagination pagination-sm justify-content-center">
                        <c:choose>
                            <c:when test="${ empty category}"><!-- 기본 -->
                            	<c:choose>
                            		<c:when test="${ empty group }"><!-- 검색전 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq 1}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="usermanage.ad?upage=${pi.currentPage - 1}">&laquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:when>
                            		<c:otherwise><!-- 검색후 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq 1}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="searchUser.ad?upage=${pi.currentPage - 1}&group=${group}&keyword=${keyword}">&laquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:otherwise>
                            	</c:choose>
                            </c:when>
                            
							<c:otherwise><!-- 조건 -->
								<c:choose>
                            		<c:when test="${ empty group }"><!-- 검색전 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq 1}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="usermanage.ad?upage=${pi.currentPage - 1}&category=${category}">&laquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:when>
                            		<c:otherwise><!-- 검색후 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq 1}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="searchUser.ad?upage=${pi.currentPage - 1}&category=${category}&group=${group}&keyword=${keyword}">&laquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:otherwise>
                            	</c:choose>
							</c:otherwise>
                        </c:choose>
                        
                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                        	<c:choose>
                        		<c:when test="empty category"><!-- 기본 -->
                        			<c:choose>
                        				<c:when test="empty group"><!-- 검색전 -->
                        					<li class="page-item"><a class="page-link" href="usermanage.ad?upage=${p}">${p}</a></li>
                        				</c:when>
                        				<c:otherwise><!-- 검색후 -->
                        					<li class="page-item"><a class="page-link" href="searchUser.ad?upage=${p}&group=${group}&keyword=${keyword}">${p}</a></li>
                        				</c:otherwise>
                        			</c:choose>
                        		</c:when>
                        		
                        		<c:otherwise><!-- 조건 -->
                        			<c:choose>
                        				<c:when test="empty group"><!-- 검색전 -->
                        					<li class="page-item"><a class="page-link" href="usermanage.ad?upage=${p}&category=${category}">${p}</a></li>
                        				</c:when>
                        				<c:otherwise><!-- 검색후 -->
                        					<li class="page-item"><a class="page-link" href="searchUser.ad?upage=${p}&category=${category}&group=${group}&keyword=${keyword}">${p}</a></li>
                        				</c:otherwise>
                        			</c:choose>
                        		</c:otherwise>
                        	</c:choose>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${ empty category}"><!-- 기본 -->
                            	<c:choose>
                            		<c:when test="${ empty group }"><!-- 검색전 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq pi.maxPage}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="usermanage.ad?upage=${pi.currentPage + 1}">&raquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:when>
                            		<c:otherwise><!-- 검색후 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq pi.maxPage}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="searchUser.ad?upage=${pi.currentPage + 1}&group=${group}&keyword=${keyword}">&raquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:otherwise>
                            	</c:choose>
                            </c:when>
                            
							<c:otherwise><!-- 조건 -->
								<c:choose>
                            		<c:when test="${ empty group }"><!-- 검색전 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq pi.maxPage}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="usermanage.ad?upage=${pi.currentPage + 1}&category=${category}">&raquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:when>
                            		<c:otherwise><!-- 검색후 -->
                            			<c:choose>
                            				<c:when test="${pi.currentPage eq pi.maxPage}">
				                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
				                            </c:when>
				                            <c:otherwise>
				                                <li class="page-item"><a class="page-link" href="searchUser.ad?upage=${pi.currentPage + 1}&category=${category}&group=${group}&keyword=${keyword}">&raquo;</a></li>
				                            </c:otherwise>
                            			</c:choose>
                            		</c:otherwise>
                            	</c:choose>
							</c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>

        <!-- 사원 상태 변경 모달 -->
        <div class="modal" id="user-status">
            <div class="modal-dialog ">
                <div class="modal-content">
    
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <div style="margin-left:180px;">
                            <span style="text-align: center; font-size: 17px; font-weight: 700;">
                                사원 상태 변경
                            </span>
                        </div>
                        <button type="button" class="close" data-dismiss="modal">
                            &times;
                        </button>
                    </div>
    
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div style="width: 100px; height: 100px; margin: auto; margin-top: 10px; text-align: center;">
                            <div class="status-userImg">
                                <img src="resources/images/user-circle-solid.svg" alt="">
                            </div>
                        </div>
                        <div style="text-align: center;">
                            <input type="hidden" name="userEmail" id="enable-userEmail" value="">
                            <span id="status-userName"
                            style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 10px;">
                                김말순
                            </span><br>
                            <span id="status-deptName"
                            style="font-size: 13px; display: inline-block; margin: 10px 0 10px 0;">
                                인사팀
                            </span>
                            <span> / </span>
                            <span id="status-userRank"
                            style="font-size: 13px; display: inline-block; margin: 10px 0 10px 0;">
                                사원
                            </span><br>
                        </div>
                        <div style="text-align: center; margin-bottom: 20px;">
                            <select name="userStatus" id="status-userStatus" style="border: 1px solid lightgray; width: 150px; font-size: 13px;">
                                <option value="재직">재직</option>
                                <option value="휴직">휴직</option>
                                <option value="퇴사">퇴사</option>
                            </select>
                            <br>
                        </div>
                        <div id="status-out" style="text-align: center; margin-bottom: 30px;">
                            <label for="userResDate" style="font-size: 13px;">퇴사일</label>
                            <input type="text" name="userResDate" id="userResDate">
                        </div>
                        <div style="text-align: center;">
                            <button type="button" class="btn" id="btn-enablesub" 
                            style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                                수정
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" 
                            style="width: 90px; margin-left: 60px;">
                                취소
                            </button>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>

        <!-- 사원 정보변경 모달 -->
        <div class="modal" id="modal-userInfo">
            <div class="modal-dialog modal-lg">
                <form action="updateUserInfo.ad" method="post">
                    <div class="modal-content">
        
                        <div class="modal-header">
                            <h4 class="modal-title">Default Modal</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body" style="padding-top: 50px;">
        
                            <div class="modal-profileImg">
                                <div class="profile-image">
                                    <img src="resources/images/user-circle-solid.svg" alt="">
                                </div>
                            </div>
                            <div class="modal-userProfile" style=" margin-bottom: 20px;">
                                <div class="form-group mypage-group">
                                    <label for="" class="modal-label">이메일</label>
                                    <span id="modal-userEmail"></span>
                                    <input type="hidden" name="userEmail" id="input-Email">
                                </div>
                                <div class="form-group mypage-group">
                                    <label for="" class="modal-label">이름</label>
                                    <span id="modal-userName"></span>
                                </div>
                                <div class="form-group mypage-group">
                                    <label for="" class="modal-label">전화번호</label>
                                    <span id="modal-userPhone"></span>
                                </div>
                            </div>
                            <div class="modal-comProfile">
                                <div class="form-group mypage-group">
                                    <label for="" class="modal-label">회사명</label>
                                    <span id="modal-comName"></span>
                                </div>
                                <div class="form-group mypage-group">
                                    <label for="" class="modal-label">부서</label>
                                    <select name="deptNo" id="modal-userDept"
                                        style="border: 1px solid lightgray; width: 180px; font-size: 15px;">
                                        <c:forEach var="dept" items="${deptList}">
                                            <option value="${dept.deptNo}">${dept.deptName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group mypage-group">
                                    <label for="" class="modal-label">직급</label>
                                    <input type="text" id="modal-userRank" name="userRank" value="">
                                </div>
                                <div class="form-group mypage-group">
                                    <label for="" class="modal-label">회사연락처</label>
                                    <span id="modal-comPhone"></span>
                                </div>
                            </div>
        
                        </div>
                        <div class="modal-footer justify-content-between">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">사원정보변경</button>
                        </div>
        
                    </div>
                </form>
            </div>
        </div>
        
    </div>
    <jsp:include page="../common/scripts.jsp" />
    <!-- jQuery UI 1.11.4 -->
    <script src="plugins/jquery-ui/jquery-ui.min.js"></script>
    <!-- datetimepicker -->
    
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- 검색 키워드 고정 -->
    <c:if test="${not empty group}">
        <script>
            $(function(){
                $('select[name=group] option[value=${group}]').attr("selected", true);
                $('input[name=keyword]').val("${keyword}");
            })
        </script>
    </c:if>
    <!-- 분류 선택시 선택값 고정 -->
	<c:if test="${not empty category}">
        <script>
            //console.log("하하하하하하")
            $("select[name=category] option[value=${category}]").attr("selected", true)
        </script>
    </c:if>
    

    <script>
        $(function(){
            // 상태변경 모달 띄우기
            $('.user-modal').click(function(){
                $('#status-userName').text($(this).parent().siblings().children('.userName').text());
                $('#status-deptName').text($(this).parent().siblings('.deptName').text());
                $('#status-userRank').text($(this).parent().siblings('.userRank').text());
                $('#enable-userEmail').val($(this).parent().siblings(".userEmail").val());

                var userStatus = $(this).text();
                $('#status-userStatus').val(userStatus).prop("selected", true);
                if(userStatus == '퇴사'){
                    $('#status-out').show();
                    $('#userResDate').val($(this).parent().siblings('.userResDate').val())
                }else{
                    $('#status-out').hide();
                }
                
                if($(this).parent().siblings('.userFilePath').val() != ''){
                    $(".status-userImg>img").attr('src', $(this).parent().siblings('.userFilePath').val());
                }else{
                    $(".status-userImg>img").attr('src', 'resources/images/user-circle-solid.svg');
                }
                $('#user-status').modal();
            });

            $('#status-userStatus').change(function(){
                var result = $('#status-userStatus option:selected').val();
                var result2 = $('#status-userStatus').val();

                if(result2 != '퇴사'){
                    $('#status-out').hide();
                }else{
                    $('#status-out').show();
                }
            })
            
            // 정보변경 모달 띄우기
            $('.openUserInfo').click(function(){
                $('#modal-userEmail').text($(this).parent().siblings(".userEmail").val());
                $('#input-Email').val($(this).parent().siblings(".userEmail").val());
                $('#modal-userName').text($(this).text());
                $('#modal-userPhone').text($(this).parent().siblings(".userPhone").val());
                $('#modal-comName').text($(this).parent().siblings(".comName").val());
                $('#modal-userDept').val($(this).parent().siblings(".deptNo").val()).prop("selected", true);
                //$('#modal-userRank').val($(this).parent().siblings(".userRank").val());
                $('#modal-userRank').attr('value', $(this).parent().siblings(".userRank").val());
                $('#modal-comPhone').text($(this).parent().siblings(".comPhone").val());
                if($(this).parent().siblings('.userFilePath').val() != ''){
                    $(".profile-image>img").attr('src', $(this).parent().siblings('.userFilePath').val());
                }else{
                    $(".profile-image>img").attr('src', 'resources/images/user-circle-solid.svg');
                }
                $('#modal-userInfo').modal();
            })

            // 사원 상태 변경
            $('#btn-enablesub').click(function(){
                $.ajax({
                    url:"updateStatus.ad",
                    type:'post',
                    data:{
                        userEmail : $('#enable-userEmail').val(),
                        userStatus : $("#status-userStatus").val(),
                        userResDate : $('#userResDate').val()
                    },
                    success:function(result){
                        if(result == 'NNNNY'){
                            alert("사원상태를 변경했습니다.");
                            location.reload();
                        }else{
                            alert("사원상태 변경에 실패했습니다.");
                            $('.user-modal').modal('hide');
                        }
                    }, error:function(){
                        console.log("회원상태변경 ajax 통신 실패");
                    }
                })
            })


            // 카테고리 유지
            
            // 카테고리 선택
            $('select[name=category]').change(function(){
                var category = $(this).children("option:selected").val();
                
                // 검색전
                if("${group}" == ""){
                    if(category == '전체'){
                        location.href = "usermanage.ad";
                    }else{
                        location.href = "usermanage.ad?category=" + category;
                    }
                }else{  // 검색후
                    if(category == '전체'){
                        location.href = "searchUser.ad?group=${group}&keyword=${keyword}";
                    }else{
                        location.href = "searchUser.ad?category=" + category + "&group=${group}&keyword=${keyword}";
                    }
                }
            })

            // date
            $('#userResDate').datepicker({
                dateFormat: 'mm/dd/yy'
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
                ,changeYear: true //option값 년 선택 가능
                ,changeMonth: true //option값  월 선택 가능                
                ,buttonText: "선택" //버튼 호버 텍스트              
                ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
                ,dayNamesMin: ['일','월','화','수','목','금','토'] 
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']

            });

        })
    </script>
</body>
</html>