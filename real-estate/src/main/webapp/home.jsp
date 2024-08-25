<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <script src="https://kit.fontawesome.com/578ffcca4c.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <style>

        *{
            margin: 0;
            padding: 0;
        }

        html{
            scroll-behavior: smooth;
        }

        body{
            background-color: #fff;
            color: black;
        }

        #header{
            width: 100%;
            min-height:100vh;
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

        .user-pic{
            width: 40px;
            border-radius: 50%;
            cursor: pointer;
            margin-left: 30px;
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

        .sub-menu-wrap{
            position: absolute;
            top: 100%;
            right: 10%;
            width: 320px;
            color: #24292f;
            max-height: 0px;
            overflow: hidden;
            transition: max-height 0.5s;

        }

        .sub-menu-wrap.open-menu{
            max-height: 400px;
        }

        .sub-menu{
            background: #fff;
            padding: 20px;
            margin: 10px;
        }

        .user-info{
            display: flex;
            align-items: center;
        }
        .user-info h3{
            font-weight: 600;
        }

        .user-info img{
            width: 60px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .sub-menu hr{
            border: 0;
            height: 2px;
            width: 100%;
            background-color: #ccc;
            margin: 15px 0 10px;
        }

        .sub-menu-link{
            display: flex;
            align-items: center;
            text-decoration: none;
            color: #525252;
            margin: 12px 0;
        }

        .sub-menu-link p{
            width: 100%;
            margin-bottom: 0rem;
        }

        .sub-menu-link img{
            width: 40px;
            background: #e5e5e5;
            border-radius: 50%;
            padding: 8px;
            margin-right: 15px;
        }
        .sub-menu-link span{
            font-size: 22px;
            transition: transform 0.5s;
        }

        .sub-menu-link:hover span{
            transform: translateX(5px);
        }

        .sub-menu-link:hover p{
            font-weight: 600;
            color: #a39f9f;
        }


        .sub-menu-edit-wrap{
            position: absolute;
            top: 150%;
            right: 20%;
            width: 900px;
            color: #24292f;
            max-height: 0px;
            overflow: hidden;
            transition: max-height 0.5s;
        }

        .sub-menu-edit-wrap.open-edit-menu{
            max-height: 500px;
        }

        .sub-menu-edit{
            background: #fff;
            padding: 20px;
            margin: 10px;
        }

        .edit-user-info{
            align-items: center;
        }
        .edit-user-info h1{
            font-size: 25px;
        }

        .sub-menu-edit hr{
            border: 0;
            height: 2px;
            width: 100%;
            background-color: #ccc;
            margin: 15px 0 10px;
        }

        .submitButton{
            display: flex;
            justify-content: space-around;
        }


        .message {
            margin: 0;
            padding: 10px;
            border-radius: 5px;
            font-size: 18px;
            text-align: center;
            position: fixed;
            top: 16px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            display: none;
            width: 100%;
            max-width: 500px;
            background-color: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(1px);
        }

        .message.success {
            background-color: rgba(0, 255, 0, 0.7);
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .message.error {
            background-color: rgba(255, 0, 0, 0.7);
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .message.info {
            color: #014653;
            border: 1px solid #6accdb7c;
        }

    </style>

</head>


<body>

    <div id="header">

        <nav>

            <img src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" class="logo">
            <ul>
                <li> <a href="home.jsp">Home</a></li>
                <li> <a href="propertySell.jsp?id=${userId}">Sell</a></li>
                <li> <a href="reviewProperty?id=${userId}">Review</a></li>
                <li> <a href="buyProperty?id=${userId}">List Property</a></li>
            </ul>
            <img src="images/user.jpg" class="user-pic" onclick="toggleMenu()">

            <div class="sub-menu-wrap" id="subMenu">
                <div class="sub-menu">
                    <div class="user-info">
                        <img src="images/user.jpg">
                        <h3>${user.getUserName()}</h3>
                    </div>
                    <hr>

                    <a href="#" class="sub-menu-link" onclick="toggleEditMenu()">
                        <img src="images/profile.png">
                        <p>Edit Profile</p>
                        <span>></span>
                    </a>

                    <a href="#" class="sub-menu-link">
                        <img src="images/setting.png">
                        <p>Settings & Privacy</p>
                        <span>></span>
                    </a>

                    <a href="#" class="sub-menu-link">
                        <img src="images/help.png">
                        <p>Help & Support</p>
                        <span>></span>
                    </a>

                    <a href="<c:url value='/userLogout' />" class="sub-menu-link" onclick="clearMenuStates()">
                        <img src="images/logout.png">
                        <p>Logout</p>
                        <span>></span>
                    </a>
                </div>
            </div>


            <div class="sub-menu-edit-wrap" id="editMenu">
                <div class="sub-menu-edit">
                    <div class="edit-user-info">
                        <h1>Your Profile Info in Real Estate Services</h1>
                        Personal info and options to manage it.
                    </div>
                    <hr>

                    <form action="updateProfile" method="post">
                        <div class="mainDIV">

                            <div class="row mb-3">
                                <label for="userName" class="col-sm-4 col-form-label">Name</label>
                                <div class="col-sm-8">
                                  <input type="text" class="form-control" value="${sessionScope.user.userName}" name="userName" id="userName" placeholder="Name" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="userEmailId" class="col-sm-4 col-form-label">Email ID</label>
                                <div class="col-sm-8">
                                  <input type="text" class="form-control" value="${sessionScope.user.userEmailId}" name="userEmailId" id="userEmailId" placeholder="user email id" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="phoneNumber" class="col-sm-4 col-form-label">Phone Number</label>
                                <div class="col-sm-8">
                                  <input type="number" class="form-control" value="${sessionScope.user.phoneNumber}" name="phoneNumber" id="phoneNumber" placeholder="phone number" required>
                                </div>
                            </div>

                            <div class="submitButton">
                                <button type="submit" class="btn btn-primary" id="submitButton" style="color: rgb(255, 253, 253); background-color: rgb(230, 152, 17); width: 45%;">Submit</button>
                                <button type="reset" class="btn btn-primary" id="cancelButton" style="color: rgb(255, 255, 255); background-color: rgba(230, 152, 17, 0.947); width: 45%;">Cancel</button>
                            </div>

                        </div>
                    </form>

                </div>
            </div>

                <div id="message" class="message ${messageType}" style="display: none">
                    ${message}
                </div>

            <c:if test="${not empty message}">
                <div id="message" class="message ${messageType}">
                    ${message}
                </div>
            </c:if>

        </nav>


    </div>


    <script>

        let subMenu = document.getElementById("subMenu");
        let editMenu = document.getElementById("editMenu");
        let submitButton = document.getElementById("submitButton");
        let cancelButton = document.getElementById("cancelButton");

        // toggle the subMenu display
        function toggleMenu(){
            subMenu.classList.toggle("open-menu");
            if (subMenu.classList.contains("open-menu")) {
                localStorage.setItem("subMenuState", "open");
            } else {
                localStorage.setItem("subMenuState", "closed");
            }
        }

        // toggle the editMenu display
        function toggleEditMenu(){
            editMenu.classList.toggle("open-edit-menu");
            if (editMenu.classList.contains("open-edit-menu")) {
                localStorage.setItem("editMenuState", "open");
            } else {
                localStorage.setItem("editMenuState", "closed");
            }
        }


        // Clear menu states on logout
        function clearMenuStates() {
            localStorage.removeItem("subMenuState");
            localStorage.removeItem("editMenuState");
        }

        // Event listener for the submit button in the edit menu
        submitButton.addEventListener("click", function() {
            showMessage("Your profile was updated successfully. Thank you!", "info");
        });

        // Event listener for the cancel button in the edit menu
        cancelButton.addEventListener("click", function() {
            editMenu.classList.remove("open-edit-menu");
            localStorage.setItem("editMenuState", "closed");
            showMessage("You don't want to update your profile.", "info");
        });

        function showMessage(msg, type) {
            if (message) {
                message.innerHTML = msg;
                message.className = 'message ' + type;
                message.style.display = 'block';

                setTimeout(function() {
                    message.style.display = 'none';
                }, 10000); // Hide after 10 seconds
            }
        }


        // Check the menu states on page load
        window.onload = function() {
            if (localStorage.getItem("subMenuState") === "open") {
                subMenu.classList.add("open-menu");
            }
            if (localStorage.getItem("editMenuState") === "open") {
                editMenu.classList.add("open-edit-menu");
            }
        }


    </script>


</body>
</html>