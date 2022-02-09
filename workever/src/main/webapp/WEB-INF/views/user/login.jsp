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
    #login-outer{height: 770px;}
    .login-area{
        margin: auto;
        width: 500px;
        position: absolute;
        top: 50%; left: 50%;
        transform: translate(-50%, -50%);
    }
    .card{
        background-color: rgb(247, 244, 244);
    }

    .btn-login{
        text-align: center;
        margin-top: 70px; margin-bottom: 20px;
    }
    .btn-login button{
        width: 150px; height: 35px;
		border: none;
		background-color: rgb(78, 115, 223);
		color: white; font-weight: bold;
		border-radius: 3%;
    }

    .change-pwd{
        text-align: center;
        margin-bottom: 10px;
    }
    .change-pwd a{
        text-decoration: none;
        font-size: 13px;
        color: black;
    }
</style>
</head>
<body>
    <jsp:include page="startHeader.jsp"></jsp:include>

    <div id="login-outer">
        <div class="login-area">
            <div id="login-title">
                <h4 style="font-weight: 600;">안녕하세요!</h4>
            </div>
    
            <div class="card card-light">
                <form action="">
    
                    <div class="card-body">
                        <div class="form-group">
                            <label for="exampleInputEmail1">이메일</label>
                            <input type="email" class="form-control" id="user-email" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">비밀번호</label>
                            <input type="password" class="form-control" id="user-pwd" placeholder="Password">
                        </div>
                        <div class="btn-login">
                            <button>로그인</button>
                        </div>
                        <div class="change-pwd">
                            <a href="">비밀번호 재설정</a>
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