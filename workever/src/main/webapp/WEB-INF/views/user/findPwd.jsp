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
    /* 헤더스타일 */
    #start-header{
        background-color: rgb(78, 115, 223);
        height: 100px;
        overflow: hidden;
        margin: auto;
    }
    #start-header a{
        color: white;
        text-decoration: none;
        font-size: 40px; font-weight: 600;
    }
    
    #header-font{
        width: 48%;
        padding-left: 80px;
        display: inline-block;
        height: 80px;
        margin-top: 15px;
        /*margin-left: 80px;*/
        /*line-height: 100px;*/
    }
    #header-button{
        width: 48%;
        text-align: right;
        display: inline-block;
    }
    #header-button button{
        width: 100px; height: 30px;
        border: 1px solid white;
        background-color: rgb(78, 115, 223);
        color: white;
    }

    /* 본문스타일 */
    #findpwd-outer{height: 770px;}
    .findpwd-area{
        margin: auto;
        width: 500px;
        position: absolute;
        top: 50%; left: 50%;
        transform: translate(-50%, -50%);
    }

    #findpwd-title{
        margin-bottom: 50px;
        text-align: center;
    }
    #findpwd-title span{
        font-size: 13px;
    }

    .card{
        background-color: rgb(247, 244, 244);
    }

    .btn-findpwd{
        text-align: center;
        margin-top: 70px; margin-bottom: 20px;
    }
    .btn-findpwd button{
        width: 180px; height: 35px;
		border: none;
		background-color: rgb(78, 115, 223);
		color: white; font-weight: bold;
		border-radius: 3%;
        font-size: 14px;
    }
</style>
</head>
<body>
    <div id="start-header">
        <div id="header-font">
            <a href="${pageContext.request.contextPath}">
                <span>Workever</span>
            </a>
        </div>
        
        <div id="header-button">
            <button onclick="location.href='${pageContext.request.contextPath}'">회원가입</button>
        </div>
    </div>

    <div id="findpwd-outer">
        <div class="findpwd-area">
            <div id="findpwd-title">
                <h4 style="font-weight: 600;">비밀번호를 잊으셨나요?</h4>
                <span>가입시 사용한 이메일을 입력하시면 임시 비밀번호가 발송됩니다.</span>
            </div>
    
            <div class="card card-light">
                <form action="">
    
                    <div class="card-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">이름</label>
                            <input type="text" class="form-control" id="user-email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">이메일</label>
                            <input type="email" class="form-control" id="user-pwd" placeholder="Password">
                        </div>
                        <div class="btn-findpwd">
                            <button>임시비밀번호 받기</button>
                        </div>
                    </div>
        
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="startFooter.jsp"></jsp:include>
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>