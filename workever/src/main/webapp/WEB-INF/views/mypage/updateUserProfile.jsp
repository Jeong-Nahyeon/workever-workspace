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
        bottom: 70px;
        right: 280px;
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
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        
        <div class="mypage-title">
            <span>계정 관리</span>
            <div id="btn-title">
                <button>저장하기</button>
            </div>
        </div>

        <div class="mypage-content">
            <div class="card">
                <div class="card-body row">
                    <div class="col-6 text-center d-flex align-items-center justify-content-center">
                        <div class="profile-image">
                            <i class="fas fa-user-circle fa-10x"></i>
                            <a href="" class="btn btn-light" id="btn-selectphoto">
                                <i class="fas fa-camera-retro fa-lg"></i>
                            </a>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="mypage-group">
                            <label for="inputName">이메일</label>
                            <input type="email" id="inputEmail" class="form-control" />
                        </div>
                        <div class="mypage-group">
                            <label for="inputEmail">이름</label>
                            <input type="text" id="inputName" class="form-control" />
                        </div>
                        <div class="mypage-group">
                            <label for="inputSubject">전화번호</label>
                            <input type="number" id="inputSubject" class="form-control" />
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
    
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>