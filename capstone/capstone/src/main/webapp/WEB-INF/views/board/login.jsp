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
      <img src = "https://w.namu.la/s/1238e4e492e16357828d8f9621fcb625103edf44604af4a4f70da228cce0078e0624b2ddb1d37b7cd4090200bdd6dd68c3e818440b626260b092d73b069bdc481ab7b3ade2a8021060f7bc81d4b4366b", width = 400>
  </DIV>
  
  <body style = "background-color:#0E0C32">

    <div class="container">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="login-form bg-light mt-4 p-4">
                    <form action="" method="" class="row g-3">
                        <h4>한성대학교 기자재실</h4>
                        <div class="col-12">
                            <label>Username</label>
                            <input id="username"  type="text" name="username" class="form-control" placeholder="Username">
                        </div>
                        <div class="col-12">
                            <label >Password</label>
                            <input id="password" type="password" name="password" class="form-control" placeholder="Password">
                        </div>
                       
                        <div class="col-12">
                        <SCRIPT language="Javascript">
                        	function submitLogin() {
                        		
                        		var name = document.getElementById("username").value;
                        		var password = document.getElementById("password").value;
                        		
                        		
                        		
                        		location.href="/login?name="+name+"&password="+password;
                        	}
                        
                        </SCRIPT>
                            <button type="submit" class="btn btn-dark float-end" onclick = submitLogin()>Login</button>
                        </div>
                    </form>
                    <hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">Have not account yet? <a href="#">Signup</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>
</body>
</html>