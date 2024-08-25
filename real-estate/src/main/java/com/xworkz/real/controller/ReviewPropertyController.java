package com.xworkz.real.controller;

import com.xworkz.real.dto.BidEntity;
import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.dto.UserEntity;
import com.xworkz.real.service.bidService.BidService;
import com.xworkz.real.service.estateService.UserService;
import com.xworkz.real.service.propertyService.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@RequestMapping("/")
@SessionAttributes("userId")
public class ReviewPropertyController {

    @Autowired
    UserService userService;

    @Autowired
    PropertyService propertyService;

    @Autowired
    BidService bidService;

    @GetMapping("/reviewProperty")
    public String reviewBidProperty(@RequestParam("id") int userId, ModelMap model){
        System.out.println("get unbid property details by user id ..............");
        System.out.println("get property bid and user details by user id ..............");

        UserEntity userEntity = userService.getUserById(userId);

        List<PropertyEntity> propertyEntityList = propertyService.getListOfUnBidPropertiesForReview(userId);
        model.addAttribute("ListOfUnBidPropertiesForReview",propertyEntityList);

        List<BidEntity> bidEntityList = bidService.getListOfBidEntitiesForReview(userId);
        model.addAttribute("ListOfBidEntitiesForReview",bidEntityList);

        model.put("userId", userId);
        return "/reviewProperty.jsp";
    }

//    @GetMapping("/reviewProperty")
//    public String reviewUnbidProperty(@RequestParam("id") int userId, ModelMap model){
//        System.out.println("get property bid and user details by user id ..............");
//
//        UserEntity userEntity = userService.getUserById(userId);
//
//        List<PropertyEntity> propertyEntityList = propertyService.getListOfUnBidPropertiesForReview(userId);
//        model.addAttribute("ListOfUnBidPropertiesForReview",propertyEntityList);
//
//        model.put("userId",userId);
//        return "/reviewProperty.jsp";
//    }


}
