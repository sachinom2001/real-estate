package com.xworkz.real.service.bidService;

import com.xworkz.real.dto.BidEntity;

import java.util.List;

public interface BidService {

    boolean validateAndSave(BidEntity bidEntity, int userId, int propertyId);

    List<BidEntity> getListOfBidEntitiesForReview(int userId);
}
