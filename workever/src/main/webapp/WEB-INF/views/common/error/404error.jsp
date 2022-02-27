<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../links.jsp" />

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

    .content-wrapper{
        background-color: white;
    }
    .error-text{
        font-size: 13px;
    }

    .error-btn{
        margin-top: 30px;
        width: 300px;
    }

    .error-notlogin{
        margin-top: 100px;
        height: 670px;
    }
</style>
</head>
<body>
    <c:choose>
        <c:when test="${not empty loginUser}">
            <jsp:include page="../header.jsp" />
	        <jsp:include page="../sidebar.jsp" />
            <div class="content-wrapper">
                <div class="content-area">
                    
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <div class="container-fluid">
                            <div class="row mb-2">
                                <div class="col-sm-6">
                                    <h1>404 Error</h1>
                                </div>
                                <div class="col-sm-6">
                                    <ol class="breadcrumb float-sm-right">
                                        <li class="breadcrumb-item"><a href="main.do">Home</a></li>
                                        <li class="breadcrumb-item active">404 Error</li>
                                    </ol>
                                </div>
                            </div>
                        </div><!-- /.container-fluid -->
                    </section>
        
                    <!-- Main content -->
                    <section class="content">
                        <div class="error-page">
                            <h1 class="headline text-warning"> 404</h1>
        
                            <div class="error-content">
                                <h5><i class="fas fa-exclamation-triangle text-warning"></i>페이지를 찾을 수 없습니다.</h5>
        
                                <span class="error-text">죄송합니다. 찾을 수 없는 페이지 입니다.</span><br>
                                <span class="error-text">존재하지 않는 주소를 입력하셨거나, </span><br>
                                <span class="error-text">요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</span>
        
                                <div class="error-btn">
                                    <button type="button" onclick="location.href='main.do'" class="btn btn-block btn-outline-warning">
                                        메인으로
                                    </button>
                                </div>
                            </div>
                            <!-- /.error-content -->
                        </div>
                        <!-- /.error-page -->
                    </section>
                    <!-- /.content -->
                </div>
            </div>
        </c:when>
        <c:otherwise>
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

            <section class="content error-notlogin">
                <div class="error-page">
                    <h1 class="headline text-warning"> 404</h1>

                    <div class="error-content">
                        <h5><i class="fas fa-exclamation-triangle text-warning"></i>페이지를 찾을 수 없습니다.</h5>

                        <span class="error-text">죄송합니다. 찾을 수 없는 페이지 입니다.</span><br>
                        <span class="error-text">존재하지 않는 주소를 입력하셨거나, </span><br>
                        <span class="error-text">요청하신 페이지의 주소가 변경, 삭제되어 찾을 수 없습니다.</span>

                        <div class="error-btn">
                        
                            <button type="button" onclick="location.href='<%=request.getContextPath()%>'"
                                class="btn btn-block btn-outline-warning">
                                메인으로
                            </button>
                        
                        </div>
                    </div>
                    <!-- /.error-content -->
                </div>
                <!-- /.error-page -->
            </section>
            <jsp:include page="../../user/startFooter.jsp"></jsp:include>
        </c:otherwise>
    </c:choose>
    
</body>
</html>