<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        <title>addItem</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
    
    </head>

    <body>

        
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
            <img src = "https://w.namu.la/s/1238e4e492e16357828d8f9621fcb625103edf44604af4a4f70da228cce0078e0624b2ddb1d37b7cd4090200bdd6dd68c3e818440b626260b092d73b069bdc481ab7b3ade2a8021060f7bc81d4b4366b", width = 150>
            <a class="navbar-brand" href="#">&nbsp;&nbsp;기자재 대여 시스템</a>
          </nav>
          <br>

          <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="login-form bg-light mt-4 p-4">
                        <form action="/managerListAll" method="" class="row g-3">
                            <h4>기자재 추가</h4>
                            <div class="col-12">
                                <label>기자재 코드</label>
                                <input type="text" name="code" class="form-control" placeholder="code">
                            </div>
                            <div class="col-12">
                                <label>기자재 이름</label>
                                <input type="text" name="name" class="form-control" placeholder="name">
                            </div>
                            
                            <div class="col-12">
                                <div class="btn-group" style="float:right">
                                    <a href="/managerListAll"><button type="button" class="btn btn-secondary">취소</button></a>
                                <button type="submit" class="btn btn-dark float-end">등록</button>
                                </div>
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        

    <!-- Bootstrap JS -->
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>

    </body>
</html>