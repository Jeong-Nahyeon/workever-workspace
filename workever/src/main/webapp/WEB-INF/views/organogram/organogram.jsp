<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />

<style>
    div{box-sizing: border-box;}
    .content-wrapper{overflow: hidden; position: relative;}
    .content-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }
    .content-title span{
        font-size: 25px;
        font-weight: 600;
    }

    .organogram-content{
        margin-left: 100px; 
        margin-right: 100px;
        text-align: center;
    }

    /* 부서명 영역 */
    .dept-name{
        margin: 20px 0 20px 20px;
        text-align: left;
    }
    .dept-name a{
        text-decoration: none;
        color: rgb(51, 51, 51);
    }

    .dept-name span{
        margin-left: 20px;
        font-size: 17px;
        font-weight: 500;
    }

    /* 사원 영역 */
    .card-title{font-weight: 800;}
    .dept-user{
        display: table; width: 100%;
        border-bottom: 1px solid lightgray;
        margin-bottom: 20px;
        padding-bottom: 20px; padding-top: 10px;
        text-align: left;
    }
    .user-img{
        display: inline-block;
        margin: 0 30px;
    }
    .user-rank, .user-name, .user-email{
        display: table-cell;
        vertical-align: middle;
    }
    .user-rank{font-weight: 700;}
    .user-email{
        text-align: right;
        padding-right: 20px;
    }

    /* 관리자 버튼 */
    .dept-plus{text-align: right; margin-right: 7px;}
    .dept-plus a{color: rgb(51, 51, 51);}
    .dept-plus span{margin-right: 20px; font-weight: 800;}

    .dept-update{
        float: right;
        background-color: white;
        border: none;
    }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/sidebar.jsp" />

    <div class="content-wrapper">
        <div class="content-title">
            <span>조직도</span>
        </div>

        <div class="organogram-content">
            <div class="row">
                
                <div class="col-sm-4">
                    <div class="card">
                        <div class="card-body">

                            <!-- 관리자 -->
                            <div class="dept-plus">
                                <a href="">
                                    <span>부서 추가</span>
                                    <i class="fas fa-plus"></i>
                                </a>
                            </div>
                            <!-- 관리자 -->

                            <div class="dept-name">
                                <a href="">
                                    <i class="fas fa-angle-double-right"></i>
                                    <span>전체사원</span>
                                </a>
                            </div>

                            <c:forEach var="d" items="${deptList}">
                                <div class="dept-name">
                                    <a href="">
                                        <i class="fas fa-angle-double-right"></i>
                                        <span>${d.deptName}</span>
                                    </a>
    
                                    <!-- 관리자 -->
                                    <button class="dept-update">
                                        <i class="fas fa-cog"></i>
                                    </button>
                                    <!-- 관리자 -->
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
    
                <div class="col-sm-8">
                    <div class="card">
                        <div class="card-header">
                            <span class="card-title">마케팅팀</span>
                            <div class="card-tools">
                                <span>총 인원 : 4명</span>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="dept-user">
                                <div class="user-img">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div> 
                                <span class="user-rank">팀장</span>
                                <span class="user-name">김영미</span>
                                <span class="user-email">aaa@gmail.com</span>
                            </div>
                            <div class="dept-user">
                                <div class="user-img">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div> 
                                <span class="user-rank">팀장</span>
                                <span class="user-name">김영미</span>
                                <span class="user-email">aaa@gmail.com</span>
                            </div>
                            <div class="dept-user">
                                <div class="user-img">
                                    <i class="fas fa-user-circle fa-3x"></i>
                                </div> 
                                <span class="user-rank">팀장</span>
                                <span class="user-name">김영미</span>
                                <span class="user-email">aaa@gmail.com</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
        
    </div>
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>