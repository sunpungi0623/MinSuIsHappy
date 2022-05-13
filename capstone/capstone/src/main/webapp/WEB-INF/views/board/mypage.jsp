<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        <title>mypage</title>

        <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
          <img src = "https://w.namu.la/s/1238e4e492e16357828d8f9621fcb625103edf44604af4a4f70da228cce0078e0624b2ddb1d37b7cd4090200bdd6dd68c3e818440b626260b092d73b069bdc481ab7b3ade2a8021060f7bc81d4b4366b", width = 150>
          <a class="navbar-brand" href="#">&nbsp;&nbsp;한성대 기자재실</a>
        </nav>
        <br>

        <div class="card text-white">
          <div class="card-header bg-secondary">내 정보</div>
          <div class="card-body text-dark">
          
             
            <h5 class="card-title"><b>이름</b></h5>
              <p class="card-text"><c:out value="${userList.getUserName()}"/></p>  <!-- 왜 돼? -->
              <h5 class="card-title"><b>학번</b></h5>
            <p class="card-text"><c:out value="${userList.getID()}"/></p> <!-- 왜 돼? -->
              <h5 class="card-title"><b>전화번호</b></h5>
              <p class="card-text"><c:out value="${userList.getUserPhone()}"/></p>  <!-- 왜 돼? -->

          </div></div>          

          <br>

          <div class="card text-white">
            <div class="card-header bg-secondary">내가 빌린 기자재</div>
            <div class="card-body text-dark">
              <table class="table table-striped table-hover table-bordered">
                  <thead>
                    <tr>
                      <th scope="col">비품명</th>
                      <th scope="col">대여 기간</th>
                      <th scope="col">반납 예정일</th>
                      <th scope="col">연장 신청</th>
                    </tr>
                </thead>
                <tbody>
                
                <c:forEach items="${objList}" var="objectVO" varStatus="status">
                
                  <tr>
                    <td><c:out value="${objectVO.name}" /></td> 
                    <td><c:out value="${objectVO.rentDate}" /></td>
                    <td><c:out value="${objectVO.returnDate}" /></td>
                    <td><button type="button" class="btn btn-outline-primary">연장 신청</button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
          </div>


        <!— Bootstrap JS —>
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>

    </body>
</html>