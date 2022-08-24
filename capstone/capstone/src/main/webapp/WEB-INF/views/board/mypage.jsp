<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>mypage</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">

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
<%--            <li><a class="nav-link" href="/recopage" value="recopage">노트북 추천</a></li>--%>
            <li><a class="nav-link" href="/logout" value="logout">로그아웃</a></li>
        </ul>
    </nav>
</div>

<div class="container h-100" style="z-index:1;">
    <div class="row d-flex justify-content-center" style="width:auto;">

        <div class="card text-white">
            <div class="card-header bg-secondary">내 정보</div>
            <div class="card-body text-dark">


                <h5 class="card-title">
                    <b>이름</b>
                </h5>
                <p class="card-text">
                    <c:out value="${userList.getUserName()}"/>
                </p>
                <hr>
                <h5 class="card-title">
                    <b>ID</b>
                </h5>
                <p class="card-text">
                    <c:out value="${userList.getID()}"/>
                </p>
                <hr>
                <h5 class="card-title">
                    <b>전화번호</b>
                </h5>
                <p class="card-text">
                    <c:out value="${userList.getUserPhone()}"/>
                </p>

            </div>
        </div>

        <br>

        <div class="card text-white">
            <div class="card-header bg-secondary">내가 빌린 기자재</div>
            <div class="card-body text-dark">
                <table class="table table-striped table-hover table-bordered">
                    <thead>
                    <tr>
                        <th scope="col">코드</th>
                        <th scope="col">비품명</th>
                        <th scope="col">상태</th>
                        <th scope="col">대여 기간</th>
                        <th scope="col">반납 예정일</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>

                    <script>
                        function cancelRent(pcode) {

                            location.href = "/mypage?mode=cancel&ocode=" + pcode;
                            alert('기자재 대여 신청이 취소되었습니다.');

                        }

                        function notCancel() {
                            alert('대여중인 기자재는 취소가 불가능 합니다');
                        }
                    </script>

                    <c:forEach items="${objList}" var="objectVO" varStatus="status">

                        <tr>
                            <td><c:out value="${objectVO.getCode()}"/></td>
                            <td><c:out value="${objectVO.getName()}"/></td>
                            <td><c:out value="${objectVO.getStatus()}"/></td>
                            <td><c:out value="${objectVO.getRentDate()}"/></td>
                            <td><c:out value="${objectVO.getReturnDate()}"/></td>

                            <td id="${objectVO.code}button">
                                <SCRIPT language="Javascript">
                                    var btn = document
                                        .getElementById("${objectVO.code}button");

                                    if ("${objectVO.status}" == "승인대기중") {
                                        btn.innerHTML += "<button type=\"submit\" style=\"background-color:red\" class=\"btn btn-dark float-end\" onclick=\"cancelRent(\`${objectVO.code}\`);\">취소</button>";
                                    } else if ("${objectVO.status}" == "대여중") {
                                        btn.innerHTML += "<button type=\"submit\" style=\"background-color:red\" class=\"btn btn-dark float-end\" onclick=\"notCancel();\");\">취소</button>";
                                    }
                                </SCRIPT>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<!— Bootstrap JS —>
<script
        src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>