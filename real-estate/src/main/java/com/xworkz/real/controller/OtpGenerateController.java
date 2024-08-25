package com.xworkz.real.controller;

import com.xworkz.real.dto.UserEntity;
import com.xworkz.real.otp.OTPGenerator;
import com.xworkz.real.service.estateService.UserService;
import com.xworkz.real.service.otpService.OtpService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.LocalTime;


@Controller
@RequestMapping("/")
@Slf4j
@SessionAttributes({"userId","userName","user"})

public class OtpGenerateController {
    @Autowired
    UserService service;

    @Autowired
    OtpService otpService;

    @PostMapping("/login")
    public String otpSentToUserEmail(@RequestParam("userEmailId") String email, Model model){

        model.addAttribute("mail",email);

        UserEntity userEntity = service.getUserByEmailId(email);

        try{
            System.err.println(email);
            String otp = OTPGenerator.generateOtp();

            if (otpService.sendOtpForUserByEmail(email,otp) == true ){           // otp send to email
                service.setOtp(userEntity.getUserId(),otp);                      // otp set to database
                service.setOtpGeneratedTime(userEntity.getUserId(),LocalTime.now());
                System.out.println("your otp for login = "+otp);
                System.out.println("user otp generated time :"+LocalTime.now());
                return "/loginSuccess.jsp";
            }
            else {
                return "/login.jsp";
            }
        }catch(NullPointerException ne){
            System.err.println(ne.getMessage());
        }
        return "/login.jsp";
    }


    @PostMapping("/otpAction")
    public String validateUserOtp(@RequestParam("userEmailId") String mail, @RequestParam("otp") String otp, ModelMap model, HttpSession httpSession){
        model.addAttribute("mail",mail);

        UserEntity userEntity = service.getUserByEmailId(mail);
        System.out.println("user info getting by mail id = "+userEntity);

        int userId = userEntity.getUserId();
        String userName = userEntity.getUserName();

        String inputOtp = otp;
        int maxAttempts = 3;
        int currentAttempts  = userEntity.getWrongOtpCount();
        String currentStatus = userEntity.getBlockStatus();

        if (userEntity.getUserOtp().equals(inputOtp) && userEntity.getUserOtp() != " ") {
            // Correct otp entered
            service.setWrongOtpCount(userEntity.getUserId(), 0);
            service.setBlockStatus(userEntity.getUserId(),"Unblocked");
            service.setOtpEnteredTime(userEntity.getUserId(), LocalTime.now());

//            model.put("userId",userId);
            model.put("userName",userName);
            httpSession.setAttribute("userId", userId);

            model.addAttribute("user",userEntity);
            System.out.println("user Id = "+userEntity.getUserId());

            log.info("your account login successfully :");
            return "/home.jsp";

        } else {
            currentAttempts++;
            service.setWrongOtpCount(userEntity.getUserId(), currentAttempts);
            service.setOtpEnteredTime(userEntity.getUserId(), LocalTime.now());

            if (currentAttempts >= maxAttempts ){

                currentStatus = "Blocked";
                service.setBlockStatus(userEntity.getUserId(), currentStatus);
                service.setWrongOtpCount(userEntity.getUserId(), 0);

                LocalDateTime blockEndTime = LocalDateTime.now().plusMinutes(1);      // block for 1 min
                System.out.println("blockEndTime = "+ blockEndTime);
                // model attribute is used to display block message and time in login page
                model.addAttribute("message","(You are currently blocked. Please wait until the timer expires before attempting to log in again.)");
                model.addAttribute("blockEndTime",blockEndTime);
                return "/login.jsp";

            }else {
                currentStatus = "Unblocked";
                service.setBlockStatus(userEntity.getUserId(), currentStatus);

            }
            return "/loginOtpResend.jsp";
        }

    }

    @PostMapping("/regenerateOtp")
    public String ResendOtpToUserEmail(@RequestParam("userEmailId") String email, Model model){

        model.addAttribute("mail",email);

        UserEntity userEntity = service.getUserByEmailId(email);

        try{
            System.err.println(email);
            String otp = OTPGenerator.generateOtp();

            if (otpService.sendOtpForUserByEmail(email,otp) == true ){           // otp send to email
                service.setOtp(userEntity.getUserId(),otp);                      // otp set to database
                service.setOtpGeneratedTime(userEntity.getUserId(),LocalTime.now());
                System.out.println("your otp for login = "+otp);
                System.out.println("user otp generated time :"+LocalTime.now());
                return "/loginSuccess.jsp";
            }
            else {
                return "/loginOtpResend.jsp";
            }
        }catch(NullPointerException ne){
            System.err.println(ne.getMessage());
        }
        return "/loginOtpResend.jsp";
    }



}

