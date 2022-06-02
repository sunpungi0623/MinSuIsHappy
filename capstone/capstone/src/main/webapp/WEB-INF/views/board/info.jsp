<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <title>info</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
</head>
<body>
    <div class="header">
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="position:fixed; top:0; left:0; right:0; z-index:2;">
            <img src = "/resources/img/logo.png", width = 150>
            <a class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#" role="button" aria-expanded="false" onclick="showObjects();">HOME</a>
                    <SCRIPT language="Javascript">
                        function showObjects() {
                            location.href = "/listAll?mode=sort&brand=All";
                        }
                    </SCRIPT>
                <li class="nav-item">
                    <a class="nav-link" href="/mypage" value="mypage">마이페이지</a></li>
                    <a class="nav-link" href="/notebookList" value="notebookList">기자재 정보</a>
                    <a class="nav-link" href="/recopage" value="recopage">노트북 추천</a>
                    <a class="nav-link" href="/logout" value="logout">로그아웃</a>
            </ul>
        </nav>
    </div>

    <div class="container h-100">
      <div class="row d-flex justify-content-center" style="width:auto;">
            
            <p>
                <h2>노트북대여</h2>
            </p>

            -노트북 대여방법

            -이용수칙

            -경고문

            -전화번호/ 오시는길

        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>