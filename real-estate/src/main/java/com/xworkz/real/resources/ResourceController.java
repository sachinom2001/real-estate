package com.xworkz.real.resources;

import com.xworkz.real.service.estateService.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/")
public class ResourceController {


    // ----------  register page  ----------
    @Autowired
    UserService service;

    @GetMapping("getUserEmailId/{userEmailId}")
    public String isEmailPresent(@PathVariable("userEmailId") String mail){
        if (service.validateEmail(mail) == true) {
            return "mail is already exist";
        }
        else {
            return "";
        }

    }

//    @GetMapping("getUserName/{userName}")
//    public String isNamePresent(@PathVariable("userName") String name){
//        if (service.validateName(name) == true){
//            return "name is already exist :";
//        }else {
//            return "name is not exist ----- please carry on :";
//        }
//    }

    @GetMapping("getAadhaarNumber/{aadhaarNumber}")
    public String isAadhaarIsPresent(@PathVariable("aadhaarNumber") long aadhaarNumber){
        if (service.validateAadhaarNum(aadhaarNumber) == true){
            return "aadhaar number is already exist :";
        }
        else {
            return "";
        }
    }

    @GetMapping("getPancardNumber/{pancardNumber}")
    public String isPanCardNumberIsPresent(@PathVariable("pancardNumber") String pancardNumber){
        if (service.validatePanCardNum(pancardNumber) == true){
            return "pan card number is already exist :";
        }else {
            return "";
        }
    }

    @GetMapping("getPhoneNumber/{phoneNumber}")
    public String isPhoneNumberIsPresent(@PathVariable("phoneNumber") long phoneNumber){
        if (service.validatePhoneNum(phoneNumber) == true){
            return "phone number is already exist :";
        }
        else {
            return "";
        }
    }


    // --------  login page  ---------


    @GetMapping("getUserEmailID/{userEmailId}")
    public String isEmailIdPresent(@PathVariable("userEmailId") String mail){
        if (service.validateEmail(mail) == true) {
            return "( email is registered, get otp through your email )";
        }
        else {
            return "( email is not registered, please first register and then log in )";
        }

    }

}
