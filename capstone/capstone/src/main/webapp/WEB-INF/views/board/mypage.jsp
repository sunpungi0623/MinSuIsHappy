<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <table class="table table-striped table-hover table-bordered">
              <thead>
                <tr>
                  <th scope="col">이름</th>
                  <th scope="col">학번</th>
                  <th scope="col">전화번호</th>
                </tr>
            </thead>
            <tbody>
              <tr>
                <td>권민수</td>
                <td>1771305</td>
                <td>010-0000-0000</td>
                </td>
              </tr>
            </tbody>
          </table>          
        </div>

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
                  <tr>
                    <td>노트북[10]</td>
                    <td>2022.05.09 ~ 2022.05.16</td>
                    <td>2022.05.16</td>
                    <td><button type="button" class="btn btn-outline-primary">연장 신청</button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>


        <!-- Bootstrap JS -->
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>

    </body>
</html>