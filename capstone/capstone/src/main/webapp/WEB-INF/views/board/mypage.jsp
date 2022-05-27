<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>mypage</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">

</head>
<body>
	<div class="contents">
		<!-- 맨 윗상단 메뉴 -->
		<div class="header">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark">
				<img src = "/resources/img/logo.png", width = 150>
				<a class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
				<ul class="navbar-nav">

					<li class="nav-item"><a class="nav-link" href="#"
						role="button" aria-expanded="false" onclick="showObjects();">HOME</a>
						<SCRIPT language="Javascript">
							function showObjects() {
								location.href = "/listAll?mode=sort&brand=All";
							}
						</SCRIPT>
					<li class="nav-item"><SCRIPT language="Javascript">
						
					</SCRIPT> <a class="nav-link" href="/notebookList" value="mypage">기자재 정보</a></li>



				</ul>
			</nav>

		</div>


		<br>

		<div class="card text-white">
			<div class="card-header bg-secondary">내 정보</div>
			<div class="card-body text-dark">


				<h5 class="card-title">
					<b>이름</b>
				</h5>
				<p class="card-text">
					<c:out value="${userList.getUserName()}" />
				</p>
				<h5 class="card-title">
					<b>ID</b>
				</h5>
				<p class="card-text">
					<c:out value="${userList.getID()}" />
				</p>
				<h5 class="card-title">
					<b>전화번호</b>
				</h5>
				<p class="card-text">
					<c:out value="${userList.getUserPhone()}" />
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
								<td><c:out value="${objectVO.getCode()}" /></td>
								<td><c:out value="${objectVO.getName()}" /></td>
								<td><c:out value="${objectVO.getStatus()}" /></td>
								<td><c:out value="${objectVO.getRentDate()}" /></td>
								<td><c:out value="${objectVO.getReturnDate()}" /></td>

								<td id="${objectVO.code}button"><SCRIPT
										language="Javascript">
									var btn = document
											.getElementById("${objectVO.code}button");

									if ("${objectVO.status}" == "승인대기중") {
										btn.innerHTML += "<button type=\"submit\" style=\"background-color:red\" class=\"btn btn-dark float-end\" onclick=\"cancelRent(\`${objectVO.code}\`);\">취소</button>";
									} else if ("${objectVO.status}" == "대여중") {
										btn.innerHTML += "<button type=\"submit\" style=\"background-color:red\" class=\"btn btn-dark float-end\" onclick=\"notCancel();\");\">취소</button>";
									}
								</SCRIPT></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>


		<!— Bootstrap JS —>
		<script
			src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>