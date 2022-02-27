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

    #content-area{
        display: table;
        margin: auto;
        height: 765px;
    }
    #content-area div{
        display: table-cell;
        
    }
    #login-icon{
        text-align: right;
        width: 450px;
        padding-top: 200px;
        padding-right: 100px;
    }
    #login-text{
        
        width: 800px; 
        vertical-align: top;
        padding-top: 180px;
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
    <div id="content-area">
        <div id="login-icon">
            <i class="fas fa-exclamation-triangle fa-10x"></i>
        </div>
        <div id="login-text">
            <span style="font-size: 40px; font-weight: bold;">
                아직 가입이 승인되지 않았습니다!
            </span><br><br><br>
            <span style="font-size: 25px; ">
                가입이 승인되지않아 로그인 불가합니다.
            </span><br>
            <span style="font-size: 25px; padding-left: 300px;">
                회사 관리자에게 문의하세요.
            </span>
        </div>
    </div>

    <jsp:include page="startFooter.jsp"></jsp:include>
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>