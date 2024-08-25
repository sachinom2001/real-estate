package com.xworkz.real.repository.bidRepository;

import com.xworkz.real.dto.BidEntity;
import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.dto.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public class BidRepositoryImpl implements BidRepository{

    @Autowired
    EntityManagerFactory factory;

    @Override
    public boolean saveBidPropertyDetails(BidEntity bidEntity, int userId, int propertyId) {
        boolean isSave = false;
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            UserEntity userEntity = manager.find(UserEntity.class,userId);
            userEntity.getBidEntities().add(bidEntity);
            bidEntity.setUserEntities(userEntity);

            PropertyEntity propertyEntity = manager.find(PropertyEntity.class, propertyId);
            propertyEntity.getBidEntity().add(bidEntity);
            bidEntity.setPropertyEntities(propertyEntity);
            bidEntity.setBidTime(Timestamp.valueOf(LocalDateTime.now()));

            manager.persist(bidEntity);
            System.out.println(bidEntity);
            System.out.println(" bid persist done successfully : ");
            manager.getTransaction().commit();
            isSave = true;

        }catch (PersistenceException pe){
            System.err.println("Saving bid details failed : "+pe.getMessage());
            manager.getTransaction().rollback();
        }
        finally {
            System.out.println("Save bid property details finally block :");
            manager.close();
        }
        return isSave;
    }

    @Override
    public List<BidEntity> getListOfBidEntitiesForReview(int userId) {
        System.out.println("here we getting BidEntity and user details by user id :");
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            Query fetchedQuery = manager.createNamedQuery("getListOfBidEntitiesForReview");
            fetchedQuery.setParameter("Id",userId);
            List<BidEntity> list =fetchedQuery.getResultList();
            for (BidEntity entity : list){
                System.out.println(entity);
            }
            manager.getTransaction().commit();
            return list;
        }catch (PersistenceException pe){
            System.err.println("get BidEntity and user details by user id failed : "+ pe.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("get BidEntity and user details by user id finally block :");
            manager.close();
        }
        return null;
    }
}
