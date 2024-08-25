package com.xworkz.real.controller;

import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.dto.UserEntity;
import com.xworkz.real.service.estateService.UserService;
import com.xworkz.real.service.propertyService.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
@SessionAttributes({"userId","userName"})

public class PropertyController {            // add new property

    @Autowired
    PropertyService propertyService;

    @Autowired
    UserService userService;

    @PostMapping("/addProperty")
    public String saveProperty(@ModelAttribute PropertyEntity propertyEntity,@RequestParam("id") int userId, ModelMap model){
        System.out.println("Inside saveProperty........ processing the property request :");

//        int userId = (int) model.getAttribute("userId");
        if (propertyService.validateAndSave(propertyEntity, userId) == true){
            System.out.println("here the user Id = "+ userId );
            System.out.println("Your new property added successfully :");
            return "/home.jsp";
        }else {
            return "/propertySell.jsp";
        }
    }


}
