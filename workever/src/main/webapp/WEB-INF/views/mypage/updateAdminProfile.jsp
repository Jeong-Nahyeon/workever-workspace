<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />

<style>
    div{box-sizing: border-box;}
    .content-wrapper{overflow: hidden; position: relative;}
    .mypage-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }

    /* 마이페이지 제목, 저장버튼*/
    .mypage-title span{
        font-size: 25px;
        font-weight: 600;
    }
    #btn-title{
        float: right;
    }
    #btn-title button{
        width: 80px; height: 30px;
        border: none;
        background-color: rgb(78, 115, 223);
        border-radius: 3%;
        color: white; font-size: 13px;
    }

    /* 마이페이지 내용 영역 */
    .mypage-content{margin: 50px 100px; margin-bottom: 100px;}
    .profile-image{
        
        width: 200px; height: 200px;
        border-radius: 70%;
        overflow: hidden;
    }
    .profile-image img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    #btn-selectphoto{
        width: 40px; height: 40px;
        display: block;
        position: absolute;
        bottom: 35px;
        right: 265px;
        border-radius: 90px;
        border: 1px solid gray;
        padding: 0; padding-top: 7px;
        text-align: center;
    }

    .company-infomation{
        width: 800px;
        float: right;
        margin-bottom: 100px;
    }
    .company-infomation label{width: 200px;}
    #file{
        position: absolute;
        width: 0; height: 0; padding: 0; border: 0;
        overflow: hidden;
    }
</style>
</head>
<body>

    <div class="wrapper">
        <jsp:include page="../common/header.jsp" />
	    <jsp:include page="mypageSidebar.jsp" />

        <div class="content-wrapper">
            <form action="update.ad" id="updateAdminForm" enctype="multipart/form-data" method="post">
                <div class="mypage-title">
                    <span>계정 관리</span>
                    <div id="btn-title">
                        <button id="btn-FormSubmit">저장하기</button>
                    </div>
                </div>
    
                <div class="mypage-content">
                    <div class="card">
                        <div class="card-body row">
                            <div class="col-6 text-center d-flex align-items-center justify-content-center">
                                <div class="profile-image">
                                    <c:choose>
                                        <c:when test="${empty loginUser.userFilePath}">
                                            <img src="resources/images/user-circle-solid.svg" alt="" id="profileImg-img">
                                            <!--<a href="" class="btn btn-light" id="btn-selectphoto">-->
                                            <label for="file" class="btn btn-light" id="btn-selectphoto">
                                                <i class="fas fa-camera-retro fa-lg"></i>
                                                <input type="file" name="adUpfile" id="file">
                                            </label>
                                            <!--</a>-->
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#" download="">
                                                <img src="${loginUser.userFilePath}" alt="" id="profileImg-img">
                                            </a>
                                            <label for="file" class="btn btn-light" id="btn-selectphoto">
                                                <i class="fas fa-camera-retro fa-lg"></i>
                                                <input type="file" name="adUpfile" id="file">
                                                <input type="hidden" name="userFilePath" value="${loginUser.userFilePath}">
                                            </label>
                                       </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="col-5">
                                <input type="hidden" name="comNo" value="${loginUser.comNo}">
                                
                                <div class="form-group">
                                    <label for="inputName">이메일</label>
                                    <input type="email" id="userEmail" class="form-control" name="userEmail" value="${loginUser.userEmail}" readonly/>
                                </div>
                                <div class="form-group">
                                    <label for="inputEmail">이름</label>
                                    <input type="text" id="userName" class="form-control" name="userName" value="${loginUser.userName}"/>
                                </div>
                                <div class="form-group">
                                    <label for="inputSubject">전화번호</label>
                                    <input type="text" id="userPhone" class="form-control" name="userPhone" value="${loginUser.userPhone}"/>
                                    <input type="hidden" id="checkUserPhone" value="userPhoneN" />
                                    <div id="checkPhone">
    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card company-infomation">
                        <div class="card-body row">
                            <div class="col-1"></div>
                            <div class="col-9">
                                <div>&nbsp;</div>
                                <div class="form-group">
                                    <label for="inputSubject">회사명</label>
                                    <input type="text" id="comName" class="form-control" name="comName" value="${loginUser.comName}"/>
                                </div>
                                <div class="form-group">
                                    <label for="inputSubject">부서</label>
                                    <select name="deptNo" id="deptName" class="form-control">
                                        <c:forEach var="d" items="${deptlist}">
                                            <option value="${d.deptNo}">${d.deptName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputSubject">직급</label>
                                    <input type="text" id="userRank" class="form-control" name="userRank" value="${loginUser.userRank}"/>
                                </div>
                                <div class="form-group">
                                    <label for="inputSubject">회사연락처</label>
                                    <input type="text" id="comPhone" class="form-control" name="comPhone" value="${loginUser.comPhone}"/>
                                    <input type="hidden" id="checkComPhone" value="comPhoneN" />
                                    <div id="checkComPhone">
    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <jsp:include page="../common/footer.jsp" />
    </div>


    <div class="modal fade" id="alertMsg">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span style="font-size: 17px; font-weight: 700;">
                            알림
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div style="text-align: center;">
                        <span id="alertMsg-text"
                        style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
                            
                        </span><br>
                    </div>
                    <div style="text-align: center; margin-top: 60px;">
                        <button type="button" class="btn" data-dismiss="modal" 
                        style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                            닫기
                        </button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="../common/scripts.jsp" />
    
    <script>
        
            // 전화번호 정규식
            //let phoneExp = /^01[0179]([0-9]{7,8}$)/;
            let phoneExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;

            // 핸드폰번호 정규식 확인
            $('#userPhone').blur(function(){
                if(!phoneExp.test($(this).val())){
                    $('#checkPhone').text('전화번호를 확인해주세요.');
                    $('#checkPhone').css('color', 'red');
                    $('#userPhone').css('border', '2px solid red');
                    $('#userPhone').focus();
                }else{
                    $('#checkPhone').text('');
                    $('#userPhone').css('border', '1px solid #ced4da');
                    $('#checkUserPhone').attr('value', 'phoneY')
                }
            });

            $('#comPhone').blur(function(){
                if(!phoneExp.test($(this).val())){
                    $('#checkComPhone').text('전화번호를 확인해주세요.');
                    $('#checkComPhone').css('color', 'red');
                    $('#comPhone').css('border', '2px solid red');
                    $('#comPhone').focus();
                }else{
                    $('#checkComPhone').text('');
                    $('#comPhone').css('border', '1px solid #ced4da');
                    $('#checkComPhone').attr('value', 'comPhoneY')
                }
            })

            // select 선택
            $('#deptName').val('${loginUser.deptNo}').prop("selected", true);
        
        

        $('#btn-FormSubmit').click(function(){
            console.log('버튼클릭됨')
            if($('#userName').val() != '' && $('#userPhone').val() != '' && $('#comName').val() != '' && $('#comPhone').val() != ''){
                $('#updateAdminForm').submit();
            }else{
                console.log("else실행됨");
                if($('#userName').val() == ''){
                    //alert('이름을 입력해주세요');
                    $('#alertMsg-text').text('이름을 입력해주세요');
                    $('#alertMsg').modal('show');
                    $(this).focus();
                }
                if($('#userPhone').val() == '' && $('#checkPhone').val() == 'phoneN'){
                    //alert('전화번호를 확인해주세요');
                    $('#alertMsg-text').text('전화번호를 확인해주세요');
                    $('#alertMsg').modal('show');
                    $(this).focus();
                }
                if($('#comName').val() == ''){
                    //alert('회사이름을 입력해주세요');
                    $('#alertMsg-text').text('회사이름을 입력해주세요');
                    $('#alertMsg').modal('show');
                    $(this).focus();
                }
                if($('#comPhone').val() == '' && $('#checkComPhone').val() == 'phoneN'){
                    //alert('회사전화번호를 확인해주세요');
                    $('#alertMsg-text').text('회사전화번호를 확인해주세요');
                    $('#alertMsg').modal('show');
                    $('#comPhone').focus();
                }
            }
        })

        // 프로필 이미지 미리보기
        $('#file').on('change', function(){
            if(this.files.length == 1){
                var reader = new FileReader();
                reader.readAsDataURL(this.files[0]);
                reader.onload = function(e){
                    $('#profileImg-img').attr('src', e.target.result);
                }
            }else{
                $('#profileImg-img').attr('src', null);
            }
        })

        // 테스트
        console.log('${deptlist}')
    </script>
</body>
</html>