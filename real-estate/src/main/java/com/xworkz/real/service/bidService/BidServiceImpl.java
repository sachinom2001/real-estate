package com.xworkz.real.service.bidService;

import com.xworkz.real.dto.BidEntity;
import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.repository.bidRepository.BidRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BidServiceImpl implements BidService{

    @Autowired
    BidRepository bidRepository;

    @Override
    public boolean validateAndSave(BidEntity bidEntity, int userId, int propertyId) {
        boolean output = false;
        System.out.println("bidEntity = "+bidEntity);

        if (bidEntity!=null){
            bidRepository.saveBidPropertyDetails(bidEntity, userId, propertyId);
            output = true;
        }else {
            output = false;
        }
        return output;
    }

    @Override
    public List<BidEntity> getListOfBidEntitiesForReview(int userId) {
        List<BidEntity> list = bidRepository.getListOfBidEntitiesForReview(userId);
        for (BidEntity bidEntity : list){
            if (bidEntity!= null){
                System.out.println("list of Bid entities and user details for review are : "+bidEntity+" , ");
            }else {
                System.out.println("No Bid entities and user details are found here :");
            }
        }
        return list;
    }
}
