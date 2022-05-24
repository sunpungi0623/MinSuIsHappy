<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        
        <title>Create account</title>

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
                            <h4>회원가입</h4>
                            <div class="col-12">
                                <label>ID</label>
                                <input id="userId" type="text" class="form-control" placeholder="학번을 입력해주세요.">
                            </div>
                            <div class="col-12">
                                <label>Password</label>
                                <input id="password" type="password" class="form-control" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <div class="col-12">
                                <label>User name</label>
                                <input id="userName" type="text" class="form-control" placeholder="이름을 입력해주세요.">
                            </div>
                            <div class="col-12">
                                <label>User Phone number</label>
                                <input id="userPhone" type="text" class="form-control" placeholder="핸드폰번호를 입력해주세요.">
                            </div>
                            
                            <div class="col-12">
                            <SCRIPT language="Javascript">
                        	function submitRegister() {
                        		var userId = document.getElementById("userId").value;
                        		var userName = document.getElementById("userName").value;
                        		var password = document.getElementById("password").value;
                        		var userPhone = document.getElementById("userPhone").value;
                        		
                        		
                        		location.href="/login?mode=register&userName="+userName+"&password="+password+"&userId="+userId+"&userPhone="+userPhone;
                        	}
                        
                        </SCRIPT>
							<input type="button" class="btn btn-dark float-end" value="회원가입" onclick="submitRegister();" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    <!— Bootstrap JS —>
    <script src="https://www.markuptag.com/bootstrap/5/js/bootstrap.bundle.min.js"></script>

    </body>
</html>