package com.xworkz.real.repository.propertyRepo;

import com.xworkz.real.dto.PropertyEntity;
import com.xworkz.real.dto.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import java.util.List;

@Repository
public class PropertyRepositoryImpl implements PropertyRepository {            // add property

    @Autowired
    EntityManagerFactory factory;

    @Override
    public boolean saveProperty(PropertyEntity propertyEntity, int userId) {
        boolean isSave = false;
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            UserEntity userEntity = manager.find(UserEntity.class, userId);
            userEntity.getPropertyEntity().add(propertyEntity);
            propertyEntity.setUserEntity(userEntity);

            manager.persist(propertyEntity);
            System.out.println(propertyEntity);
            System.out.println("property persist done successfully :");
            manager.getTransaction().commit();
            isSave = true;

        }catch (PersistenceException pe){
            System.err.println("Saving property details failed : "+pe.getMessage());
            manager.getTransaction().rollback();
        }
        finally {
            System.out.println("Save property finally block :");
            manager.close();
        }
        return isSave;
    }


    @Override
    public List<PropertyEntity> getListOfProperties(int userId) {
        System.out.println("here we getting property details by user id :");
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            Query fetchedQuery = manager.createNamedQuery("getListOfProperties");
            fetchedQuery.setParameter("Id",userId);
            List<PropertyEntity> list =fetchedQuery.getResultList();
            for (Object object : list){
                System.out.println(object);
            }
            manager.getTransaction().commit();
            return list;
        }catch (PersistenceException pe){
            System.err.println("get property details by user id failed : "+ pe.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("get Property details by user id finally block :");
            manager.close();
        }
        return null;
    }

    @Override
    public List<PropertyEntity> getListOfUnBidPropertiesForReview(int userId) {
        System.out.println("here we getting unbid property details by user id :");
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            Query fetchedQuery = manager.createNamedQuery("getListOfUnBidPropertiesForReview");
            fetchedQuery.setParameter("Id",userId);
            List<PropertyEntity> list =fetchedQuery.getResultList();
            for (Object object : list){
                System.out.println(object);
            }
            manager.getTransaction().commit();
            return list;
        }catch (PersistenceException pe){
            System.err.println("get unbid property details by user id failed : "+ pe.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("get unbid property details by user id finally block :");
            manager.close();
        }
        return null;
    }


//    @Override
//    public List<PropertyEntity> getListOfPropForReview(int userId) {
//        System.out.println("here we getting property bid and user details by id :");
//        EntityManager manager = factory.createEntityManager();
//
//        try {
//            manager.getTransaction().begin();
//            Query fetchedQuery = manager.createNamedQuery("getListOfPropForReview");
//            fetchedQuery.setParameter("Id",userId);
//            List<PropertyEntity> list =fetchedQuery.getResultList();
//            for (Object object : list){
//                System.out.println(object);
//            }
//            manager.getTransaction().commit();
//            return list;
//        }catch (PersistenceException pe){
//            System.err.println("get property bid and user details failed : "+ pe.getMessage());
//            manager.getTransaction().rollback();
//        }finally {
//            System.out.println("get property bid and user details by Id finally block :");
//            manager.close();
//        }
//        return null;
//    }


}
