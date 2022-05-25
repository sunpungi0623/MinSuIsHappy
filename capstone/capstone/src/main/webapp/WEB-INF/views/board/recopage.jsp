<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>


        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    </head>
    <body>
        <div class="header">
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
               <img
                  src="https://w.namu.la/s/1238e4e492e16357828d8f9621fcb625103edf44604af4a4f70da228cce0078e0624b2ddb1d37b7cd4090200bdd6dd68c3e818440b626260b092d73b069bdc481ab7b3ade2a8021060f7bc81d4b4366b"
                  , width=150> <a class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
               <ul class="navbar-nav">
   
                  <li class="nav-item"><a class="nav-link" href="#"
                     role="button" aria-expanded="false" onclick="showObjects();">HOME</a>
                     <SCRIPT language="Javascript">
                        
                        function showObjects() {
                        	location.href = "/listAll?mode=sort&brand=All";
                        }
                     </SCRIPT>
                     
               </li>
            
            </ul>
            </nav>
            </div><br>

            <div class="card" style="width: auto; margin-left: 20; margin-left: 20;">
                <div class="card-header">
                  #1
                </div>
                <div class="card-body">
                    <legend>사용 목적을 선택해주세요</legend>
                    <select name = "use">
                        <option value="tesla">강의/문서작업</option>
                        <option value="volvo">안드로이드 어플 개발</option>
                        <option value="mercedes">ios 어플 개발</option>
                        <option value="mercedes">게임 개발</option>
                    </select>
                </div>
            </div><br>

            <div class="card">
                <div class="card-header">
                  #2
                </div>
                <div class="card-body">
                    <legend>휴대성과 성능 중 더 중요한 쪽을 선택해주세요</legend>
                    <select name = "use">
                        <option value="tesla">휴대성</option>
                        <option value="volvo">성능</option>
                    </select>
                </div>
            </div><br>

            <div class="card">
                <div class="card-header">
                  #3
                </div>
                <div class="card-body">
                    <legend>화면 크기를 선택해주세요</legend>
                    <select name = "use">
                        <option value="tesla">작음</option>
                        <option value="volvo">큼</option>
                    </select>
                </div>
            </div><br>

            <button type="button" class="btn btn-dark" style="width: 100;">제출</button>

        <!-- Bootstrap JS -->
        <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
    </body>
</html>