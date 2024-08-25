<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>login Otp Resend </title>
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

        .form-control:disabled, .form-control[readonly] {
            background-color: #e9ecef;
            opacity: 1;
            cursor: not-allowed;
        }

        #ResendOTPButton{
            background-color: rgb(40, 167, 69);
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

    <form action="regenerateOtp" method="post">

        <div class="mainDiv">
            <div class="row mb-1">
                <label for="userEmailId" class="col-sm-5 col-form-label">Email ID</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" name="userEmailId" id="email" value="${mail}">
                    <span id="emailError"></span>
                </div>
            </div>

            <!-- OTP input option -->
            <div class="row mb-1">
                <label for="otp" class="col-sm-5 col-form-label">OTP</label>
                <div class="col-sm-6">
                    <input type="number" class="form-control" name="otp" id="otp" placeholder="Enter OTP" disabled>
                    <span id="otpError" style="color:red">(otp is invalid)</span>
                </div>
            </div>

            <!-- Resend OTP button -->
            <div class="row mb-1">
                <div class="col-sm-5 offset-sm-6">
                    <button type="submit" class="btn btn-secondary" id="ResendOTPButton">Resend OTP</button> </br>
                    <span id="OTPHelpBlock"></span>
                </div>
            </div>

        </div>

        <div class="loginButton">
             <button type="submit" class="btn btn-primary" id="loginButton" disabled>Log in</button>
             <span id="loginError" class="error"></span>
        </div>

    </form>


</body>


</html>