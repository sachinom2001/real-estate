package com.xworkz.real.repository.bidRepository;

import com.xworkz.real.dto.BidEntity;

import java.util.List;

public interface BidRepository {

    boolean saveBidPropertyDetails(BidEntity bidEntity,int userId, int propertyId);

    List<BidEntity> getListOfBidEntitiesForReview(int userId);
}
