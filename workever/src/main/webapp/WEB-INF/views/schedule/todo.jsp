<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../common/links.jsp" />
<!-- moment -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
    div{box-sizing: border-box;}
    .content-wrapper{overflow: scroll; position: relative;}
    .content-title{
        overflow: hidden;
        margin: 50px 100px;
        border-bottom: 1px solid lightgray;
    }
    .content-title span{
        font-size: 25px;
        font-weight: 600;
    }

    .todo-area{
        margin-left: 100px;
        margin-right: 100px;
        padding-left: 50px;
        margin-bottom: 50px;
    }
    .todo1, .todo2, .todo3{height: 1000px;}
    .todo-header{
        background-color: rgb(78, 115, 223);
        color: white;
    }
    .todo-header>div{
        width: 50px;
        float: right;
        text-align: right;
    }

    /* 배지 */
    .todo-badge{
		display: inline-block;
		width: 60px;
		color: white; font-size: 11px;
        margin-bottom: 7px;
	}

    /* 할일목록 카드 */
    .todoSub-header{padding-top: 20px;}
    .todoSub-title{
        font-size: 15px; 
    }
    .todoSub-memo p{font-size: 13px;}
    .card-titleE{text-decoration: line-through;}
    #btn-todoAdd{
        color: white ;
        text-align: right;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />

    <div class="content-wrapper kanban">
        <div class="content-title">
            <span>ToDo</span>
            <span style="margin-left: 20px; font-size: 15px">
                ${today}
            </span>
        </div>

        <div class="todo-area">
            <div class="card card-row todo1 ml-5 mr-5">
                <div class="card-header todo-header">
                    <h3 class="card-title">
                        해야할 일
                    </h3>
                    <div >
                        <a href="#" id="btn-todoAdd">
                            <i class="fas fa-plus"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body">
                    <c:forEach var="t" items="${todoList}">
                        <c:if test="${t.todoStatus eq 'S'}">
                            <div class="card card-light card-outline">
                                <div class="card-header todoSub-header">
                                    <input type="hidden" class="todoNo" value="${t.todoNo}">
                                    <input type="hidden" class="todoStatus" value="${t.todoStatus}">
                                    <span class="card-title todoSub-title">${t.todoTitle}</span>
                                    <div class="card-tools">
                                        <a href="#" class="btn btn-tool btn-todoCheck">
                                            <i class="fas fa-check"></i>
                                        </a>
                                        <a href="#" class="btn btn-tool btn-todoUpdate">
                                            <i class="fas fa-pencil-alt"></i>
                                        </a>
                                        <a href="#" class="btn btn-tool btn-todoDelete">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body todoSub-memo">
                                    <c:choose>
                                        <c:when test="${t.todoImp == 'A'}">
                                            <span class="badge badge-pill badge-danger todo-badge">매우높음</span>
                                            <input type="hidden" class="selectImp" value="A">
                                        </c:when>
                                        <c:when test="${t.todoImp == 'B'}">
                                            <span class="badge badge-pill badge-warning todo-badge">높음</span>
                                            <input type="hidden" class="selectImp" value="B">
                                        </c:when>
                                        <c:when test="${t.todoImp == 'C'}">
                                            <span class="badge badge-pill badge-info todo-badge">보통</span>
                                            <input type="hidden" class="selectImp" value="C">
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-pill badge-success todo-badge">낮음</span>
                                            <input type="hidden" class="selectImp" value="D">
                                        </c:otherwise>
                                    </c:choose>
                                    
                                    <c:choose>
                                        <c:when test="${empty t.todoMemo}">
                                            <p class="selectMemo">메모없음</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="selectMemo">${t.todoMemo}</p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>  <!-- 해야할 일 끝 -->

            <div class="card card-row todo2 ml-5 mr-5">
                <div class="card-header todo-header">
                    <h3 class="card-title">
                        진행중
                    </h3>
                </div>
                <div class="card-body">
                    <c:forEach var="t" items="${todoList}">
                        <c:if test="${t.todoStatus eq 'D'}">
                            <div class="card card-light card-outline">
                                <div class="card-header todoSub-header">
                                    <input type="hidden" class="todoNo" value="${t.todoNo}">
                                    <input type="hidden" class="todoStatus" value="${t.todoStatus}">
                                    <span class="card-title todoSub-title">${t.todoTitle}</span>
                                    <div class="card-tools">
                                        <a href="#" class="btn btn-tool btn-todoCheck">
                                            <i class="fas fa-check"></i>
                                        </a>
                                        <a href="#" class="btn btn-tool btn-todoUpdate">
                                            <i class="fas fa-pencil-alt"></i>
                                        </a>
                                        <a href="#" class="btn btn-tool btn-todoDelete">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body todoSub-memo">
                                    <c:choose>
                                        <c:when test="${t.todoImp == 'A'}">
                                            <span class="badge badge-pill badge-danger todo-badge">매우높음</span>
                                            <input type="hidden" class="selectImp" value="A">
                                        </c:when>
                                        <c:when test="${t.todoImp == 'B'}">
                                            <span class="badge badge-pill badge-warning todo-badge">높음</span>
                                            <input type="hidden" class="selectImp" value="B">
                                        </c:when>
                                        <c:when test="${t.todoImp == 'C'}">
                                            <span class="badge badge-pill badge-info todo-badge">보통</span>
                                            <input type="hidden" class="selectImp" value="C">
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-pill badge-success todo-badge">낮음</span>
                                            <input type="hidden" class="selectImp" value="D">
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${empty t.todoMemo}">
                                            <p class="selectMemo">메모없음</p>
                                        </c:when>
                                        <c:otherwise>
                                            <p class="selectMemo">${t.todoMemo}</p>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="card card-row todo3 ml-5 mr-5">
                <div class="card-header todo-header">
                    <h3 class="card-title">
                        완료
                    </h3>
                </div>
                <div class="card-body">
                    <c:forEach var="t" items="${todoList}">
                        <c:if test="${t.todoStatus eq 'E'}">
                            <div class="card card-light card-outline">
                                <div class="card-header todoSub-header">
                                    <input type="hidden" class="todoNo" value="${t.todoNo}">
                                    <input type="hidden" class="todoStatus" value="${t.todoStatus}">
                                    <span class="card-titleE todoSub-title">${t.todoTitle}</span>
                                    <div class="card-tools">
                                        <a href="#" class="btn btn-tool btn-todoDelete">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body todoSub-memo">
                                    <c:choose>
                                        <c:when test="${t.todoImp == 'A'}">
                                            <span class="badge badge-pill badge-danger todo-badge">매우높음</span>
                                        </c:when>
                                        <c:when test="${t.todoImp == 'B'}">
                                            <span class="badge badge-pill badge-warning todo-badge">높음</span>
                                        </c:when>
                                        <c:when test="${t.todoImp == 'C'}">
                                            <span class="badge badge-pill badge-info todo-badge">보통</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-pill badge-success todo-badge">낮음</span>
                                        </c:otherwise>
                                    </c:choose>
                                    <p class="card-titleE">
                                        <c:choose>
                                            <c:when test="${empty t.todoMemo}">
                                                메모없음
                                            </c:when>
                                            <c:otherwise>
                                                ${t.todoMemo}
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!-- todo 등록 모달 -->
    <div class="modal" id="modal-insertTodo">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span id="modal-title"
                        style="text-align: center; font-size: 17px; font-weight: 700;">
                            
                        </span>
                    </div>
                    <button type="button" class="close dismiss">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <form id="todoForm">
                        <input type="hidden" id="formCheck">
                        <input type="hidden" id="todoDate" name="todoDate">
                        <input type="hidden" name="userNo" value="${loginUser.userNo}">
                        <input type="hidden" id="todoNo" name="todoNo" >
                        <div class="form-group">
                            <label for="todoTitle">내용</label>
                            <input type="text" class="form-control" id="todoTitle" name="todoTitle">
                        </div>
                
                        <div class="todoStatus-area" style="margin-top: 30px;">
                            <label>중요도</label><br>
                            <div style="text-align: center;">
                                <label style="margin-right: 25px;">
                                    <input type="radio" name="todoImp" value="A" checked>
                                    <span class="badge badge-pill badge-danger todo-badge" style="width: 70px; color: white;">
                                        매우높음
                                    </span>
                                </label>
                                <label style="margin-right: 25px;">
                                    <input type="radio" name="todoImp" value="B">
                                    <span class="badge badge-pill badge-warning todo-badge" style="width: 70px; color: white;">
                                        높음
                                    </span>
                                </label>
                                <label style="margin-right: 25px;">
                                    <input type="radio" name="todoImp" value="C">
                                    <span class="badge badge-pill badge-info todo-badge" style="width: 70px; color: white;">
                                        보통
                                    </span>
                                </label>
                                <label>
                                    <input type="radio" name="todoImp" value="D">
                                    <span class="badge badge-pill badge-success todo-badge" style="width: 70px; color: white;">
                                        낮음
                                    </span>
                                </label>
                            </div>
                        </div>
                
                        <div class="form-group" style="margin-top: 30px;">
                            <label for="todoMemo">내용</label><br>
                            <textarea name="todoMemo" id="todoMemo" cols="55" rows="3"
                                style="border: 1px solid lightgray; border-radius: 2px;"></textarea>
                        </div>
                
                        <div style="text-align: center;">
                            <button type="button" class="btn" id="btn-submit"
                                style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                                등록
                            </button>
                            <button type="button" class="btn btn-secondary dismiss" style="width: 90px; margin-left: 60px;">
                                취소
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- todo 삭제 모달 -->
    <div class="modal fade" id="modal-deleteTodo">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span style="text-align: center; font-size: 17px; font-weight: 700;">
                            To Do 삭제
                        </span>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div style="text-align: center;">
                        <span style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
                            등록하신 ToDo를 삭제하시겠습니까?
                        </span><br>
                        <span style="font-size: 13px; display: inline-block; margin: 10px 0 40px 0;">
                            삭제한 ToDo 목록은 복구할 수 없습니다.
                        </span><br>
                    </div>
                    <div style="text-align: center;">
                        <input type="hidden" name="todoNo" id="deleteTodoNo">
                        <button type="button" class="btn btn-danger" id="btn-delete"
                        style="width: 90px; color: white;">
                            삭제
                        </button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" 
                        style="width: 90px; margin-left: 60px;">
                            취소
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 삭제 후-->
    <div class="modal fade" id="after-tododel">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <div style="width: 100%; text-align: center;">
                        <span style="text-align: center; font-size: 17px; font-weight: 700;">
                            ToDo 삭제
                        </span>
                    </div>
                    <button type="button" class="close after-delete">
                        &times;
                    </button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div style="text-align: center;">
                        <span style="font-size: 15px; font-weight: 600; display: inline-block; margin-top: 20px;">
                            등록한 To Do가 삭제되었습니다.
                        </span><br>
                    </div>
                    <div style="text-align: center; margin-top: 60px;">
                        <button type="button" class="btn after-delete" 
                        style="width: 90px; background-color: rgb(78, 115, 223); color: white;">
                            닫기
                        </button>
                    </div>
                    
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
        console.log('${todoList}')

        $(function(){

            // 모달 닫기
            $('.dismiss').on("click", function(){
                $('#modal-insertTodo').modal('hide');
            })

            // todo 등록 모달 열기
            $('#btn-todoAdd').click(function(){
                $('#modal-title').text('To Do 등록');
                $('#formCheck').val('insert');
                $('#todoDate').val(moment().format('YY/MM/DD'));

                $('#modal-insertTodo').modal({backdrop: 'static', keyboard: false});
            });

            // todo 등록, 수정 submit
            $('#btn-submit').click(function(){
                if($('#todoTitle').val() == ''){
                    $('#alertMsg-text').text('내용을 입력하세요.');
                    $('#alertMsg').modal('show');
                    $('#todoTitle').css('border', '2px solid red');
                }else{
                    if($('#formCheck').val() == 'insert'){
                        $('#todoForm').attr('action', 'insertTodo.do').submit();
                    }else{
                        $('#todoForm').attr('action', 'updateTodo.do').submit();
                    }
                }
            })

            // todo check
            $('.btn-todoCheck').click(function(){
                var todoNo = $(this).parent().parent().children('.todoNo').val();
                var todoStatus = $(this).parent().parent().children('.todoStatus').val();
                console.log(todoStatus)
                $.ajax({
                    url:"todoCheck.do",
                    data:{
                        todoNo:todoNo,
                        todoStatus:todoStatus
                    },
                    success:function(result){
                        console.log(result)
                        //$('.todo-area').load(location.href + ' .todo-area');
                        location.reload();
                    },error:function(){

                    }
                })
            })

            // todo update (모달 열기)
            $(".btn-todoUpdate").click(function(){
                var todoImp = $(this).parent().parent().siblings().children(".selectImp").val();
                console.log(todoImp)

                $('#modal-title').text('To Do 수정');
                $('#formCheck').val('update');
                $('#todoDate').val(moment().format('YY/MM/DD'));

                $('#todoNo').val($(this).parent().siblings('.todoNo').val())
                $('#todoTitle').val($(this).parent().siblings('.todoSub-title').text());
                $('input:radio[name=todoImp][value="'+todoImp+'"]').attr('checked', true);
                $('#todoMemo').val($(this).parent().parent().siblings().children(".selectMemo").text());

                $('#modal-insertTodo').modal({backdrop: 'static', keyboard: false});
            })


            // todo 삭제 모달
            $(".btn-todoDelete").click(function(){
                var todoId = $(this).parent().siblings(".todoNo").val()

                $('#deleteTodoNo').val(todoId);
                $('#modal-deleteTodo').modal({backdrop: 'static', keyboard: false});
            })

            $("#btn-delete").click(function(){
                $.ajax({
                    url:"deleteTodo.do",
                    data:{
                        todoNo : $('#deleteTodoNo').val()
                    }, success:function(result){
                        if(result == 'NNNNY'){
                            $('#modal-deleteTodo').modal('hide');
                            $('#after-tododel').modal({backdrop: 'static', keyboard: false});
                        }else{
                            $('#alertMsg-text').text('todo 삭제 실패');
                            $('#alertMsg').modal('show');
                        }
                    }, error:function(){
                        console.log("todo 삭제 ajax 통신 실패");
                    }
                })
            });

            $(".after-delete").click(function(){
                $('#after-tododel').modal('hide');
                location.reload();
            })
        })
    </script>
</body>
</html>