<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
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

        h1{
            display: flex;
            justify-content: center;
            align-items: center;
            color: black;
        }

        form{
            display: flex;
            flex-direction: column;
            justify-content: centre;
            align-items: center;
            margin: 25px 0px 20px 0px;
        }

        .mainDiv{
            width:50%;
            color: black;
            background-color: rgb(174, 228, 211);
            border-radius: 10px;
            padding:15px;
        }

        .registerButton{
            margin-top:20px;
        }

    </style>

</head>


<body>

    <div id="header">
        <nav>

            <img src="https://www.x-workz.in/static/media/Logo.cf195593dc1b3f921369.png" class="logo">
            <ul>
                <li> <a href="#"><button class="btn" id="BTN"> REGISTER</button></a> </li>
            </ul>

        </nav>

    </div>

       <form onchange="validateForm()" action="register" method="post">
             <div class="mainDiv">
                 <div class="row mb-1">
                       <label for="userName" class="col-sm-4 col-form-label">Name</label>
                       <div class="col-sm-7">
                         <input type="text" class="form-control" name="userName" id="userName" placeholder="Name" onchange="validateName()" minlength="5" maxlength="20" required>
                         <span id="nameError">(please enter your full name)</span> <br>
                       </div>
                 </div>

                 <div class="row mb-1">
                      <label for="userEmailId" class="col-sm-4 col-form-label">Email ID</label>
                      <div class="col-sm-7">
                         <input type="email" class="form-control" name="userEmailId" id="mail" placeholder="Email ID" onchange="validateEmail()" required>
                         <span id="emailError"></span> <br>
                      </div>
                 </div>

                <div class="row mb-1">
                      <label for="aadhaarNumber" class="col-sm-4 col-form-label">Aadhaar Number</label>
                      <div class="col-sm-7">
                         <input type="number" class="form-control" name="aadhaarNumber" id="aadhaarNum" placeholder="Aadhaar No" onchange="validateAadhaarNumber()" oninput="limitDigits(this,12)" required>
                         <span id="aadhaarNumError"></span> <br>
                    </div>
                </div>

                 <div class="row mb-1" >
                      <label for="pancardNumber" class="col-sm-4 col-form-label">Pan card Number</label>
                      <div class="col-sm-7">
                         <input type="text" class="form-control" name="pancardNumber" id="pancardNum" placeholder="Pan Card No" onchange="validatePancardNumber()" maxlength="10" required>
                         <span id="pancardNumError"></span> <br>
                      </div>
                 </div>


                <div class="row mb-1">
                       <label for="phoneNumber" class="col-sm-4 col-form-label">Phone Number</label>
                       <div class="col-sm-7">
                          <input type="number" class="form-control" name="phoneNumber" id="phoneNum" placeholder="Phone No" onchange="validatePhoneNumber()" oninput="limitDigits(this,10)" required>
                          <span id="phoneNumError"></span> <br>
                       </div>
                </div>

                <div class="row mb-1">
                       <label for="address" class="col-sm-4 col-form-label">Address</label>
                       <div class="col-sm-7">
                          <input type="text" class="form-control" name="address" id="address" placeholder="Address" onchange="validateAddress()" required> <br>
                          <span id="addressError"><span/>
                       </div>
                </div>

                <div class="row mb-1">
                       <label for="password" class="col-sm-4 col-form-label">Password</label>
                       <div class="col-sm-7">
                          <input type="text" class="form-control" name="password" id="password" placeholder="Password" onchange="validatePassword()" required> <br>
                          <span id="passwordError">
                             <div id="passwordHelpBlock" class="form-text">
                             Your password must be 8-20 characters long, contain at least one upper case,lower case,numbers and special character but must not contain any spaces or emoji.
                             </div>
                          </span>
                       </div>
                </div>

                <div class="row mb-1">
                    <label for="confirmPassword" class="col-sm-4 col-form-label">Confirm Password</label>
                    <div class="col-sm-7">
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" onchange="validateConfirmPassword()" required>
                        <br>
                        <span id="confirmPasswordError"></span>
                    </div>
                </div>

             </div>

             <div class="registerButton">
                    <button type="submit" class="btn btn-primary" id="registerButton">Register</button>
                    <button type="reset" class="btn btn-primary" id="">Clear</button>
             </div>

       </form>



       <script>


            // name validation -------

            function validateName(){
                var nameInput = document.getElementById("userName");
                var nameError = document.getElementById("nameError");

                if (nameInput.value.length < 5 || nameInput.value.length > 20) {
                    nameError.innerHTML = "(please enter your full name)";
                    return false;
                } else {
                    nameError.innerHTML = "";
                    return true;
                }
            }

            // email ajax ---------

            function validateEmail() {
                var emailInput = document.getElementById("mail");
                var emailError = document.getElementById("emailError");
                console.log(emailInput.value);
                console.log(emailError.value);
                var email = emailInput.value.trim(' ');
                var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

                if (email === "") {
                    emailError.innerHTML = "Email address is required:";
                    emailInput.focus();
                    return false;
                } else if (emailPattern.test(email)) {

                    var req = new XMLHttpRequest();
                    console.log(req);
                    req.open("GET","http://localhost:8080/real-estate/getUserEmailId/"+emailInput.value);
                    req.send();

                    req.onload = function(){
                        let respText = this.responseText;
                        emailError.innerHTML = respText;
                      }
                    return true;
                }else {
                    emailError.innerHTML = "Please enter a valid email address.";
                     emailInput.focus();
                     return false;
                }
                emailError.innerHTML = ""; // Clear any previous error messages
                return true;
            }

            //  aadhaar number ajax --------

            function validateAadhaarNumber(){
                var aadhaarNBInput = document.getElementById("aadhaarNum");
                var aadhaarNBError = document.getElementById("aadhaarNumError");
                console.log(aadhaarNBInput.value);
                console.log(aadhaarNBError.value);
                var aadhaarCard = aadhaarNBInput.value;
                var aadhaarCardPattern = /^[1-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$/;

                if(aadhaarNBInput.value === "" ){
                    aadhaarNBError.innerHTML = "aadhaar number is required :";
                    aadhaarNBInput.focus();
                    return false;
                }else if(aadhaarNBInput.value.length == 12 && aadhaarCardPattern.test(aadhaarCard)){

                    var req = new XMLHttpRequest();
                    console.log(req);
                    req.open("GET","http://localhost:8080/real-estate/getAadhaarNumber/"+aadhaarNBInput.value);
                    req.send();

                    req.onload = function(){
                    let respText = this.responseText;  // here responseText will come from a method of controller
                    aadhaarNBError.innerHTML = respText;
                }
                    return true;
                }else {
                    aadhaarNBError.innerHTML = "please enter a valid aadhaar number :";
                    aadhaarNBInput.focus();
                    return false;
                }
                aadhaarNBError.innerHTML = ""  //clear all previous error messages
                return true;
            }

            // pan card ajax -----------

            function validatePancardNumber(){
                var pancardNBInput = document.getElementById("pancardNum");
                var pancardNBError = document.getElementById("pancardNumError");
                console.log(pancardNBInput.value);
                console.log(pancardNBError.value);
                var panCard = pancardNBInput.value.trim(' ');
                var panCardPattern = /[A-Z]{5}[0-9]{4}[A-Z]{1}/;

                if(pancardNBInput.value === "" ){
                    pancardNBError.innerHTML = "pan card number is required :";
                    pancardNBInput.focus();
                    return false;
                }else if(pancardNBInput.value.length == 10 && panCardPattern.test(panCard)){

                    var req = new XMLHttpRequest();
                    console.log(req);
                    req.open("GET","http://localhost:8080/real-estate/getPancardNumber/"+pancardNBInput.value);
                    req.send();

                    req.onload = function(){
                    let respText = this.responseText;  // here responseText will come from a method of controller
                    pancardNBError.innerHTML = respText;
                    }
                    return true;
                }else {
                    pancardNBError.innerHTML = "please enter a valid pan card number :";
                    pancardNBInput.focus();
                    return false;
                }
                pancardNBError.innerHTML = ""  //clear all previous error messages
                return true;
            }


            // phone number ajax ----------

            function limitDigits(number,limit){
                let inputValue = number.value;
                let sanitizedValue = inputValue.replace(/\D/g, '');
                if (sanitizedValue.length > 10) {
                sanitizedValue = sanitizedValue.slice(0, limit);
                }
                number.value = sanitizedValue;
            }

            function validatePhoneNumber(){
                var phoneNBInput = document.getElementById("phoneNum");
                var phoneNBError = document.getElementById("phoneNumError");
                console.log(phoneNBInput.value);
                console.log(phoneNBError.value);
                var phoneNB = phoneNBInput.value.trim(' ');
                var phoneNBPattern = /^[7-9]\d{9}$/;

                if(phoneNBInput.value === "" ){
                    phoneNBError.innerHTML = "phone number is required :";
                    phoneNBInput.focus();
                    return false;
                }else if(phoneNBInput.value.length == 10 && phoneNBPattern.test(phoneNB)){

                    var req = new XMLHttpRequest();
                    console.log(req);
                    req.open("GET","http://localhost:8080/real-estate/getPhoneNumber/"+phoneNBInput.value);
                    req.send();

                    req.onload = function(){
                    let respText = this.responseText;  // here responseText will come from a method of controller
                    phoneNBError.innerHTML = respText;
                    }
                    return true;
                }else {
                    phoneNBError.innerHTML = "please enter a valid phone number :";
                    phoneNBInput.focus();
                    return false;
                }
                 phoneNBError.innerHTML = ""  //clear all previous error messages
                return true;
            }

           // address validation

           function validateAddress() {
               var addressInput = document.getElementById("address");
               var addressError = document.getElementById("addressError");

               if (addressInput.value === "") {
                   addressError.textContent = "Please enter your address";
                   return false;
               } else {
                   addressError.textContent = "";
                   return true;
               }
           }

           // password validation

           function validatePassword() {
               var passwordInput = document.getElementById("password");
               var passwordError = document.getElementById("passwordError");
               var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;

               if (!passwordRegex.test(passwordInput.value)) {
                   passwordError.textContent = "Your password must be 8-20 characters long, contain at least one upper case,lower case, numbers and special character but must not contain any spaces or emoji.";
                   return false;
               } else {
                   passwordError.textContent = "";
                   return true;
               }
           }

           // confirm password

            function validateConfirmPassword() {
                var passwordInput = document.getElementById("password");
                var confirmPasswordInput = document.getElementById("confirmPassword");
                var confirmPasswordError = document.getElementById("confirmPasswordError");

                if (passwordInput.value !== confirmPasswordInput.value) {
                    confirmPasswordError.textContent = "Passwords do not match";
                    return false;
                } else {
                    confirmPasswordError.textContent = "password matched";
                    return true;
                }
            }

            // form validation for enabled the button
            
            function validateForm() {
                var isValidName = validateName();
                var isValidEmail = validateEmail();
                var isValidAadhaarNumber = validateAadhaarNumber();
                var isValidPanCardNumber = validatePancardNumber();
                var isValidPhoneNumber = validatePhoneNumber();
                var isValidAddress = validateAddress();
                var isValidPassword = validatePassword();
                var isValidConfirmPassword = validateConfirmPassword();

                console.log("Name Valid:", isValidName);
                console.log("Email Valid:", isValidEmail);
                console.log("Aadhaar Number Valid:", isValidAadhaarNumber);
                console.log("Pan Card Valid:", isValidPanCardNumber);
                console.log("Phone Number Valid:", isValidPhoneNumber);
                console.log("Address Valid:", isValidAddress);
                console.log("Password Valid:", isValidPassword);
                console.log("Confirm Password Valid:", isValidConfirmPassword);

                var registerButton = document.getElementById("registerButton");
                registerButton = (isValidName && isValidEmail && isValidAadhaarNumber && isValidPanCardNumber &&
                 isValidPhoneNumber && isValidAddress && isValidPassword && isValidConfirmPassword);
            }


       </script>

</body>
</html>