<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>기자재 목록 </title>
		<script type="text/javascript">
		
			function search() {
				var name = document.getElementById("searchName").value;
				console.log(name);
						
				location.href = "/"+"?Option=Search&Name="+name;
				//location.href="/"+"?Option=Modify&Name=${dataVO.name}&PhoneNumber=${dataVO.phoneNumber}&Address1=${dataVO.address1}&Address2=${dataVO.address2}&Time=${dataVO.time}";
			}
		</script>
		
 	<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    
 
</head>
<body>
 	<div class="contents">
 	 	<!-- 맨 윗상단 메뉴 -->
        <div class="header">
              <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="#"> 한성대 기자재실</a>
                    <ul class="navbar-nav">
                    <!--Dropdown-->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">기자재 현황</a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="#">Samsung</a></li>
                          <li><a class="dropdown-item" href="#">LG</a></li>
                          <li><a class="dropdown-item" href="#">Apple</a></li>
                          </ul>
                      </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">마이 페이지</a>
                    </li>
                  </ul>
             </nav>

        </div>
        <br>
            <table class="table table-striped">
                <thead>
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">이름</th>
                      <th scope="col">상태</th>
                      <th scope="col"> </th>
                    </tr>
                </thead>
                
                <tbody>
				<c:forEach items="${objList}" var="objectVO" varStatus="status">
					<tr>
                        <td><c:out value="${objectVO.code}"/></td>
                        <td><c:out value="${objectVO.status}"/></td>
                        <td><c:out value="${objectVO.name}" /></td>
                        <td><button type="submit" class="btn btn-dark float-end">대여</button></td>
                     </tr>
                </c:forEach>
                    
    
                </tbody>
              </table>
        </div>
        

    <!— Bootstrap JS —>
	 <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>
