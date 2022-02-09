<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        padding-top: 20px;
        width: 200px; height: 200px;
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

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        
        <div class="mypage-title">
            <span>계정 관리</span>
            <div id="btn-title">
                <button>수정하기</button>
            </div>
        </div>

        <div class="mypage-content">
            <div class="card">
                <div class="card-body row">
                    <div class="col-6 text-center d-flex align-items-center justify-content-center">
                        <div class="profile-image">
                            <i class="fas fa-user-circle fa-10x"></i>
                            
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="form-group mypage-group">
                            <label for="inputName">이메일</label>
                            <span>hong123@gmail.com</span>
                        </div>
                        <div class="form-group mypage-group">
                            <label for="inputEmail">이름</label>
                            <span>홍길동</span>
                        </div>
                        <div class="form-group mypage-group">
                            <label for="inputSubject">전화번호</label>
                            <span>010-2222-3333</span>
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
                            <span class="company-name">Workever</span>
                        </div>
                        <div class="form-group">
                            <label for="inputSubject">부서</label>
                            <span class="company-name">마케팅팀</span>
                        </div>
                        <div class="form-group">
                            <label for="inputSubject">직급</label>
                            <span class="company-name">대리</span>
                        </div>
                        <div class="form-group">
                            <label for="inputSubject">회사연락처</label>
                            <span class="company-name">02-2345-6789</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>