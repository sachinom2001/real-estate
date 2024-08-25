<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Real Estate</title>

    <style>

        * {
            font-family:"poppins",sans-serif;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html{
            scroll-behavior: smooth;
        }

        body {
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

        .btn{
            display: block;
            margin: 50px auto;
            width: fit-content;
            border: 1px solid #ea6214dd;
            padding: 14px 50px;
            border-radius: 6px;
            text-decoration: none;
            color: #fff;
            transition: 0.5s;
            background-color: #24292f;
        }

        .btn:hover{
            background: #ea6214dd;
        }

    </style>

</head>


<body>

    <div id="header">
        <nav>

            <img src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" class="logo">
            <ul>
                <li> <a href="register.jsp"><button class="btn"> REGISTER</button></a> </li>
                <li> <a href="login.jsp" ><button class="btn"> LOG IN</button></a> </li>
            </ul>

        </nav>

    </div>

</body>

</html>
