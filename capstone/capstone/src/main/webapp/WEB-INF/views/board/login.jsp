<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://www.markuptag.com/bootstrap/5/css/bootstrap.min.css">
</head>
<body>
  <br><br>
  <DIV style = "text-align: center;">
      <img src = "/resources/img/logo.png", width = 400>
  </DIV>
  
  <body style = "background-color:#0E0C32">

    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="login-form bg-light mt-4 p-4">
                    <form action="" method="" class="row g-3">
                        <h4>한성대학교 기자재실</h4>
                        <div class="col-12">
                            <label>studentID</label>
                            <input id="userId"  type="text"  class="form-control" placeholder="학번">
                        </div>
                        <div class="col-12">
                            <label >Password</label>
                            <input id="password" type="password" class="form-control" placeholder="비밀번호">
                        </div>
                       
                        <div class="col-12">
                        <SCRIPT language="Javascript">
                           function submitLogin() {
                              
                              var userId = document.getElementById("userId").value;
                              var password = document.getElementById("password").value;
                              
                              
                              
                              location.href="/login?mode=login&userId="+userId+"&password="+password;
                           }
                        
                        </SCRIPT>
                           <input type="button" class="btn btn-dark float-end" value="log in" onclick="submitLogin();" />
                            
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">Have not account yet ? <a href="/register">Sign up</a></p>
                        
                        
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!— Bootstrap JS —>
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>