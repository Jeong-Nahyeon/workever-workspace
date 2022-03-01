<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<jsp:include page="startHeader.jsp"></jsp:include>
<jsp:include page="../common/scripts.jsp" />
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
        margin-top: 50px; margin-bottom: 20px;
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
    #loginCheck span{
        color: red;
    }
</style>
</head>
<body>
    
    <c:if test="${not empty alertMvMsg}">
        <script>
            $(function(){
                $('#alertMsg').text('${alertMvMsg}');
                $('#after-email').modal('show');
            })
        </script>
        <c:remove var="alertMvMsg" scope="session" />
    </c:if>
    <!--<span>${alertMvMsg}</span>-->
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

    <div id="login-outer">
        <div class="login-area">
            <div id="login-title">
                <h4 style="font-weight: 600;">안녕하세요!</h4>
            </div>
    
            <div class="card card-light">
                <form action="login.us" method="post">
    
                    <div class="card-body">
                        <div class="form-group">
                            <label for="user-email">이메일</label>
                            <input type="email" class="form-control" id="user-email" name="userEmail" placeholder="Enter email">
                        </div>
                        <div class="form-group">
                            <label for="user-pwd">비밀번호</label>
                            <input type="password" class="form-control" id="user-pwd" name="userPwd" placeholder="Password">
                        </div>
                        <c:if test="${not empty loginMsg}">
                            <div id="loginCheck">
                                <span>
                                    이메일, 비밀번호를 확인해주세요!
                                </span>
                            </div>
                            <c:remove var="loginMsg" scope="request"/>
                        </c:if>
                        <div class="btn-login">
                            <button type="submit">로그인</button>
                        </div>
                        <div class="change-pwd">
                            <a href="findPwd.do">비밀번호 재설정</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="modal fade" id="after-email">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span style="text-align: center; font-size: 17px; font-weight: 700;">
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
    
    <jsp:include page="startFooter.jsp"></jsp:include>
    

    <script>
        $(function(){
            $('#user-email').click(function(){
                $('#loginCheck').hide();
            })
        })
    </script>
</body>
</html>