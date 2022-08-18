<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>recopage</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    <style>
        .navbar {
            background-color: white;
            line-height: 70px;
            height: 90px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            border-bottom: 1px solid black;
            font-size: 18px;
            z-index: 1;
        }

        .navbar a {
            text-decoration-line: none;
            color: inherit;
        }

        .navbar ul {
            list-style: none;
        }

        .navbar li {
            float: left;
            margin-right: 30px;
            display: inline;
        }

        body {
            padding-top: 100px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
<!-- 맨 윗상단 메뉴 -->
<div class="header">
    <nav class="navbar">
        <ul class="nav-menu">
            <li><img src="/resources/img/logo5.png" width=200></li>
            <li>
                <a class="nav-link" role="button" aria-expanded="false" onclick="showObjects();">HOME</a>
                <SCRIPT
                        language="Javascript">
                    function showObjects() {
                        location.href = "/listAll?mode=sort&brand=All";
                    }
                </SCRIPT>
            </li>
            <li><a class="nav-link" href="/info" value="info">공지사항</a></li>
            <li><a class="nav-link" href="/mypage" value="mypage">마이페이지</a></li>
            <li><a class="nav-link" href="/notebookList" value="notebookList">기자재 정보</a></li>
            <li><a class="nav-link" href="/recopage" value="recopage">노트북 추천</a></li>
            <li><a class="nav-link" href="/logout" value="logout">로그아웃</a></li>
        </ul>
    </nav>
</div>

<br>

<div class="card" style="width: auto; margin-left: 20; margin-left: 20;">
    <div class="card-header">
        #1
    </div>
    <div class="card-body">
        <legend>사용 목적을 선택해주세요</legend>
        <select id="use">
            <option value="1">강의/문서작업</option>
            <option value="2">안드로이드 어플 개발</option>
            <option value="3">ios 어플 개발</option>
            <option value="4">게임 개발</option>
        </select>
    </div>
</div>
<br>

<div class="card">
    <div class="card-header">
        #2
    </div>
    <div class="card-body">
        <legend>휴대성과 성능 중 더 중요한 쪽을 선택해주세요</legend>
        <select id="property">
            <option value="1">휴대성</option>
            <option value="2">성능</option>
        </select>
    </div>
</div>
<br>
<script languege="Javascript">
    function recommend() {
        var use = document.getElementById("use").value;
        var property = document.getElementById("property").value;
        console.log(use);
        console.log(property)
        if (use == "1") {
            if (property == "1") {
                location.href = "/Info?model=LG그램15, 15Z90N-VP70ML";
            } else if (property == "2") {
                location.href = "/Info?model=삼성Odyssey, NT801G5H-X01/C";
            }
        } else if (use == "2") {
            if (property == "1") {
                location.href = "/Info?model=LG그램15, 15Z90N-VP70ML";
            } else if (property == "2") {
                location.href = "/Info?model=삼성Odyssey, NT800G5W-XD71";
            }
        } else if (use == "3") {
            if (property == "1") {
                location.href = "Info?model=애플MacBookAir, MGN63KH/A";
            } else if (property == "2") {
                location.href = "/Info?model=애플MacBookPro, MVVJ2KH/A";
            }
        } else if (use == "4") {
            if (property == "1") {
                // 오딧세
                location.href = "/Info?model=삼성Odyssey, NT800G5W-GD7A";
            } else if (property == "2") {
                //msi
                location.href = "/Info?model=MSI소드, GF66-A11UD";
            }
        }
    }
</script>
<br>
<div class="container h-100">
    <div class="row d-flex justify-content-center" style="width:auto;">

        <button type="button" class="btn btn-dark" onclick=recommend() style="width: 20">제출</button>

    </div>
</div>
<!— Bootstrap JS —>
<script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>