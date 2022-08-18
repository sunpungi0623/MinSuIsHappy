<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    
    <link rel="stylesheet" href="css/style.css">
</head>

<link rel="stylesheet" href="resources/css/main.css">

<body>
  <br><br>
  	<body style= "background-color:#0E0C32;">

    <div class="login-container">
            <div>
                <div class="login-form">
                    <form>
                        <img src = "/resources/img/logo5.png" width = 300><br><br>
                        <div>
                            <label>ID</label><br>
                            <input id="userId"  type="text"  class="login-input" placeholder="학번">
                        </div><br>
                        <div>
                            <label >Password</label><br>
                            <input id="password" type="password" class="login-input" placeholder="비밀번호">
                        </div>
                       
                        <div>
                        <SCRIPT language="Javascript">
                           function submitLogin() {
                              
                              var userId = document.getElementById("userId").value;
                              var password = document.getElementById("password").value;
                              
                              
                              
                              location.href="/login?mode=login&userId="+userId+"&password="+password;
                           }
                        
                        </SCRIPT><br>
                        <div style="text-align: center;">
                           <input type="button" class="login-button" value="로그인" onclick="submitLogin();"/>
                        </div>
                    </form>
                </div>
            </div>
    </div>

</body>



</html>