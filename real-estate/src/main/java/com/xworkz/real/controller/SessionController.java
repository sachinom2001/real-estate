package com.xworkz.real.controller;

import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.dto.UserEntity;
import com.xworkz.real.service.estateService.UserService;
import com.xworkz.real.service.propertyService.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/")
@SessionAttributes("userId")
public class SessionController {            // to display property list for buy

    @Autowired
    UserService userService;
    @Autowired
    PropertyService propertyService;

    @GetMapping("/buyProperty")
    public String buyProperties(@RequestParam("id") int userId, ModelMap model){
        System.out.println("get property details by property id ..............");

        UserEntity userEntity = userService.getUserById(userId);

        List<PropertyEntity> list = propertyService.getListOfProperties(userEntity.getUserId());
        model.addAttribute("ListOfPropertyEntity",list);

        model.put("userId",userId);
        return "/propertyBuy.jsp";
    }
}
