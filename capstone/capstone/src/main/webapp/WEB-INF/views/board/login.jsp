<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<body style="background-color:#0E0C32;">

<div class="login-container">
    <div>
        <div class="login-form">
            <form>
                <img src="/resources/img/logo5.png" width=300><br><br>
                <div>
                    <label>ID</label><br>
                    <input id="userId" type="text" class="login-input" placeholder="학번">
                </div>
                <br>
                <div>
                    <label>Password</label><br>
                    <input id="password" type="password" class="login-input" placeholder="비밀번호">
                </div>

                <div>
                    <SCRIPT language="Javascript">
                        function submitLogin() {

                            var userId = document.getElementById("userId").value;
                            var password = document.getElementById("password").value;


                            location.href = "/login?mode=login&userId=" + userId + "&password=" + password;
                        }

                    </SCRIPT>
                    <br>
                    <div style="text-align: center;">
                        <input type="button" class="login-button" value="로그인" onclick="submitLogin();"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="module">
    // Import the functions you need from the SDKs you need
    import { initializeApp } from "https://www.gstatic.com/firebasejs/9.9.3/firebase-app.js";
    import { getAnalytics } from "https://www.gstatic.com/firebasejs/9.9.3/firebase-analytics.js";
    // TODO: Add SDKs for Firebase products that you want to use
    // https://firebase.google.com/docs/web/setup#available-libraries

    // Your web app's Firebase configuration
    // For Firebase JS SDK v7.20.0 and later, measurementId is optional
    const firebaseConfig = {
        apiKey: "AIzaSyBBrYeH8N5zmDkQkHJYNrvExFjV3r94M6I",
        authDomain: "hansungrentsystem-73c03.firebaseapp.com",
        projectId: "hansungrentsystem-73c03",
        storageBucket: "hansungrentsystem-73c03.appspot.com",
        messagingSenderId: "846372263330",
        appId: "1:846372263330:web:be62ea08495bbe551b8efb",
        measurementId: "G-M6SHFY1RFB"
    };

    // Initialize Firebase
    const app = initializeApp(firebaseConfig);
    const analytics = getAnalytics(app);
</script>

</body>
</html>