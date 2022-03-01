<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<jsp:include page="../common/scripts.jsp" />
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
    .btn-title{
        float: right;
    }
    .btn-title button{
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
        bottom: 30px;
        right: 290px;
        border-radius: 90px;
        border: 1px solid gray;
        padding: 0; padding-top: 7px;
        text-align: center;
    }
    .mypage-group{
        margin: 30px 0 30px 10px;
    }
    .mypage-group label{
        width: 200px;
    }

    .company-infomation{
        width: 800px;
        float: right;
    }
    .company-infomation label{width: 200px;}
</style>
</head>
<body>

    <c:if test="${not empty alertMvMsg}">
        <script>
            $(function(){
                $('#alertMsg-text').text('${alertMvMsg}');
                $('#alertMsg').modal('show');
            })
        </script>
        <c:remove var="alertMvMsg" scope="session" />
    </c:if>

    <div class="wrapper">
        <jsp:include page="../common/header.jsp" />
	    <jsp:include page="mypageSidebar.jsp" />

        <div class="content-wrapper">
        
            <div class="mypage-title">
                <span>계정 관리</span>
                <c:choose>
                    <c:when test="${loginUser.userAuth == 'A'}">
                        <div class="btn-title">
                            <button onclick="location.href='updateForm.ad'">수정하기</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btn-title">
                            <button onclick="location.href='updateForm.us'">수정하기</button>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
    
            <div class="mypage-content">
                <div class="card">
                    <div class="card-body row">
                        <div class="col-6 text-center d-flex align-items-center justify-content-center">
                            <div class="profile-image">
                                <c:choose>
                                    <c:when test="${empty loginUser.userFilePath}">
                                        <i class="fas fa-user-circle fa-10x"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${loginUser.userFilePath}" alt="">
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="form-group mypage-group">
                                <label for="inputName">이메일</label>
                                <span>${ loginUser.userEmail }</span>
                            </div>
                            <div class="form-group mypage-group">
                                <label for="inputEmail">이름</label>
                                <span>${ loginUser.userName }</span>
                            </div>
                            <div class="form-group mypage-group">
                                <label for="inputSubject">전화번호</label>
                                <span>${ loginUser.userPhone }</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card company-infomation">
                    <div class="card-body row">
                        <div class="col-1"></div>
                        <div class="col-7">
                            <div>&nbsp;</div>
                            <div class="form-group">
                                <label for="inputSubject">회사명</label>
                                <span class="company-name">${ loginUser.comName }</span>
                            </div>
                            <div class="form-group">
                                <label for="inputSubject">부서</label>
                                <span class="company-name">${ loginUser.deptName }</span>
                            </div>
                            <div class="form-group">
                                <label for="inputSubject">직급</label>
                                <span class="company-name">${ loginUser.userRank }</span>
                            </div>
                            <div class="form-group">
                                <label for="inputSubject">회사연락처</label>
                                <span class="company-name">${ loginUser.comPhone }</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    
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
    
</body>
</html>