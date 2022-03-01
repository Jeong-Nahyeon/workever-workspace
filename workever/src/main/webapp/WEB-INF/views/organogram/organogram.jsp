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
    .pagination a{color: rgb(51, 51, 51);}

    /* 부서명 영역 */
    .dept-name{
        margin: 20px 0 20px 20px;
        text-align: left;
    }
    .dept-name a{
        text-decoration: none;
        color: gray;
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
        border-radius: 70%;
        overflow: hidden;
        color: gray;
    }
    .user-img img{
        width: 47px; height: 47px;
        object-fit: cover;
    }
    .user-rank, .user-name, .user-email{
        display: table-cell;
        vertical-align: middle;
        width: 200px;
    }
    .user-rank{font-weight: 700; width: 250px;}
    .user-name{width: 200px;}
    .user-email{
        text-align: left;
        padding-right: 20px;
    }

    /* 관리자 버튼 */
    .dept-plus{text-align: right; margin-right: 7px;}
    .dept-plus a{color: rgb(51, 51, 51);}
    .dept-plus span{margin-right: 20px; font-weight: 800;}

    .btn-deptUp{
        float: right;
        background-color: white;
        border: none;
        color: gray;
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
                        <div class="card-header">
                            <c:choose>
                                <c:when test="${loginUser.userAuth eq 'A'}">
                                    <div class="dept-plus">
                                        <a href="#" id="addDept">
                                            <span>부서 추가</span>
                                            <i class="fas fa-plus"></i>
                                        </a>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-title">
                                        <span>부서 목록</span>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="card-body">
                            <div class="dept-name">
                                <a href="organogram.do">
                                    <i class="fas fa-angle-double-right"></i>
                                    <span>전체사원</span>
                                </a>
                            </div>

                            <c:forEach var="d" items="${deptList}">
                                <div class="dept-name">
                                    <input type="hidden" class="deptNo" value="${d.deptNo}">
                                    <input type="hidden" class="userCount" value="${d.userCount}">
                                    <a href="organogram.do?dept=${d.deptNo}">
                                        <i class="fas fa-angle-double-right"></i>
                                        <span class="dept-title">${d.deptName}</span>
                                    </a>
    
                                    <c:if test="${loginUser.userAuth eq 'A'}">
                                        <button class="btn-deptUp dept-delete">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                        <button class="btn-deptUp dept-update">
                                            <i class="fas fa-cog"></i>&nbsp;&nbsp;&nbsp;
                                        </button>
                                    </c:if>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                </div>
    
                <div class="col-sm-8">
                    <div class="card">
                        
                            <div class="card-header">
                                <c:choose>
                                    <c:when test="${loginUser.orgCategory eq '0'}">
                                        <span class="card-title">전체사원</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="card-title card-deptName"></span>
                                    </c:otherwise>
                                </c:choose>
                                <div class="card-tools">
                                    <span>총 인원 : ${pi.listCount}명</span>
                                    
                                </div>
                            </div>
                            <div class="card-body user-content">
                                <c:forEach var="u" items="${userList}">
                                    <input type="hidden" id="setDeptName" value="${u.deptName}">
                                    <div class="dept-user">
                                        <div class="user-img">
                                            <c:choose>
                                                <c:when test="${empty u.userFilePath}">
                                                    <i class="fas fa-user-circle fa-3x"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="${u.userFilePath}" alt="">
                                                </c:otherwise>
                                            </c:choose>
                                        </div> 
                                        <div class="user-rank">
                                            <span>${u.userRank}</span>
                                        </div>
                                        <div class="user-name">
                                            <span>${u.userName}</span>
                                        </div>
                                        <div class="user-email">
                                            <span>${u.userEmail}</span>
                                        </div>
                                        
                                    </div>
                                </c:forEach>
                            <!-- 페이징 -->
                            <div class="card-sub" style="margin-top: 80px;">
                                <ul class="pagination pagination-sm justify-content-center">
                                    <c:choose>
                                        <c:when test="${ pi.currentPage eq 1 }">
                                            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="organogram.do?dept=${loginUser.orgCategory}&opage=${pi.currentPage - 1}">&laquo;</a></li>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                        <li class="page-item"><a class="page-link" href="organogram.do?dept=${loginUser.orgCategory}&opage=${p}">${p}</a></li>
                                    </c:forEach>

                                    <c:choose>
                                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                                            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link" href="organogram.do?dept=${loginUser.orgCategory}&opage=${pi.currentPage + 1}">&raquo;</a></li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        
    </div>

    <!-- 부서 추가 모달 -->
    <div class="modal" id="add-dept">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="margin-left:195px;">
                        <span style="text-align: center; font-size: 17px; font-weight: 700;" id="dept-modalTitle">
                            부서 추가
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="" id="addDeptForm">
                        <input type="hidden" id="addDeptFormCheck">
                        <input type="hidden" name="comNo" value="${loginUser.comNo}">
                        <input type="hidden" id="input-deptNo" name="deptNo">
                        <div style="text-align: center;margin-top: 20px;">
                            <label for="" style="margin-right: 10px; font-size: 15px; font-weight: 700;">
                                부서명
                            </label>
                            <input type="text" name="deptName" id="add-deptName" style="border: none; border-bottom: 1px solid gray;">
                        </div>
                        <div style="text-align: center; margin-top: 60px;">
                            <button type="button" class="btn" id="btn-addDept"
                            style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                                등록
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" 
                            style="width: 90px; margin-left: 60px;">
                                취소
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 부서 삭제 모달 -->
    <div class="modal fade" id="delete-dept">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="margin-left:195px;">
                        <span style="text-align: center; font-size: 17px; font-weight: 700;">
                            부서 삭제
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form action="deleteDept.do">
                        <input type="hidden" name="deptNo" id="deleteDeptNo">
                        <input type="hidden" name="comNo" value="${loginUser.comNo}">
                        <div style="text-align: center;">
                            <span style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
                                해당 부서를 삭제하시겠습니까?
                            </span><br>
                            <span style="font-size: 13px; display: inline-block; margin: 10px 0 40px 0;">
                                삭제 후에는 복구할 수 없습니다.
                            </span><br>
                        </div>
                        <div style="text-align: center;">
                            <button type="submit" class="btn btn-danger"
                            style="width: 90px; color: white;">
                                삭제
                            </button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" 
                            style="width: 90px; margin-left: 60px;">
                                취소
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- 알림 모달 -->
    <div class="modal fade" id="alertMsg">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span style="font-size: 17px; font-weight: 700;">
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
                        <span id="alertMsg-text"
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

    <jsp:include page="../common/scripts.jsp" />

    <c:if test="${not empty alertMvMsg}">
        <script>
            $(function(){
                $('#alertMsg-text').text('${alertMvMsg}');
                $('#alertMsg').modal('show');
            })
        </script>
        <c:remove var="alertMvMsg" scope="session" />
    </c:if>

    <script>
        $(function(){
            $('.card-deptName').text($('#setDeptName').val());
        })
        $('#addDept').click(function(){
            $('#addDeptFormCheck').val('insert');
            $('#dept-modalTitle').text('부서 추가');
            $('#add-dept').modal();
        })

        $('#btn-addDept').click(function(){
            if($('#add-deptName').val() == ''){
                $('#add-deptName').css('border', '2px solid red');
            }else{
                if($('#addDeptFormCheck').val() == 'insert'){
                    $('#addDeptForm').attr('action','addDept.do').submit();
                }else{
                    $('#addDeptForm').attr('action','updateDept.do').submit();
                }
            }
        })

        $('.dept-update').click(function(){
            $('#dept-modalTitle').text('부서 수정');
            $('#add-deptName').val($(this).siblings().children(".dept-title").text());
            $('#input-deptNo').val($(this).siblings('.deptNo').val());
            $('#addDeptFormCheck').val('update');
            $('#add-dept').modal();
        })

        $('.dept-delete').click(function(){
            var userCount = $(this).siblings('.userCount').val();

            if(userCount == 0){
                $('#deleteDeptNo').val($(this).siblings('.deptNo').val());
                $('#delete-dept').modal();
            }else{
                $('#alertMsg-text').text('사원이 존재하는 부서는 삭제할 수 없습니다.');
                $('#alertMsg').modal('show');
            }
        })
    </script>
</body>
</html>