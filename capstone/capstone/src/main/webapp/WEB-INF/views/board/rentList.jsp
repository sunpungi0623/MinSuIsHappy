<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>대여 현황</title>
    <script type="text/javascript">
        function search() {
            var name = document.getElementById("searchName").value;
            console.log(name);

            location.href = "/" + "?Option=Search&Name=" + name;
            //location.href="/"+"?Option=Modify&Name=${dataVO.name}&PhoneNumber=${dataVO.phoneNumber}&Address1=${dataVO.address1}&Address2=${dataVO.address2}&Time=${dataVO.time}";
        }
    </script>
    <link rel="stylesheet"
          href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/main.css">

</head>
<body>

<div class="contents">

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

    <div>
        <div>
            <table class="list">
                <thead>
                <tr>
                    <th scope="col">코드</th>
                    <th scope="col">기자재명</th>
                    <th scope="col">학번</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">대여일</th>
                    <th scope="col">반납예정일</th>
                    <th scope="col">비고</th>
                    <th scope="col"></th>
                </tr>
                </thead>

                <tbody>
                <script>
                    function returnObject(pcode, uid) {
                        location.href = "/rentList?mode=return&pcode="+ pcode + "&uid=" + uid;
                        alert(pcode + '기자재가 반납되었습니다.')
                    }
                </script>
                <c:forEach items="${objList}" var="objectVO" varStatus="status">
                    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
                    <tr>
                        <td><c:out value="${ objectVO.code }"/></td>
                        <td><c:out value="${ objectVO.name }"/></td>
                        <td><c:out value="${ objectVO.userID }"/></td>
                        <td><c:out value="${ objectVO.userPhone }"/></td>
                        <td><c:out value="${ objectVO.rentDate }"/></td>
                        <td><c:out value="${ objectVO.returnDate }"/></td>
                        <!--반납 날짜가 지났을때  -->
                        <c:if test="${ objectVO.returnDate<today}">
                            <td style="color: red;"><strong>연체</strong></td>
                        </c:if>
                        <!-- 반납 날짜가 지나지 않았을때 -->
                        <c:if test="${ objectVO.returnDate>=today}">
                            <td style="color: blue;"><strong>대여중</strong></td>
                        </c:if>
                        <td>
                            <button type="submit" class="btnblue" onclick="returnObject('${objectVO.code}', '${ objectVO.userID }');">반납</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>