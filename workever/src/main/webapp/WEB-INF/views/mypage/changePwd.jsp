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
    .changepwd-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }

    /* 마이페이지 제목, 저장버튼*/
    .changepwd-title span{
        font-size: 25px;
        font-weight: 600;
    }

    .changepwd-area{
        margin: 50px 150px;
    }
    .form-group input[type="submit"]{
        background-color: rgb(78, 115, 223);
        border: none;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
	<jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        <div class="changepwd-title">
            <span>비밀번호 설정</span>
        </div>

        <div class="changepwd-area">
            <div class="card">
                <div class="card-body row">
                    <div class="col-6 text-center d-flex align-items-center justify-content-center">
                        <div class="changepwd-sub">
                            <span>
                                비밀번호를 <strong>재설정</strong> 할 수 있습니다.
                            </span><br>
                            <span>
                                비밀번호는 영어, 숫자, 특수문자 포함 8자리 이상이어야 합니다.
                            </span>
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="form-group">
                            <label for="inputName">현재 비밀번호</label>
                            <input type="password" id="inputName" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">새 비밀번호</label>
                            <input type="password" id="inputEmail" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="inputSubject">새 비밀번호 확인</label>
                            <input type="password" id="inputSubject" class="form-control" />
                        </div>
                        <div class="form-group" style="float: right;">
                            <input type="submit" class="btn btn-primary" value="변경하기">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>