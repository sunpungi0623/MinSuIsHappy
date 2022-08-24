<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>기자재 목록</title>
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>

<body>
<!-- 맨 윗상단 메뉴 -->
<nav class="navbar">
    <ul class="nav-menu">
        <li><img src="/resources/img/logo5.png" width=200></li>
        <li>
            <div class="dropdown">
                <div class="nav-link">기자재 현황</div>
                <div class="dropdown-content">
                    <a class="dropdown-item" href="#" onclick="showObjects();">전체보기</a><br>
                    <a class="dropdown-item" href="#" onclick="showSamsungs();">Samsung</a><br>
                    <a class="dropdown-item" href="#" onclick="showLGs();">LG</a><br>
                    <a class="dropdown-item" href="#" onclick="showMSIs();">MSI</a><br>
                    <a class="dropdown-item" href="#" onclick="showApples();">Apple</a><br>
                </div>
            </div>
        </li>
        <li><a class="nav-link" href="/notebookList" value="mypage">기자재 정보</a></li>
        <li><a class="nav-link" href="/reqList?mode=show" value="mypage">신청 현황</a></li>
        <li><a class="nav-link" href="/rentList?mode=show" value="mypage">대여 현황</a></li>
        <li><a class="nav-link" href="/returnpage" value="mypage">대여 기록</a></li>
        <li><a class="nav-link" href="/logout" value="logout">로그아웃</a></li>
    </ul>
</nav>
<table class="list">
    <thead>
    <tr>
        <th scope="col">코드</th>
        <th scope="col">기자재명</th>
        <th scope="col">상태</th>
        <th scope="col" style="text-align: right"><a href="/addObject">
            <button type="button" class="btnblue">추가</button>
        </a></th>
    </tr>
    </thead>

    <tbody>
    <c:forEach items="${objList}" var="objectVO" varStatus="status">
        <tr>
            <td><c:out value="${objectVO.code}"/></td>
            <td><c:out value="${objectVO.name}"/></td>
            <td><c:out value="${objectVO.status}"/></td>
            <td>
                <button type="submit" class="btnblue"
                        onclick="deleteObj('${ objectVO.code }');">삭제
                </button>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>
<div class="paging" style="margin-top: 1%">
    <ul class="pagination">
        <li class="page-item">
            <a class="page-link" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <c:forEach var="count" begin="1" end="${listCount/15 + 1}" step="1">
            <li class="page-item">
                <a class="page-link" onclick="sendPage('${count}')" id="${count}page">
                    <c:out value="${ count }"/>
                </a>
            </li>
            <script>
                if ("${page}" == "${count}") {
                    var presentPage = document.getElementById("${count}page");
                    presentPage.style.color = 'tomato';
                }
            </script>
        </c:forEach>
        <li class="page-item">
            <a class="page-link" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</div>
<SCRIPT language="Javascript">
    function showSamsungs() {
        location.href = "/managerListAll?mode=sort&brand=samsung";
    }

    function showLGs() {
        location.href = "/managerListAll?mode=sort&brand=lg";
    }

    function showMSIs() {
        location.href = "/managerListAll?mode=sort&brand=msi";
    }

    function showApples() {
        location.href = "/managerListAll?mode=sort&brand=apple";
    }

    function showObjects() {
        location.href = "/managerListAll?mode=sort&brand=All";
    }

    function search() {
        var name = document.getElementById("searchName").value;
        console.log(name);

        location.href = "/" + "?Option=Search&Name=" + name;
        //location.href="/"+"?Option=Modify&Name=${dataVO.name}&PhoneNumber=${dataVO.phoneNumber}&Address1=${dataVO.address1}&Address2=${dataVO.address2}&Time=${dataVO.time}";
    }

    function sendPage(count) {
        location.href = "/managerListAll?mode=sort&brand=${brand}&page=" + count;
    }

    function deleteObj(ocode) {
        location.href = "/managerListAll?mode=delete&code=" + ocode;
        alert(ocode + '물품이 삭제되었습니다.');
    }
</SCRIPT>
</body>
</html>