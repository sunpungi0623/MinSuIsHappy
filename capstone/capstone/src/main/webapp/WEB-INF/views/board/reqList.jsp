<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
								location.href = "/managerListAll?mode=sort&brand=All";
							}
						</SCRIPT>
						
					
				</li>
				<a class="nav-link" href="/reqList?mode=req" value="mypage">신청 현황</a>
				
				<a class="nav-link" href="/rentList?mode=show" value="mypage">대여 현황</a>
				
				<a class="nav-link" href="/returnpage" value="mypage">대여 기록</a>
				
				
			</ul>
			</nav>

		</div>
		<br>
		
		<div class="container h-100">
		<div class="row d-flex justify-content-center" style="width:auto;">
		
		<table class="table table-striped" style="border:2px solid black; background-color:white;">
			<thead>
				<tr>
					<th scope="col">코드</th>
					<th scope="col">기자재명</th>
					<th scope="col">대여자 ID</th>
					<th scope="col">대여자 번호</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
			
			<script>
				function Acknowledge(pcode){
					location.href = "/reqList?mode=ack&code=" + pcode;	
					alert(pcode + '기자재가 대여되었습니다.');
				}
			</script>
				<c:forEach items="${objList}" var="objectVO" varStatus="status">
					<tr>
						<td><c:out value="${objectVO.code}" /></td>
						<td><c:out value="${ objectVO.name }" /></td>
						<td><c:out value="${ objectVO.userID }" /></td>
						<td><c:out value="${ objectVO.userPhone }" /></td>
						<td><button type="submit" class="btn btn-primary" onclick="Acknowledge('${objectVO.code}');">승인</button></td>
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