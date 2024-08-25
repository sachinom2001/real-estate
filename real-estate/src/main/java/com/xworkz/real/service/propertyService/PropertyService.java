package com.xworkz.real.service.propertyService;

import com.xworkz.real.dto.PropertyEntity;

import java.util.List;

public interface PropertyService {

    boolean validateAndSave(PropertyEntity propertyEntity, int userId);

    List<PropertyEntity> getListOfProperties(int userId);

    List<PropertyEntity> getListOfUnBidPropertiesForReview(int userId);

}
