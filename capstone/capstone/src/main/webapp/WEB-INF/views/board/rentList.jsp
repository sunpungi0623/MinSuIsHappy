<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>대여 현황</title>
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


</head>
<body>
	<body>
	<div class="contents">
		<!-- 맨 윗상단 메뉴 -->
		<div class="header">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
				<img
					src="https://w.namu.la/s/1238e4e492e16357828d8f9621fcb625103edf44604af4a4f70da228cce0078e0624b2ddb1d37b7cd4090200bdd6dd68c3e818440b626260b092d73b069bdc481ab7b3ade2a8021060f7bc81d4b4366b"
					, width=150> <a class="navbar-brand" href="#">&nbsp;&nbsp;기자재
					대여 시스템</a>
				<ul class="navbar-nav">

					<li class="nav-item"><a class="nav-link" href="#"
						role="button" aria-expanded="false" onclick="showObjects();">HOME</a>
						<SCRIPT language="Javascript">
							
							function showObjects() {
								location.href = "/managerListAll?mode=sort&brand=All";
							}
						</SCRIPT>
						
				</li>
				<a class="nav-link" href="/reqList?mode=show" value="mypage">신청
					현황</a>
				
				<a class="nav-link" href="/rentList?mode=show" value="mypage">대여 현황</a>
			
			</ul>
			</nav>

		</div>
		<br>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">코드</th>
					<th scope="col">기자재명</th>
					<th scope="col">대여자 ID</th>
					<th scope="col">대여자 번호</th>
					<th scope="col">대여일</th>
					<th scope="col">반납일</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>

				<script>
					function returnObject(pcode, uid) {
						location.href="/rentList?mode=return&pcode=" + pcode + "&uid=" + uid;
						alert(pcode + '기자재가 반납되었습니다.')
					}
				</script>
				<c:forEach items="${objList}" var="objectVO" varStatus="status">
					<tr>
						<td><c:out value="${ objectVO.code }" /></td>
						<td><c:out value="${ objectVO.name }" /></td>
						<td><c:out value="${ objectVO.userID }" /></td>
						<td><c:out value="${ objectVO.userPhone }" /></td>
						<td><c:out value="${ objectVO.rentDate }" /></td>
						<td><c:out value="${ objectVO.returnDate }" /></td>
						<td><button type="submit" class="btn btn-primary"
								onclick="returnObject('${objectVO.code}', '${ objectVO.userID }');">반납</button></td>
					</tr>
				</c:forEach>
			</tbody>


		</table>
	</div>


	<!-- Bootstrap JS -->
	<script
		src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>