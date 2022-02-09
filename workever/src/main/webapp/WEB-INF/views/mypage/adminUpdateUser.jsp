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

    .card{
        margin-left: 100px; margin-right: 100px;
    }
    .table{
        text-align: center;
    }
    
    .card-sub{
        width: 500px;
        margin: auto;
        text-align: center;
    }
    .card-footer ul{
        margin-bottom: 0;
    }

    .select2{
        width: 100px;
        border: 1px solid lightgray;
        border-radius: 1px;
        margin-right: 10px;
    }
    .card-header{overflow: hidden;}
    .card-tools{float: left !important; }
</style>
</head>
<body>

    <jsp:include page="../common/header.jsp" />
    <jsp:include page="mypageSidebar.jsp" />

    <div class="content-wrapper">
        <div class="content-title">
            <span>사원 정보</span>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="card-tools">
                    <div></div>
                    <div class="input-group input-group-sm" style="width: 300px;">
                        <select class="select2" name="" id="">
                            <option value="">사원명</option>
                            <option value="">부서</option>
                            <option value="">직급</option>
                        </select>
                        <input type="text" name="table_search" class="form-control float-right" placeholder="Search">
                        <div class="input-group-append">
                            <button type="submit" class="btn btn-default">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card-body p-0">
                <table class="table">
                    <thead>
                        <tr>
                            <th style="width: 10px">
                                <input type="checkbox" name="" id="">
                            </th>
                            <th>사원명</th>
                            <th>부서</th>
                            <th>직급</th>
                            <th style="width: 100px">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>홍길동</td>
                            <td>인사팀</td>
                            <td>사원</td>
                            <td>
                                <a href="">재직</a>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>홍길동</td>
                            <td>인사팀</td>
                            <td>사원</td>
                            <td>
                                <a href="">재직</a>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>홍길동</td>
                            <td>인사팀</td>
                            <td>사원</td>
                            <td>
                                <a href="">재직</a>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="" id=""></td>
                            <td>홍길동</td>
                            <td>인사팀</td>
                            <td>사원</td>
                            <td>
                                <a href="">재직</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- /.card-body -->

            <div class="card-footer clearfix">
                <div class="card-sub">
                    <ul class="pagination pagination-sm justify-content-center">
                        <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/scripts.jsp" />
</body>
</html>