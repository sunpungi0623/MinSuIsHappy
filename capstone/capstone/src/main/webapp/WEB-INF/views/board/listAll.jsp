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
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark"
				style="position:fixed; top:0; left:0; right:0;"> <img
				src="/resources/img/logo.png" , width=150> <a
				class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
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
						<li><a class="dropdown-item" href="#"
							onclick="showObjects();">전체보기</a></li>
						<li><a class="dropdown-item" href="#"
							onclick="showSamsungs();">Samsung</a></li>
						<li><a class="dropdown-item" href="#" onclick="showLGs();">LG</a></li>
						<li><a class="dropdown-item" href="#" onclick="showMSIs();">MSI</a></li>
						<li><a class="dropdown-item" href="#" onclick="showApples();">Apple</a></li>
					</ul></li>
				<li class="nav-item"><SCRIPT language="Javascript">
				
				</SCRIPT> 
					<a class="nav-link" href="/info" value="info">공지사항</a></li>
					<a class="nav-link" href="/mypage" value="mypage">마이페이지</a>
					<a class="nav-link" href="/notebookList" value="notebookList">기자재 정보</a>
					<a class="nav-link" href="/recopage" value="recopage">노트북 추천</a>
					<a class="nav-link" href="/logout" value="logout">로그아웃</a>
				</li>
			</ul>
			</nav>

		</div>
		<br> <br> <br> <br>
		<div class="container h-100">
			<div class="row d-flex justify-content-center" style="width: auto;">


				<table class="table table-striped table-hover"
					style="border: 1px solid black; background-color: white">
					<thead>
						<tr>
							<th scope="col">코드</th>
							<th scope="col">기자재명</th>
							<th scope="col">상태</th>
							<th scope="col" style="text-align:right;">반납 예정일</th>
							<th scope="col"></th>
						</tr>
					</thead>

					<tbody>
						<script>
							function rentBtnPushed(pname, pcode) {
								console.log(pname);
								console.log(pcode);
								var isRented = "${result.isRented}";
								if (isRented == "0") {
									location.href = "/listAll?mode=rent&oname="
											+ pname + "&ocode=" + pcode;
									alert('대여 신청이 완료되었습니다.');
								} else {
									alert('이미 신청하신 기자재가 있으므로 대여가 불가합니다');
								}

							}
							function notRent() {
								alert('대여가 불가능 합니다');

							}

							function ObjectInfo(value) {
								location.href = "/Info?model=" + value;
							}
						</script>
						<c:forEach items="${objList}" var="objectVO" varStatus="status">
							<tr>

								<td><c:out value="${objectVO.code}" /></td>
								<td><a href="javascript:void(0)"
									onclick="ObjectInfo('${objectVO.name}');"><c:out
											value="${objectVO.name}" /></a></td>
								<td><c:out value="${objectVO.status}" /></td>
								<td style="text-align:right;"><strong><c:out value="${ objectVO.returnDate }" /></strong></td>


								<td id="${objectVO.code}button"><SCRIPT
										language="Javascript">
									var btn = document
											.getElementById("${objectVO.code}button");

									if ("${objectVO.status}" == "대여가능") {
										btn.innerHTML += "<button type=\"submit\" class=\"btn btn-dark float-end\" onclick=\"rentBtnPushed(\`${objectVO.name}\`,\`${objectVO.code}\`);\">대여</button>";
									} else if ("${objectVO.status}" == "대여중"
											|| "${objectVO.status}" == "승인대기중") {
										btn.innerHTML += "<button type=\"submit\" style=\"background-color:red\" class=\"btn btn-dark float-end\" onclick=\"notRent();\");\">불가</button>";
									}
								</SCRIPT></td>

								<!-- <td><button type="submit" class="btn btn-dark float-end" onclick="rentBtnPushed(`${objectVO.name}`,`${objectVO.code}`);">대여</button></td> -->

							</tr>

						</c:forEach>


					</tbody>
				</table>
				<script>
				function sendPage(count){
					
					location.href="/listAll?mode=sort&brand=${brand}&page=" + count;
					
				}
				
				</script>
				<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<c:forEach var="count" begin="1" end="${listCount/15 + 1}" step="1">
						<li class="page-item"><a class="page-link" href="#" onclick="sendPage('${count}')" id="${count}page"><c:out value="${ count }" /></a></li>
					<script>
					if("${page}" == "${count}"){
					var presentPage = document.getElementById("${count}page");
					presentPage.style.color = 'red';
					}
					</script>
					</c:forEach>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>

	<!— Bootstrap JS —>
	<script
		src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>