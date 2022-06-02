<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>info</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
</head>
<body>
	<div class="header">
		<nav class="navbar navbar-expand-sm navbar-dark bg-dark" style="position: fixed; top: 0; left: 0; right: 0; z-index: 2;">
			<img src="/resources/img/logo.png" , width=150>
				<a class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#" role="button"
					aria-expanded="false" onclick="showObjects();">HOME</a> <SCRIPT
						language="Javascript">
						function showObjects() {
							location.href = "/listAll?mode=sort&brand=All";
						}
					</SCRIPT>
				<li class="nav-item">
					<a class="nav-link" href="/info" value="info">공지사항</a></li>
					<a class="nav-link" href="/mypage" value="mypage">마이페이지</a>
					<a class="nav-link" href="/notebookList" value="notebookList">기자재 정보</a>
					<a class="nav-link" href="/recopage" value="recopage">노트북 추천</a>
					<a class="nav-link" href="/logout" value="logout">로그아웃</a>
			</ul>
		</nav>
	</div>

	<br>
	<br>
	<br>
	<br>

	<div class="container h-100" style="z-index: 1;">
		<div class="row d-flex justify-content-center" style="width: auto;">

			<p></p>

			<div class="card">
				<h5 class="card-header">노트북 대여신청 및 반납</h5>
				<div class="card-body">
					<p class="card-text">
						<ul>
      						<li>본교 컴퓨터공학부 학생을 대상으로 노트북을 대여가 가능합니다.</li>
      						<li>대여버튼 클릭 → 과사무실 방문(신분증/학생증 본인확인) → 물품수령</li>
      						<li>1개월 장기대여를 원칙으로 합니다.</li>
      						<li>노트북 반납 시, 대여신청자는 반드시 관리자의 입회아래 노트북의 사용가능 여부를 확인 받아야 정상적인 반납이 완료된 것으로 간주합니다.</li>
      						<li>노트북 반납은 대여신청자 본인의 직접 반납을 원칙으로 합니다.</li>
    					</ul>
    				</p>
  				</div>
			</div>
			<div class="card">
  				<h5 class="card-header">이용수칙</h5>
  				<div class="card-body">
    				<p class="card-text">
						<ul>
      						<li>노트북 대여시 대여신청자는 반드시 노트북의 정상가동 여부를 확인하여야 합니다. 또한 대여 후 노트북에 문제가 발생 했다면 즉시 컴퓨터공학과 과사무실(공학관A동 104호)에서 확인을 받으셔야 합니다.</li>
      						<li>연장을 원할 시 반납일 하루 전 과사무실 방문 후 연장해야 합니다.</li>
    					</ul>
    				</p>
  				</div>
			</div>
			<div class="card">
  				<h5 class="card-header">경고문</h5>
  				<div class="card-body">
    					<p class="card-text">
    						<ul>
    							<li>대여 받은 노트북은 반드시 기한 내에 반납하여야 하며 미반납의 경우 정상적인 반납이 이루어질 때까지 불이익을 감수해야함을 안내드립니다.</li>
    							<li>경고사항</li>
    								<ul>
    									<li>대리반납</li>
    									<li>대여시간 이후 반납</li>
    									<li>노트북 전원을 끄지 않은 상태로 반납</li>
    								</ul>
    						</ul>
    					</p>
  				</div>
			</div>
			<div class="card">
  				<h5 class="card-header">전화번호/수령장소</h5>
  				<div class="card-body">
    					<p class="card-text">
    					한성대학교 공학관A동 104호<br>
    					02-760-4137,4438,5772
    					</p>
  				</div>
			</div>
			
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script
		src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>