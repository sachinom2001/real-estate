package com.xworkz.real.controller;

import com.xworkz.real.dto.UserEntity;
import com.xworkz.real.service.estateService.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
@SessionAttributes("userId")
public class UserController {          // CRUD operation
    @Autowired
    UserService service;

    @PostMapping("/register")
    public String saveUser(@ModelAttribute UserEntity userEntity){
        System.out.println("Inside saveUser........ processing the client's request :");

        if (service.validateAndSave(userEntity) == true){
            System.out.println("Thank you for registered here :");
            return "/login.jsp";

        }else {
            return "/register.jsp";
        }

    }

    @PostMapping("/updateProfile")
    public String updateUserDetails(@ModelAttribute UserEntity userEntity, ModelMap model, HttpSession httpSession){
        System.out.println("Inside updateUserDetails......... processing the client's request to update details :");

        System.out.println("userid from session = "+ httpSession.getAttribute("userId"));
        Integer userId= (Integer) httpSession.getAttribute("userId");
        userEntity.setUserId(userId);

        boolean updated = service.updateUserDetails(userEntity);

        if (updated){
            System.out.println("Profile updated successfully :");

            UserEntity updatedUser = service.getUserById(userId);
            httpSession.setAttribute("user",updatedUser);

            model.addAttribute("message", "Your profile was updated successfully. Thank you!");
            model.addAttribute("messageType", "success");
        }else {
            model.addAttribute("message", "Failed to update your profile. Please try again.");
            model.addAttribute("messageType", "error");
        }
        return "redirect:/home.jsp";
    }


}
