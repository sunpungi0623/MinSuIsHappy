<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</head>

<link rel="stylesheet" href="resources/css/main.css">

<body>

	<div>
		<!-- 맨 윗상단 메뉴 -->
		<div class="header">
			<nav class="navbar">
			<ul class = "nav-menu">
				<li><img src="/resources/img/logo5.png" width=200></li>
				<li>
					<div class = "dropdown">
						<div class="drop">기자재 현황</div>
						<div class = "dropdown-content">
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
							<a class="dropdown-item" onclick="showObjects();">전체보기</a><br>
							<a class="dropdown-item" onclick="showSamsungs();">Samsung</a><br>
							<a class="dropdown-item" onclick="showLGs();">LG</a><br>
							<a class="dropdown-item" onclick="showMSIs();">MSI</a><br>
							<a class="dropdown-item" onclick="showApples();">Apple</a><br>
						</div>
					</div>
				</li>
				<li><a class="nav-link" href="/info" value="info">공지사항</a></li>
				<li><a class="nav-link" href="/mypage" value="mypage">마이페이지</a></li>
				<li><a class="nav-link" href="/notebookList" value="notebookList">기자재 정보</a></li>
				<li><a class="nav-link" href="/recopage" value="recopage">노트북 추천</a></li>
				<li><a class="nav-link" href="/logout" value="logout">로그아웃</a></li>
			</ul>
			</nav>
		</div>
		
		<div>
			<div>
				<table class = "list">
					<thead>
						<tr>
							<th scope="col">코드</th>
							<th scope="col">기자재명,모델명</th>
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
								<td><a href="javascript:void(0)" onclick="ObjectInfo('${objectVO.name}');"><c:out value="${objectVO.name}" /></a></td>
								<td><c:out value="${objectVO.status}" /></td>
								<td style="text-align:right;"><strong><c:out value="${ objectVO.returnDate }" /></strong></td>
								<td id="${objectVO.code}button">
									<script language="Javascript">
										var btn = document.getElementById("${objectVO.code}button");
											if ("${objectVO.status}" == "대여가능") {
												btn.innerHTML += "<button type=\"submit\" class=\"btnblue\" onclick=\"rentBtnPushed(\`${objectVO.name}\`,\`${objectVO.code}\`);\">대여</button>";
											}
											else if ("${objectVO.status}" == "대여중"|| "${objectVO.status}" == "승인대기중") {
												btn.innerHTML += "<button type=\"submit\" class=\"btngrey\" onclick=\"notRent();\");\">불가</button>";
											}
									</script>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
				<script>
				function sendPage(count){
					
					location.href="/listAll?mode=sort&brand=${brand}&page=" + count;
					
				}
				
				</script>
				
				<div class="paging">
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
					<c:forEach var="count" begin="1" end="${listCount/15 + 1}" step="1">
						<li class="page-item">
							<a class="page-link" onclick="sendPage('${count}')" id="${count}page">
								<c:out value="${ count }" />
							</a>
						</li>
						<script>
							if("${page}" == "${count}"){
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
			</div>
		</div>
	</div>
</body>
</html>