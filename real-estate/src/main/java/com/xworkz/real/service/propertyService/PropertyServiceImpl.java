package com.xworkz.real.service.propertyService;

import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.repository.propertyRepo.PropertyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PropertyServiceImpl implements PropertyService{

    @Autowired
    PropertyRepository propertyRepository;

    @Override
    public boolean validateAndSave(PropertyEntity propertyEntity, int userId) {
        boolean output = false;
        System.out.println("propertyEntity = "+propertyEntity);

        if (propertyEntity!=null ) {
            propertyRepository.saveProperty(propertyEntity,userId);
            output = true;
        }else {
            output = false;
        }
        return output;
    }


    @Override
    public List<PropertyEntity> getListOfProperties(int userId) {
        List<PropertyEntity> list = propertyRepository.getListOfProperties(userId);
        for (PropertyEntity propertyEntity : list){
            if (propertyEntity!= null){
                System.out.println("list of properties are = "+propertyEntity+", ");
            }else {
                System.out.println("No property found here : ");
            }
        }
        return list;
    }

    @Override
    public List<PropertyEntity> getListOfUnBidPropertiesForReview(int userId) {
        List<PropertyEntity> list = propertyRepository.getListOfUnBidPropertiesForReview(userId);
        for (PropertyEntity propertyEntity : list){
            if (propertyEntity!= null){
                System.out.println("list of unbid properties details for review are : "+propertyEntity+", ");
            }else {
                System.out.println("No unbid property details for review are found here :");
            }
        }
        return list;
    }

//    @Override
//    public List<PropertyEntity> getListOfPropForReview(int userId) {
//        List<PropertyEntity> list = propertyRepository.getListOfPropForReview(userId);
//        for (PropertyEntity propertyEntity : list){
//            if (propertyEntity!= null){
//                System.out.println("list of properties for review are : "+propertyEntity+", ");
//            }else {
//                System.out.println("No property details are found here :");
//            }
//        }
//        return list;
//    }


}
