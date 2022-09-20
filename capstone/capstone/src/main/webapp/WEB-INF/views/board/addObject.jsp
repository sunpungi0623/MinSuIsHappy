<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        <title>addItem</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/css/main.css">
    
    </head>

    <body>

    <div class="header">
        <nav class="navbar">
            <ul class="nav-menu">
                <li><img src="/resources/img/logo5.png" width=200></li>
                <li>
                    <a class="nav-link" role="button" aria-expanded="false" onclick="showObjects();">HOME</a>
                    <SCRIPT language="Javascript">
                        function showObjects() {
                            location.href = "/managerListAll?mode=sort&brand=All";
                        }
                    </SCRIPT>
                </li>
                <li><a class="nav-link" href="/notebookList" value="notebookList">기자재 정보</a></li>
                <li><a class="nav-link" href="/reqList?mode=show" value="reqList">신청 현황</a></li>
                <li><a class="nav-link" href="/rentList?mode=show" value="rentList">대여 현황</a></li>
                <li><a class="nav-link" href="/returnpage" value="returnpage">대여 기록</a></li>
                <li><a class="nav-link" href="/logout" value="logout">로그아웃</a></li>
            </ul>
        </nav>
    </div>

          <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="form bg-light mt-4 p-4">
                        <form action="/managerListAll?mode=add" method="" class="row g-3">
                            <h4>기자재 추가</h4>
                            <div class="col-12">
                                <label>기자재 코드</label>
                                <input type="text" name="code" class="form-control" placeholder="code">
                            </div>
                            <div class="col-12">
                                <label>기자재 이름</label>
                                <input type="text" name="name" class="form-control" placeholder="name">
                            </div>
                            
                            <div class="col-12">
                                <div class="btn-group" style="float:right">
                                    <a href="/managerListAll?mode=cancel">
                                        <button type="button" class="btngrey">취소</button></a>
                                        <button type="submit" class="btnblue">등록</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        

    <!-- Bootstrap JS -->
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>

    </body>
</html>