<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Bid</title>
    <script src="https://kit.fontawesome.com/578ffcca4c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

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

        body{
            line-height: 1.5;
            color: #333;
            background-color: rgb(225, 235, 250);
            overflow-x:hidden;
        }

        #header{
            width: 100%;
            background-color: rgb(225, 235, 250);
            color: #f5f3f3;
        }

        nav{
            background-color: #24292f;
            height: 80px;
            width: calc(100vw - 110px);
            margin: 0px 55px;
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

        a:hover{
            color: rgb(226, 212, 201);
        }

        #backIcon{
            color: white;
            // border: 2px solid #f5f3f3;
            // border-radius: 50%;
            padding: 4px 3px;
        }

        .btn{
            display: block;
            font-weight: bolder;
            margin: 30px auto;
            width: fit-content;
            border: 1px solid #fc3473;
            padding: 6px 25px;
            border-radius: 8px;
            text-decoration: none;
            color: #f5f3f3;
            background-color: #ff004f;
        }

        h1{
        display: flex;
        justify-content: center;
        align-items: center;
        color: black;
        font-size: 30px;
        margin-top: 5px;
        }

        form{
        display: flex;
        flex-direction: column;
        justify-content: centre;
        align-items: center;
        margin-top: 25px;
        }

        .mainDIV{
        width: 50%;
        color: black;
        background-color: rgb(161 82 37 / 34%);
        border-radius: 10px;
        padding: 15px;
        width: 400px;
        //border: shadow;
        }

        #submitButton{
            color: black;
            background-color: #0000004f;
            border-radius: 8px;
            border: solid 2px #00000045;
            transition: 0.5s;
        }

        #submitButton:hover{
            color: white;
            background-color: #000000a1;
        }

    </style>

</head>
<body>

    <div id="header">
        <nav>

            <img src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" class="logo">
            <ul>
                <li> <a href="buyProperty?id=${userId}" class="">Back</a></li>
            </ul>

        </nav>
    </div>

    <form action="bidProperty" method="post">
        <div class="mainDIV">
            <div class="mb-3">
               Property Name <input type="text" class="form-control" value="${param.propertyName}" id="" name="propertyName" placeholder="property Name" readonly>
             </div>

            <div class="mb-3">
                <label for="bidAmount" class="form-label">Bid Amount</label>
                <input type="number" class="form-control" name="bidAmount" id="bidAmount" required>
            </div>

            <div class="mb-3" hidden>
               property id = <input type="number" class="form-control" value="${param.propertyId}" id="" name="propertyId" placeholder="property id">
             </div>

            <div class="mb-3" hidden>
              user id = <input type="number" class="form-control" value="${userId}" id="" name="id" placeholder="user id">
            </div>

            <div class="submitButton" >
                <button type="submit" class="btn btn-primary" id="submitButton" style="width: 100%;">Submit</button>
            </div>

        </div>


    </form>


</body>
</html>