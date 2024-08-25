<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Buy</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap">
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

        body {
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

        nav ul li .buybtn::after{
            width: 75%;
            position: absolute;
        }

        .container{
            margin-top: 10px;
            height: 150vh;
        }

        .col-sm-4{
            margin-bottom: 10px;
        }

        .listing{
        position: fixed;
        width: 100%;
        overflow-y: scroll;
        top: 0;
        bottom: 0;
        }

        .listing-card{
        position: relative;
        display: block;
        border-radius: 6px;
        border: solid 1px rgb(20 89 188 / 37%);
        padding-bottom: 10px;
        }

        .list-img img{
        border-top-left-radius: 6px;
        border-top-right-radius: 6px;
        }

        .status {
        width: 92%;
        position: absolute;
        top: 8px;
        left: 15px;
        color:rgba(6, 6, 6, 0.901);
        border: 1px solid rgba(189, 16, 16, 0.236);
        background-color: rgb(206 97 97 / 10%);
        backdrop-filter: blur(2px);
        border-radius: 5px;
        padding: 3px 9px;
        font-size: 20px;
        font-weight: 500;
        }

        .property-info p{
        margin: 3px;
        }

        .p-2 {
            padding: .5rem !important;
            margin-top: 35px;
        }

        .row{
        width: 100%;
        text-align: left;
        }

        #price {
        color:#000;
        font-size: 25px;
        font-weight: 550;
        }

        p b{
            font-weight: normal;
        }

        #homeIcon{
        color: white;
        border: 2px solid #f5f3f3;
        border-radius: 3px;
        padding: 4px 3px;
        }


    </style>

</head>


<body>

    <div id="header">
        <nav>

            <img src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" class="logo">
            <ul>
                <li> <a href="home.jsp">Home</a></li>
                <li> <a href="#" class="buybtn">List Property</a></li>
            </ul>

        </nav>
    </div>


    <div class="container text-center">
        <div class="row">
            <c:forEach items = "${ListOfPropertyEntity}" var="propertyEntity">

            <div class="col-sm-4">
                <div class="listing-card">
                    <div class="list-img" style="background-color: black">
                        <h1 class="status" > ${propertyEntity.getPropertyType()} </h1>

                    </div>

                    <div class="property-info p-2">
                        <div class="row">

                                <p id="price"> <i class="fa-solid fa-indian-rupee-sign"></i> ${propertyEntity.getPropertyPrice()} </p>
                                <p> <i class="fa-solid fa-building" style="width: 25px;"></i> ${propertyEntity.getPropertyName()} </p>
                                <p> <i class="fa-solid fa-user" style="width: 25px;"></i> ${propertyEntity.userEntity.getUserName()} </p>
                                <p> <i class="fa-solid fa-phone" style="width: 25px;"></i> ${propertyEntity.userEntity.getPhoneNumber()} </p>
                                <p> <i class="fa-solid fa-location-dot" style="width: 25px;"></i> ${propertyEntity.getPropertyAddress()} </p>
                                <p> <i class="fa-solid fa-chart-area" style="width: 25px;"></i> ${propertyEntity.getPropertyArea()} <b>Sqft</b> </p>

                        </div>
                    </div>

                    <div class="submitButton">
                        <a href="propertyBid.jsp?propertyId=${propertyEntity.getPropertyId()}&propertyName=${propertyEntity.getPropertyName()}" ><button type="submit" class="btn btn-primary" id="submitButton" style="background-color: rgb(21, 133, 161); width: 100%;">BID</button></a>
                    </div>

                </div>
            </div>
            </c:forEach>

        </div>
    </div>


</body>
</html>