package com.xworkz.real.controller;

import com.xworkz.real.dto.UserEntity;
import com.xworkz.real.service.estateService.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
@SessionAttributes("userId")
public class LogoutController {

    @Autowired
    UserService service;
    @RequestMapping(value = "/userLogout", method = RequestMethod.GET)
    public String doLogout(@ModelAttribute UserEntity userEntity, HttpServletRequest request, HttpServletResponse response, Authentication authentication,
                           HttpSession httpSession){
        String otp = " ";
        Integer userId= (Integer) httpSession.getAttribute("userId");
        userEntity.setUserId(userId);

        if (authentication != null){
            new SecurityContextLogoutHandler().logout(request,response,authentication);
        }

        UserEntity logoutUser = service.getUserById(userId);
        System.out.println("user logout = "+ logoutUser);
        service.setOtp(logoutUser.getUserId(),otp);
        System.out.println("otp = "+logoutUser.getUserOtp());
        System.out.println("user account logout done :");

        return "/login.jsp";
    }

}
