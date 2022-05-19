<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기자재 목록</title>
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
	<div class="contents">
		<!-- 맨 윗상단 메뉴 -->
		<div class="header">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark"> <img
				src="https://w.namu.la/s/1238e4e492e16357828d8f9621fcb625103edf44604af4a4f70da228cce0078e0624b2ddb1d37b7cd4090200bdd6dd68c3e818440b626260b092d73b069bdc481ab7b3ade2a8021060f7bc81d4b4366b"
				, width=150> <a class="navbar-brand" href="#">&nbsp;&nbsp;기자재
				대여 시스템</a>
			<ul class="navbar-nav">
				<!--Dropdown-->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
					role="button" aria-expanded="false">기자재 현황</a>
					<ul class="dropdown-menu">
						<SCRIPT language="Javascript">
							function showSamsungs() {
								location.href = "/listAll?mode=sort&brand=samsung";
							}

							function showLGs() {
								location.href = "/listAll?mode=sort&brand=lg";
							}

							function showMSIs() {
								location.href = "/listAll?mode=sort&brand=msi";
							}

							function showApples() {
								location.href = "/listAll?mode=sort&brand=apple";
							}
							
							function showObjects() {
								location.href = "/listAll?mode=sort&brand=All";
							}
						</SCRIPT>
						<li><a class="dropdown-item" href="#"onclick="showObjects();">전체보기</a></li>
						<li><a class="dropdown-item" href="#"onclick="showSamsungs();">Samsung</a></li>
						<li><a class="dropdown-item" href="#" onclick="showLGs();">LG</a></li>
						<li><a class="dropdown-item" href="#" onclick="showMSIs();">MSI</a></li>
						<li><a class="dropdown-item" href="#" onclick="showApples();">Apple</a></li>
					</ul></li>
				<li class="nav-item"><SCRIPT language="Javascript">
					
				</SCRIPT> <a class="nav-link" href="/mypage" value="mypage">마이
						페이지</a></li>
				<a class="nav-link" href="/notebookList" value="mypage">기자재 정보</a>
				</li>
			</ul>
			</nav>

		</div>
		<br>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">코드</th>
					<th scope="col">기자재명</th>
					<th scope="col">상태</th>
					<th scope="col"></th>
				</tr>
			</thead>

			<tbody>
				<script>
					function rentBtnPushed(pname, pcode) {
						console.log(pname);
						console.log(pcode);
						location.href = "/listAll?mode=rent&oname=" + pname
								+ "&ocode=" + pcode;
						alert('대여 신청이 완료되었습니다.');

					}
					function notRent() {
						alert('대여가 불가능 합니다');

					}
				</script>
				<c:forEach items="${objList}" var="objectVO" varStatus="status">
					<tr>
						<td><c:out value="${objectVO.code}" /></td>
						<td><c:out value="${objectVO.name}" /></td>
						<td><c:out value="${objectVO.status}" /></td>
						<td id="${objectVO.code}button">
						<SCRIPT language="Javascript">
							var btn = document.getElementById("${objectVO.code}button");
						
							if ("${objectVO.status}" == "대여가능") {
								btn.innerHTML += "<button type=\"submit\" class=\"btn btn-dark float-end\" onclick=\"rentBtnPushed(\`${objectVO.name}\`,\`${objectVO.code}\`);\">대여</button>";
							} else if ("${objectVO.status}" == "대여중") {
								btn.innerHTML += "<button type=\"submit\" style=\"background-color:red\" class=\"btn btn-dark float-end\" onclick=\"notRent();\");\">불가</button>";

							}
						</SCRIPT>
						</td>
						<!-- <td><button type="submit" class="btn btn-dark float-end" onclick="rentBtnPushed(`${objectVO.name}`,`${objectVO.code}`);">대여</button></td> -->

					</tr>
				</c:forEach>


			</tbody>
		</table>
	</div>


	<!— Bootstrap JS —>
	<script
		src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>