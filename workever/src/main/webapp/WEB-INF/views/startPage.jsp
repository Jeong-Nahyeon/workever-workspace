<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Workever</title>
<jsp:include page="common/links.jsp" />

<style>
    /* 헤더스타일 */
    body{margin: 0;}
    div{box-sizing: border-box;}
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

    /*본문스타일*/
    .start-content{
        overflow: hidden;
        height: 100%;
    }
    #start-img img{
        width: 100%;
        height: 230px;
    }
    #start-text{margin-top: 40px;}

    #start-enroll{margin-top: 120px; margin-bottom: 100px;}
    #enroll-company{
        text-align: center;
        float: left;
        width: 50%;
        padding-left: 300px;
        /*margin-left: 100px;*/
    }
    #enroll-user{
        text-align: center;
        float: right;
        width: 50%;
        padding-right: 300px;
        margin-bottom: 160px;
        /*margin-right: 100px;*/
    }
    #enroll-company a, #enroll-user a{
        color: black;
        text-decoration: none;
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
            <button onclick="location.href='login.do'">로그인</button>
        </div>
    </div>

	<div class="start-content">
        <div id="start-img">
            <img src="resources/images/startImage.jpg" alt="">
        </div>

        <div id="start-text">
            <span style="font-size: 25px; font-weight: bold; padding-bottom: 20px; margin-left: 550px;">
                누구나 간편하게 사용할 수 있는 그룹웨어
            </span><br><br>
            <span style="font-size: 35px; font-weight: bold; color:rgb(78, 115, 223); margin-left: 900px;">
                Workever
            </span>
            <span style="font-size: 30px; font-weight: bold;">와 시작하세요!</span>
        </div>

        <div id="start-enroll">
            <div id="enroll-company">
                <a href="enrollForm.ad">
                    <i class="far fa-building fa-3x"></i><br><br>
                    <span style="font-size: 20px; font-weight: bold;">
                        비즈니스 계정
                    </span><br>
                    <span style="font-size: 15px; font-weight: bold;">
                        Workever 그룹 생성
                    </span>
                </a>
            </div>
            <div id="enroll-user">
                <a href="enrollForm.us">
                    <i class="far fa-user fa-3x"></i><br><br>
                    <span style="font-size: 20px; font-weight: bold;">
                        일반사원 계정
                    </span><br>
                    <span style="font-size: 15px; font-weight: bold;">
                        Workever 계정 생성
                    </span>
                </a>
            </div>
        </div>
    </div>
    
    <jsp:include page="user/startFooter.jsp"></jsp:include>
    <jsp:include page="common/scripts.jsp" />
</body>
</html>