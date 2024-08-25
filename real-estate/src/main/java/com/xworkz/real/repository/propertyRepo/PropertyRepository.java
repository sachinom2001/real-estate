package com.xworkz.real.repository.propertyRepo;

import com.xworkz.real.dto.PropertyEntity;

import java.util.List;

public interface PropertyRepository {

    boolean saveProperty(PropertyEntity propertyEntity,int userId);

    List<PropertyEntity> getListOfProperties(int userId);

    List<PropertyEntity> getListOfUnBidPropertiesForReview(int userId);



}
