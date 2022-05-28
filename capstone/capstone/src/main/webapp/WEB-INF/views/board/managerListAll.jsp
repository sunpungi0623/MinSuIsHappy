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
         <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
				<img src = "/resources/img/logo.png", width = 150>
				<a class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
         <ul class="navbar-nav">
            <!--Dropdown-->
            <li class="nav-item dropdown"><a
               class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
               role="button" aria-expanded="false">기자재 현황</a>
               <ul class="dropdown-menu">
                  <SCRIPT language="Javascript">
                     function showSamsungs() {
                        location.href = "/managerListAll?mode=sort&brand=samsung";
                     }

                     function showLGs() {
                        location.href = "/managerListAll?mode=sort&brand=lg";
                     }

                     function showMSIs() {
                        location.href = "/managerListAll?mode=sort&brand=msi";
                     }

                     function showApples() {
                        location.href = "/managerListAll?mode=sort&brand=apple";
                     }

                     function showObjects() {
                        location.href = "/managerListAll?mode=sort&brand=All";
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
               
            </SCRIPT> <a class="nav-link" href="/notebookList" value="mypage">기자재 정보</a></li>
            <a class="nav-link" href="/reqList?mode=show" value="mypage">신청 현황</a>
            <a class="nav-link" href="/rentList?mode=show" value="mypage">대여 현황</a>
            <a class="nav-link" href="/returnpage" value="mypage">대여 기록</a>
            </li>
         </ul>
         </nav>

      </div>
      <br>
      
      	<div class="container h-100">
		<div class="row d-flex justify-content-center" style="width:auto;">
      
		<table class="table table-striped" style="border:1px solid black; background-color:white;">
         <thead>
            <tr>
               <th scope="col">코드</th>
               <th scope="col">기자재명</th>
               <th scope="col">상태</th>
               <th scope="col" style="text-align: right"><a href="/addObject"><button type="button" class="btn btn-primary">추가</button></a></th>
            </tr>
         </thead>

         <tbody>
            <script>
               function deleteObj(ocode) {
                  location.href = "/managerListAll?mode=delete&code=" + ocode;
                  alert(ocode + '물품이 삭제되었습니다.');
               }
            </script>
            <c:forEach items="${objList}" var="objectVO" varStatus="status">
               <tr>

                  <td><c:out value="${objectVO.code}" /></td>
                  <td><c:out value="${objectVO.name}" /></a></td>
                  <td><c:out value="${objectVO.status}" /></td>
                  <td><button type="submit" class="btn btn-danger float-end" onclick="deleteObj('${ objectVO.code }');">삭제</button></td>
               </tr>
            </c:forEach>


         </tbody>
      </table>
   </div></div></div>


   <!— Bootstrap JS —>
   <script
      src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>