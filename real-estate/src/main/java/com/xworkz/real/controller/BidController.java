package com.xworkz.real.controller;

import com.xworkz.real.dto.BidEntity;
import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.service.bidService.BidService;
import com.xworkz.real.service.propertyService.PropertyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/")
@SessionAttributes({"userId","userName"})

public class BidController {              // user bid the property

    @Autowired
    BidService bidService;

    @Autowired
    PropertyService propertyService;

    @PostMapping("/bidProperty")
    public String saveBidPropertyDetails(@ModelAttribute BidEntity bidEntity, @RequestParam("id") int userId,
                                         @RequestParam("propertyId") int propertyId, Model model){
        System.out.println("Inside saveBidPropertyDetails........ processing the bid request :");

        if (bidService.validateAndSave(bidEntity, userId, propertyId) == true){
            System.out.println("Property Bid Details saved successfully :");
            return "/home.jsp";
        }
        return "/propertyBid.jsp";
    }

}
