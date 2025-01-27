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
    .mypage-content{margin: 50px 100px;}
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
        bottom: 50px;
        right: 270px;
        border-radius: 90px;
        border: 1px solid gray;
        padding: 0; padding-top: 7px;
        text-align: center;
    }

    .company-infomation{
        width: 800px;
        float: right;
    }
    .company-infomation label{width: 200px;}

    .mypage-group{
        margin: 20px;
    }

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
            <form action="update.us" id="updateUserForm" enctype="multipart/form-data" method="post">
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
                                                <input type="file" name="upfile" id="file">
                                            </label>
                                            <!--</a>-->
                                        </c:when>
                                        <c:otherwise>
                                            <a href="#" download="">
                                                <img src="${loginUser.userFilePath}" alt="" id="profileImg-img">
                                            </a>
                                            <label for="file" class="btn btn-light" id="btn-selectphoto">
                                                <i class="fas fa-camera-retro fa-lg"></i>
                                                <input type="file" name="upfile" id="file">
                                                <input type="hidden" name="userFilePath" value="${loginUser.userFilePath}">
                                            </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div class="col-5">
                                <div class="mypage-group">
                                    <label for="inputName">이메일</label>
                                    <input type="email" id="userEmail" name="userEmail" class="form-control" value="${loginUser.userEmail}" readonly/>
                                </div>
                                <div class="mypage-group">
                                    <label for="inputEmail">이름</label>
                                    <input type="text" id="userName" name="userName" class="form-control" value="${loginUser.userName}"/>
                                </div>
                                <div class="mypage-group">
                                    <label for="inputSubject">전화번호</label>
                                    <input type="text" id="userPhone" name="userPhone" class="form-control" value="${loginUser.userPhone}"/>
                                    <input type="hidden" id="checkPhone" value="phoneN" /> 
                                    <div id="checkPhone">
    
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



    <!-- 알림 모달 -->
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
                        <span id="alertMsg"
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
		// 휴대폰번호 정규식
		let phoneExp = /^01[0179]([0-9]{7,8}$)/;

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
                $('#checkPhone').attr('value', 'phoneY')
			}
		})

        $('#btn-FormSubmit').click(function(){
            if($('#userName').val() != '' && $('#checkPhone').val() == 'phoneY'){
                $('#updateUserForm').submit();
            }else{
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
                    $('#userPhone').focus();
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
    </script>
</body>
</html>