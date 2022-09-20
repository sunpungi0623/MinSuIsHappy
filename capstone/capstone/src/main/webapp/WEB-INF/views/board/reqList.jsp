<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>신청 현황</title>
    <script type="text/javascript">
        function search() {
            var name = document.getElementById("searchName").value;
            console.log(name);

            location.href = "/" + "?Option=Search&Name=" + name;
            //location.href="/"+"?Option=Modify&Name=${dataVO.name}&PhoneNumber=${dataVO.phoneNumber}&Address1=${dataVO.address1}&Address2=${dataVO.address2}&Time=${dataVO.time}";
        }
    </script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">
</head>

<body>
<!-- 맨 윗상단 메뉴 -->
<nav class="navbar">
    <ul class="nav-menu">
		<li><img src="/resources/img/logo5.png" width=200></li>
		<li class="nav-item"><a class="nav-link" href="#" role="button" aria-expanded="false" onclick="showObjects();">HOME</a>
                <SCRIPT language="Javascript">

                    function showObjects() {
                        location.href = "/managerListAll?mode=sort&brand=All";
                    }
                </SCRIPT>


		</li>
		<li><a class="nav-link" href="/notebookList" value="mypage">기자재 정보</a></li>
		<li><a class="nav-link" href="/reqList?mode=show" value="mypage">신청 현황</a></li>
		<li><a class="nav-link" href="/rentList?mode=show" value="mypage">대여 현황</a></li>
		<li><a class="nav-link" href="/returnpage" value="mypage">대여 기록</a></li>
		<li><a class="nav-link" href="/logout" value="logout">로그아웃</a></li>
    </ul>
</nav>


<div>
        <table class="list" >
            <thead>
            <tr>
                <th scope="col">코드</th>
                <th scope="col">기자재명</th>
                <th scope="col">학번</th>
                <th scope="col">전화번호</th>&nbsp;&nbsp;&nbsp;&nbsp;
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>

            <script>
                function Acknowledge(pcode) {
                    location.href = "/reqList?mode=ack&code=" + pcode;
                    alert(pcode + '기자재가 대여되었습니다.');
                }
            </script>
            <c:forEach items="${objList}" var="objectVO" varStatus="status">
                <tr>
                    <td><c:out value="${objectVO.code}"/></td>
                    <td><c:out value="${ objectVO.name }"/></td>
                    <td><c:out value="${ objectVO.userID }"/></td>
                    <td><c:out value="${ objectVO.userPhone }"/></td>
                    <td>
                        <button type="submit" class="btn btn-primary" onclick="Acknowledge('${objectVO.code}');">승인
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
</div>
</body>
</html>