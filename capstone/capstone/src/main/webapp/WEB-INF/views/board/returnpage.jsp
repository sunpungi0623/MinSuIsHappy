<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <title>대여 기록</title>
    <script type="text/javascript">
        function search() {
            var name = document.getElementById("searchName").value;
            console.log(name);

            location.href = "/" + "?Option=Search&Name=" + name;
            //location.href="/"+"?Option=Modify&Name=${dataVO.name}&PhoneNumber=${dataVO.phoneNumber}&Address1=${dataVO.address1}&Address2=${dataVO.address2}&Time=${dataVO.time}";
        }
    </script>



</head>
<body>

<!-- 맨 윗상단 메뉴 -->
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


    <div class="row d-flex justify-content-center" style="width:auto;">
    <table class="list">
       <!-- <table class="table table-striped table-hover" style="border:1px solid black; background-color:white;"> -->
            <thead>
            <tr>
                <th scope="col">코드</th>
                <th scope="col">기자재명</th>
                <th scope="col">대여자 ID</th>
                <th scope="col">대여자 번호</th>
                <th scope="col">대여일</th>
                <th scope="col">반납일</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${objList}" var="recordVO" varStatus="status">
                <tr>
                    <td><c:out value="${ recordVO.code }"/></td>
                    <td><c:out value="${ recordVO.name }"/></td>
                    <td><c:out value="${ recordVO.userID }"/></td>
                    <td><c:out value="${ recordVO.userPhone }"/></td>
                    <td><c:out value="${ recordVO.rentDate }"/></td>
                    <td><c:out value="${ recordVO.returnDate }"/></td>

                </tr>
            </c:forEach>

            </tbody>
    </table>
        <!--</table>-->
    </div>

</body>
</html>