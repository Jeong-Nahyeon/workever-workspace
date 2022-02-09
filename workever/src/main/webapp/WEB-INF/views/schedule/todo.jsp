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
    }
    .todo1, .todo2, .todo3{height: 1000px;}
    .todo-header{
        background-color: rgb(78, 115, 223);
        color: white;
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
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <jsp:include page="../common/sidebar.jsp" />

    <div class="content-wrapper kanban">
        <div class="content-title">
            <span>ToDo</span>
            <span style="margin-left: 20px; font-size: 15px">2022년 01월 22일</span>
        </div>

        <div class="todo-area">
            <div class="card card-row todo1 ml-5 mr-5">
                <div class="card-header todo-header">
                    <h3 class="card-title">
                        해야할 일
                    </h3>
                </div>
                <div class="card-body">
                    <div class="card card-light card-outline">
                        <div class="card-header todoSub-header">
                            <span class="card-title todoSub-title">할 일 목록1</span>
                            <div class="card-tools">
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="" class="btn btn-tool">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </div>
                        </div>
                        <div class="card-body todoSub-memo">
                            <span class="badge badge-pill badge-warning todo-badge">높음</span>
                            <p>
                                할 일 메모입니다.
                            </p>
                        </div>
                    </div>

                    <div class="card card-light card-outline">
                        <div class="card-header todoSub-header">
                            <span class="card-title todoSub-title">할 일 목록1</span>
                            <div class="card-tools">
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="" class="btn btn-tool">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </div>
                        </div>
                        <div class="card-body todoSub-memo">
                            <span class="badge badge-pill badge-warning todo-badge">높음</span>
                            <p>
                                할 일 메모입니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card card-row todo2 ml-5 mr-5">
                <div class="card-header todo-header">
                    <h3 class="card-title">
                        진행중
                    </h3>
                </div>
                <div class="card-body">
                    <div class="card card-light card-outline">
                        <div class="card-header todoSub-header">
                            <span class="card-title todoSub-title">할 일 목록1</span>
                            <div class="card-tools">
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="" class="btn btn-tool">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </div>
                        </div>
                        <div class="card-body todoSub-memo">
                            <span class="badge badge-pill badge-warning todo-badge">높음</span>
                            <p>
                                할 일 메모입니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card card-row todo3 ml-5 mr-5">
                <div class="card-header todo-header">
                    <h3 class="card-title">
                        완료
                    </h3>
                </div>
                <div class="card-body">
                    <div class="card card-light card-outline">
                        <div class="card-header todoSub-header">
                            <span class="card-title todoSub-title">할 일 목록1</span>
                            <div class="card-tools">
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-check"></i>
                                </a>
                                <a href="#" class="btn btn-tool">
                                    <i class="fas fa-pencil-alt"></i>
                                </a>
                                <a href="" class="btn btn-tool">
                                    <i class="fas fa-trash-alt"></i>
                                </a>
                            </div>
                        </div>
                        <div class="card-body todoSub-memo">
                            <span class="badge badge-pill badge-warning todo-badge">높음</span>
                            <p>
                                할 일 메모입니다.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>