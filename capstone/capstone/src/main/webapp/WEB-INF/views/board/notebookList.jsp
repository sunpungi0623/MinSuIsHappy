<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">

<title>notebook List</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">

</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="position:fixed; top:0; left:0; right:0; z-index:2;">
				<img src = "/resources/img/logo.png", width = 150>
				<a class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
		<ul class="navbar-nav">

			<li class="nav-item">
				<c:if test="${ userList.getTYPE() == 'manager' }">
					<a class="nav-link" href="#" role="button" aria-expanded="false" onclick="managerObjects();">HOME</a></li>
					<a class="nav-link" href="/notebookList" value="mypage">기자재 정보</a>
           			<a class="nav-link" href="/reqList?mode=show" value="mypage">신청 현황</a>
            		<a class="nav-link" href="/rentList?mode=show" value="mypage">대여 현황</a>
            		<a class="nav-link" href="/returnpage" value="mypage">대여 기록</a>
            		<a class="nav-link" href="/logout" value="logout">로그아웃</a>
				</c:if>
				<c:if test="${ userList.getTYPE() == 'student' }">
					<a class="nav-link" href="#" role="button" aria-expanded="false" onclick="showObjects();">HOME</a></li>
					<a class="nav-link" href="/mypage" value="notebookList">마이페이지</a>
					<a class="nav-link" href="/notebookList" value="notebookList">기자재 정보</a>
					<a class="nav-link" href="/recopage" value="recopage">노트북 추천</a>
					<a class="nav-link" href="/logout" value="logout">로그아웃</a>
				</c:if>
				
				<SCRIPT language="Javascript">
					function showObjects() {
						location.href = "/listAll?mode=sort&brand=All";
					}

					function managerObjects() {
						location.href = "/managerListAll?mode=sort&brand=All";
					}
				</SCRIPT>
		</ul>
	</nav>
	<br><br><br><br>
	
	<div class="container h-100" style="z-index:1;">
	<div class="row d-flex justify-content-center" style="width:auto;">
		<div class="col-lg-3 col-md-4">
			<!-- 삼성 오디세이 -->
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/odyssey.jpg" class="card-img-top" alt="samsung odyssey" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">삼성Odyssey</h5>
					<p class="card-text">NT800G5W-XD71</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : i7-7700HQ (2.8GHz)</li>
					<li class="list-group-item">메모리 : 8GB</li>
					<li class="list-group-item">그래픽카드 : GTX1050</li>
					<li class="list-group-item">화면 : 39.62cm(15.6인치)</li>
					<li class="list-group-item">무게 : 2.5kg</li>
				</ul>
			</div><br>
		</div><br>

		<div class="col-lg-3 col-md-4">
			<!-- 삼성 오디세이 -->
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/odyssey.jpg" class="card-img-top" alt="samsung odyssey" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">삼성Odyssey</h5>
					<p class="card-text">NT800G5W-XD7S</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : i7-7700HQ (2.8GHz)</li>
					<li class="list-group-item">메모리 : 8GB</li>
					<li class="list-group-item">그래픽카드 : GTX1050</li>
					<li class="list-group-item">화면 : 39.62cm(15.6인치)</li>
					<li class="list-group-item">무게 : 2.5kg</li>
				</ul>
			</div><br>
		</div><br>

		<div class="col-lg-3 col-md-4">
			<!-- 삼성 오디세이 -->
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/odyssey.jpg" class="card-img-top" alt="samsung odyssey" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">삼성Odyssey</h5>
					<p class="card-text">NT800G5W-GD7A</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : i7-7700HQ (2.8GHz)</li>
					<li class="list-group-item">메모리 : 8GB</li>
					<li class="list-group-item">그래픽카드 : GTX1060</li>
					<li class="list-group-item">화면 : 39.62cm(15.6인치)</li>
					<li class="list-group-item">무게 : 2.5kg</li>
				</ul>
			</div><br>
		</div><br>

		<div class="col-lg-3 col-md-4">
			<!-- 삼성 오디세이 -->
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/odyssey.jpg" class="card-img-top" alt="samsung odyssey" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">삼성Odyssey</h5>
					<p class="card-text">NT801G5H-X01/C</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : i7-7700HQ (2.8GHz)</li>
					<li class="list-group-item">메모리 : 16GB</li>
					<li class="list-group-item">그래픽카드 : GTX1060</li>
					<li class="list-group-item">화면 : 39.62cm(15.6인치)</li>
					<li class="list-group-item">무게 : 2.5kg</li>
				</ul>
			</div><br>
		</div><br>

		<div class="col-lg-3 col-md-4">
			<!-- 맥북 프로 -->
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/macbookpro.png" class="card-img-top" alt="mackbook pro" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">애플MacBookPro</h5>
					<p class="card-text">MVVJ2KH/A</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : i7-9750H (2.6GHz)</li>
					<li class="list-group-item">메모리 : 16GB</li>
					<li class="list-group-item">그래픽카드 : 라데온 Pro 5300M</li>
					<li class="list-group-item">화면 : 40.8cm(16인치)</li>
					<li class="list-group-item">무게 : 2.0kg</li>
				</ul>
			</div><br>
		</div><br>

		<div class="col-lg-3 col-md-4">
			<!-- 맥북 에어 -->
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/macbookair.jpg" class="card-img-top" alt="mackbook air" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">애플MacBookAir</h5>
					<p class="card-text">MGN63KH/A</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : 실리콘 M1</li>
					<li class="list-group-item">메모리 : 8GB</li>
					<li class="list-group-item">그래픽카드 : M1 7 core</li>
					<li class="list-group-item">화면 : 33.78cm(13.3인치)</li>
					<li class="list-group-item">무게 : 1.29kg</li>
				</ul>
			</div><br>
		</div><br>

		<div class="col-lg-3 col-md-4">
			<!-- LG 그램 -->
			<div class="card" style="width: 18rem;">
				<img
					src="/resources/img/LG_gram.jpg" class="card-img-top" alt="LG gram" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">LG그램15</h5>
					<p class="card-text">15Z90N-VP70ML</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : 10세대 쿼드코어 i7</li>
					<li class="list-group-item">메모리 : 8GB</li>
					<li class="list-group-item">그래픽카드 : 인텔 Iris Plus Graphics</li>
					<li class="list-group-item">화면 : 39.62cm(15.6인치)</li>
					<li class="list-group-item">무게 : 1120g</li>
				</ul>
			</div><br>
		</div><br>

		<div class="col-lg-3 col-md-4">
			<!-- MSI 소드 -->
			<div class="card" style="width: 18rem;">
				<img src="/resources/img/MSI_sword.jpg" class="card-img-top" alt="MSI sword" height="200">
				<div class="card-body" style="background-color:rgba(83, 83, 109, 0.747); color:white;">
					<h5 class="card-title">MSI소드</h5>
					<p class="card-text">GF66-A11UD</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">CPU : 코어i7-11세대</li>
					<li class="list-group-item">메모리 : 8GB</li>
					<li class="list-group-item">그래픽카드 : RTX3050 Ti</li>
					<li class="list-group-item">화면 : 39.62cm(15.6인치)</li>
					<li class="list-group-item">무게 : 2.25kg</li>
				</ul>
			</div><br>
		</div><br>
		</div>
		</div>

	<!-- Bootstrap JS -->
	<script
		src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>

</body>
</html>