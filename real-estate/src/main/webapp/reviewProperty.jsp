<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Review Property</title>
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

        nav ul li .reviewbtn::after{
            width: 75%;
            position: absolute;
        }


        .main-options{
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }

        .sub-options ul{
            padding-left: 0;
            margin-bottom: 5px;

        }

        .sub-options ul li{
            display: inline-block;
            list-style: none;
            margin: 10px 100px;

        }

        .sub-options ul li a{
            color: #f5f3f3;
            text-decoration: none;
            position: relative;

        }


        #unbid-btn, #bid-btn{
            color: black;
            border: 3px solid teal;
            border-radius: 12px;
            background-color:rgba(170, 213, 248, 0.647);
            transition: 0.5s;
        }

        #unbid-btn:hover, #bid-btn:hover{
            color: white;
            background-color: teal;
        }

        .btn-active {
            color: white !important;
            background-color: teal !important;
            border-color: teal !important;
        }

        .unbid-Table, .bid-Table{
            position: absolute;
            top: 22%;
            left: 20%;
            width: 100%;
            overflow: hidden;
            max-height: 0;
            transition: max-height 0.5s;
        }

        .unbid-Table.open-menu, .bid-Table.open-menu{
            max-height: 100%;
        }

        #main-Table{
            font-size: 18px;
            border-collapse: collapse;
            width:60%;
        }

        th,td{
            border: 3px solid rgb(88, 87, 87);
            text-align:left;
        }

        th{
            color:rgb(230, 125, 87);
        }

        .btn{
            background-color: rgb(42, 40, 40);
            border-color: rgb(2, 77, 253);
        }

        .confirmed {
            background-color: rgb(0, 76, 252);
            color: white;
        }


    </style>

</head>


<body>

    <div id="header">
        <nav>

            <img src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" class="logo">
            <ul>
                <li> <a href="home.jsp">Home</a></li>
                <li> <a href="#" class="reviewbtn">Review Property</a></li>
            </ul>

        </nav>
    </div>


    <div class="main-options">
        <div class="sub-options">
            <ul>
                <li> <a href="#"> <button type="button" class="btn btn-primary" id="unbid-btn" onclick="toggleUnbidMenu()">View Unbid Property Details</button> </a> </li>
                <li> <a href="#"> <button type="button" class="btn btn-primary" id="bid-btn" onclick="toggleBidMenu()">View Bid Property Details</button> </a> </li>
            </ul>
        </div>

        <div class="unbid-Table" id="unbidMenu">
            <table class="table table-dark table-hover" id="main-Table">

                <tr>
                    <th>Property Id</th>
                    <th>Property Name</th>
                    <th>Property Type</th>
                    <th>Property Address</th>
                    <th>Property Area (sqft)</th>
                    <th>Property Price</th>
                </tr>

                    <c:forEach items = "${ListOfUnBidPropertiesForReview}" var="propEntity" varStatus="status">
                        <tr>
                            <td>${propEntity.getPropertyId()}</td>
                            <td>${propEntity.getPropertyName()}</td>
                            <td>${propEntity.getPropertyType()}</td>
                            <td>${propEntity.getPropertyAddress()}</td>
                            <td>${propEntity.getPropertyArea()}</td>
                            <td>${propEntity.getPropertyPrice()}</td>
                        </tr>
                    </c:forEach>

            </table>
        </div>


        <div class="bid-Table" id="bidMenu">
            <table class="table table-dark table-hover" id="main-Table">

                <tr>
                    <th>Property Id</th>
                    <th>Property Name</th>
                    <th>Bidder Name</th>
                    <th>Bidder Phone No</th>
                    <th>Bid Amount</th>
                    <th>Request</th>
                </tr>

                    <c:forEach items = "${ListOfBidEntitiesForReview}" var="bidEntity" varStatus="status">
                        <tr>
                            <td>${bidEntity.propertyEntities.getPropertyId()}</td>
                            <td>${bidEntity.propertyEntities.getPropertyName()}</td>
                            <td>${bidEntity.userEntities.getUserName()}</td>
                            <td>${bidEntity.userEntities.getPhoneNumber()}</td>
                            <td>${bidEntity.getBidAmount()}</td>
                            <td>
                                <div class="col-auto" >
                                    <button type="submit" class="btn btn-primary toggle-button" data-id="${status.index}" style="width: 100%;">Confirm</button>
                                </div>
                            </td>
                        </tr>

                    </c:forEach>

            </table>
        </div>

    </div>


    <script>

        document.querySelectorAll('.toggle-button').forEach(button => {
            // Get the buttons ID
            const buttonId = button.getAttribute('data-id');
            // Check local storage for the buttons state
            const buttonState = localStorage.getItem('buttonState_' + buttonId);
            if (buttonState) {
                button.textContent = buttonState;
                if (buttonState === 'Confirmed') {
                    button.classList.add('confirmed');
                }
            }

            button.addEventListener('click', function() {
                if (this.textContent === 'Confirm') {
                    this.textContent = 'Confirmed';
                    this.classList.add('confirmed');
                } else {
                    this.textContent = 'Confirm';
                    this.classList.remove('confirmed');
                }
                // Save the state to local storage
                localStorage.setItem('buttonState_' + buttonId, this.textContent);
            });
        });


        let unbidMenu = document.getElementById("unbidMenu");
        let unbidbtn = document.getElementById("unbid-btn");
        let bidMenu = document.getElementById("bidMenu");
        let bidBtn = document.getElementById("bid-btn");

        function toggleUnbidMenu() {
            unbidMenu.classList.toggle("open-menu");
            if (unbidMenu.classList.contains("open-menu")) {
                localStorage.setItem("unbidMenuState", "open");
                unbidbtn.classList.add("btn-active");
            } else {
                localStorage.setItem("unbidMenuState", "closed");
                unbidbtn.classList.remove("btn-active");
            }
        }

        function toggleBidMenu() {
            bidMenu.classList.toggle("open-menu");
            if (bidMenu.classList.contains("open-menu")) {
                localStorage.setItem("bidMenuState", "open");
                bidBtn.classList.add("btn-active");
            } else {
                localStorage.setItem("bidMenuState", "closed");
                bidBtn.classList.remove("btn-active");
            }
        }

        // Check the menu state on page load
        window.onload = function() {
            if (localStorage.getItem("unbidMenuState") === "open") {
                unbidMenu.classList.add("open-menu");
                unbidbtn.classList.add("btn-active");
            }
            if (localStorage.getItem("bidMenuState") === "open") {
                bidMenu.classList.add("open-menu");
                bidBtn.classList.add("btn-active");
            }
        }

    </script>


</body>
</html>