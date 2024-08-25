<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>

        *{
            font-family:"poppins",sans-serif;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html{
            scroll-behavior: smooth;
        }

        body{
            background: rgb(225, 235, 250);
            color: black;
        }

        #header{
            width: calc(100vw - 110px);
            margin: 0px 55px;
            background: rgb(225, 235, 250);
            color: #f5f3f3;
        }

        nav{
            background-color: #24292f;
            //background-image: linear-gradient(rgba(0, 0, 0, 0.45), rgba(0, 0, 0, 0.25), transparent);
            height: 80px;
            width: 100%;
            padding: 10px 10%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }

        .logo{
            width: 130px;
        }

        nav ul{
            width: 100%;
            text-align:right;
            margin-bottom: 0;
        }

        nav ul li{
            display: inline-block;
            list-style: none;
            margin: 10px 20px;
        }

        nav ul li a{
            color: #f5f3f3;
            font-size: 18px;
            text-decoration: none;
            position: relative;
        }

        nav ul li a::after{
            content: '';
            width: 0;
            height: 3px;
            background: #ff004f;
            position: absolute;
            left: 0;
            bottom: -6px;
            transition: 0.5s;
        }

        nav ul li a:hover::after{
            width: 100%;
        }

        #BTN{
            display: block;
            margin: 50px auto;
            width: fit-content;
            border: 1px solid #ea6214dd;
            padding: 11px 50px;
            border-radius: 6px;
            text-decoration: none;
            color: #fff;
            transition: 0.5s;
            background-color: #ea6214dd;
            font-size: 14px;
        }

        #BTN:hover{
        }

        form{
            display: flex;
            flex-direction: column;
            justify-content: centre;
            align-items: center;
            margin-top: 25px;
        }

        .mainDiv{
            width:35%;
            color: black;
            background-color: rgb(174, 228, 211);
            border-color:black;
            border-radius: 10px;
            padding:15px;
        }

        h1{
            display: flex;
            justify-content: center;
            align-items: center;
            color: black;
        }

        .loginButton{
            margin-top: 20px;
        }

    </style>

</head>


<body>

    <div id="header">
        <nav>

            <img src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" class="logo">
            <ul>
                <li> <a href="#"><button class="btn" id="BTN"> LOG IN</button></a> </li>
            </ul>

        </nav>

        <div>
            <h1></h1>

        </div>
    </div>

    <form action="otpAction" method="post">

        <div class="mainDiv">
            <div class="row mb-1">
                <label for="userEmailId" class="col-sm-5 col-form-label">Email ID</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" name="userEmailId" id="mail" value="${mail}" onchange="validateEmail()">
                    <span id="emailError"></span>
                </div>
            </div>

            <!-- OTP input option -->
            <div class="row mb-1">
                <label for="otp" class="col-sm-5 col-form-label">OTP</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control" name="otp" id="otp" placeholder="Enter OTP" onchange="validateOTP()">
                    <span id="otpError"></span>
                    <div id="timer"></div>
                </div>
            </div>

        </div>

        <div class="loginButton">
             <button type="submit" class="btn btn-primary" id="loginButton">Log in</button>
             <span id="loginError" class="error"></span>
        </div>

    </form>


    <script>
            // email and otp send ajax ---------

            var emailInput = document.getElementById("mail");
            var otpSendBtn = document.getElementById("sendOTPButton");
            var logInBtn = document.getElementById("loginButton");

            function validateEmail() {

                var emailError = document.getElementById("emailError");
                console.log(emailInput.value);
                console.log(emailError.value);
                var email = emailInput.value.trim(' ');
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (emailPattern.test(email)) {

                    var req = new XMLHttpRequest();
                    console.log(req);
                    req.open("GET","http://localhost:8080/real-estate/getUserEmailID/"+emailInput.value);
                    req.send();

                    req.onload = function(){
                        let respText = this.responseText;
                        console.log(emailError.innerHTML = respText);
                        if(respText === "( email is registered, get otp through your email )"){
                            logInBtn.disabled = false;
                            otpSendBtn.disabled = false;
                        }else{
                            logInBtn.disabled = true;
                            otpSendBtn.disabled = true;
                        }
                    }
                    return true;

                }else {
                    emailError.innerHTML = "invalid email, please check your email  ";
                     emailInput.focus();
                     return false;
                }

                emailError.innerHTML = ""; // Clear any previous error messages
                otpSendBtn.disabled = false;

            }


            // regex for input OTP verify  ----------------

            function validateOTP() {

                var otpInput = document.getElementById("otp");
                var otpError = document.getElementById("otpError");
                console.log(otpInput.value);

                // Regular expression to match exactly 6 digits
                var otpPattern = /^\d{6}$/;

                if (!otpPattern.test(otpInput.value)) {
                    otpError.textContent = "Please enter a valid 6-digit OTP";
                    otpInput.focus();
                    return false;
                }
                else{
                 otpError.textContent = ""; // Clear any previous error message
                 return true;
                }

            }

            // ------------------------------

            var shouldValidateOTP = true;
            var duration = 600; // 10 minutes (600 seconds)    // set timer (10 min)
            var timerDisplay = document.getElementById('timer');

            // updateTimer display
            function updateTimer() {
            var minutes = Math.floor(duration / 60);
            var seconds = duration % 60;
            timerDisplay.textContent = 'Time remaining: ' + minutes + ' minutes ' + seconds + ' seconds';

                // Check if the duration has reached 0
                if (duration <= 0) {
                    timerDisplay.textContent = 'Time expired';
                    clearInterval(timerInterval);         // Stop the timer
                    timerDisplay.textContent = 'OTP expired. Please request a new OTP. ';
                    shouldValidateOTP = false;

                } else {
                    duration--;      // Decrement the duration
                    if (shouldValidateOTP){
                    validateOTP();
                    }
                }
            }

            // Call updateTimer function immediately to avoid initial delay
            updateTimer();

            var timerInterval = setInterval(updateTimer, 1000);       // Update timer every second



    </script>

</body>



</html








