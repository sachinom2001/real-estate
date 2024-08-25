package com.xworkz.real.repository.userRepo;

import com.xworkz.real.dto.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceException;
import javax.persistence.Query;
import java.time.LocalTime;
import java.util.List;

@Repository
public class UserRepositoryImpl implements UserRepository{

    @Autowired
    EntityManagerFactory factory;

    // for create operation  --------
    @Override
    public boolean saveUser(UserEntity userEntity) {
        boolean isSaved = false;
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            manager.persist(userEntity);
            manager.getTransaction().commit();
            System.out.println(userEntity);
            System.out.println("user persist done successfully :");
            isSaved = true;

        }catch (PersistenceException pe){
            System.out.println("Saving user details failed:"+pe.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("Save user details finally block :");
            manager.close();
        }
        return isSaved;
    }


    // for read/get operation
    @Override
    public UserEntity getUserById(int userId) {
        System.out.println("here we getting user info by id :");
        EntityManager manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query fetchedQuery = manager.createNamedQuery("getUserById");
            fetchedQuery.setParameter("id",userId);
            UserEntity userEntity = (UserEntity) fetchedQuery.getSingleResult();
            manager.getTransaction().commit();
            return userEntity;
    }

    @Override
    public UserEntity getUserByEmail(String userEmailId) {
        System.out.println("here we getting user info by email id :");
        EntityManager manager = factory.createEntityManager();
            manager.getTransaction().begin();
            Query fetchedQuery = manager.createNamedQuery("getUserByEmail");
            fetchedQuery.setParameter("email",userEmailId);
            UserEntity userEntity =(UserEntity) fetchedQuery.getSingleResult();
            manager.getTransaction().commit();
            return userEntity;
    }


    // for update operation  ------------
    @Override
    public boolean updateUserDetails(UserEntity updatedUser) {
        boolean isUpdated = false;
        System.out.println("here we are updating user details :");
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            UserEntity existingUser = manager.find(UserEntity.class, updatedUser.getUserId());

            if (existingUser != null){
                System.out.println("User found: updating details....");

                if (updatedUser.getUserName() != null){
                    existingUser.setUserName(updatedUser.getUserName());
                }
                if (updatedUser.getUserEmailId() != null){
                    existingUser.setUserEmailId(updatedUser.getUserEmailId());
                }
                if (updatedUser.getPhoneNumber() != null){
                    existingUser.setPhoneNumber(updatedUser.getPhoneNumber());
                }
                manager.merge(existingUser);
                manager.getTransaction().commit();
                isUpdated = true;
                System.out.println("User details updated successfully....");
            }else {
                System.out.println("User not found with ID: " + updatedUser.getUserId());
                manager.getTransaction().rollback();
            }

        }catch (PersistenceException pe){
            System.err.println("updating user details failed :"+pe.getMessage());
            if (manager.getTransaction().isActive()) {
                manager.getTransaction().rollback();
            }
        }finally {
            System.out.println("updating user details finally block :");
            manager.close();
        }
        return isUpdated;
    }


    // for set (update) -----------
    @Override
    public boolean setOtp(int userId, String userOtp) {           // for otp
        System.out.println("setOtp method started:");
        boolean isUpdate = false;
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            UserEntity userEntity = manager.find(UserEntity.class,userId);
            userEntity.setUserOtp(userOtp);
            manager.merge(userEntity);
            manager.getTransaction().commit();
            System.out.println("user updated successfully :");
            isUpdate = true;
        }catch (PersistenceException pe){
            System.out.println("Error in updating user otp :"+pe.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("updated user otp by email:");
            manager.close();
        }

        System.out.println("setOtp method ended:");
        return isUpdate;
    }

    @Override
    public boolean setOtpGeneratedTime(int userId, LocalTime otpGeneratedTime) {
        Boolean isUpdate = false;
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            UserEntity userEntity = manager.find(UserEntity.class, userId);
            userEntity.setOtpGeneratedTime(otpGeneratedTime);
            manager.merge(userEntity);
            System.out.println("data updated successfully :");
            manager.getTransaction().commit();
            isUpdate = true;
        }catch (NullPointerException ne){
            System.err.println("NullPointerException error in setOtpGeneratedTime method of UserEntity :"+ ne.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("updated user generated otp time by email :");
            manager.close();
        }
        return isUpdate;
    }

    @Override
    public boolean setOtpEnteredTime(int userId, LocalTime otpEnteredTime) {
        boolean isUpadte = false;
        EntityManager manager = factory.createEntityManager();

        try{
            manager.getTransaction().begin();
            UserEntity userEntity = manager.find(UserEntity.class,userId);
            userEntity.setOtpEnteredTime(otpEnteredTime);
            manager.merge(userEntity);
            manager.getTransaction().commit();
            System.out.println("data updated successfully :");
            isUpadte = true;
        }catch (NullPointerException ne){
            System.err.println("Error in update user otp entered time:"+ ne.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("updated user entered otp time by email : ");
            manager.close();
        }

        return isUpadte;
    }

    @Override
    public boolean setWrongOtpCount(int userId, int wrongOtpCount) {
        Boolean isUpdate = false;
        EntityManager manager = factory.createEntityManager();

        try{
            manager.getTransaction().begin();
            UserEntity userEntity = manager.find(UserEntity.class,userId);
            userEntity.setWrongOtpCount(wrongOtpCount);
            manager.merge(userEntity);
            manager.getTransaction().commit();
            System.out.println("data updated successfully :");
            isUpdate = true;
        }catch (NullPointerException ne){
            System.err.println("NullPointerException error in setWrongOtpCount method of UserEntity :"+ne.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("updated user wrong otp count :");
            manager.close();
        }
        return isUpdate;
    }

    @Override
    public boolean setBlockStatus(int userId, String blockStatus) {
        Boolean isUpdate = false;
        EntityManager manager = factory.createEntityManager();

        try {
            manager.getTransaction().begin();
            UserEntity userEntity = manager.find(UserEntity.class, userId);
            userEntity.setBlockStatus(blockStatus);
            manager.merge(userEntity);
            manager.getTransaction().commit();
            System.out.println("data updated successfully :");
            isUpdate = true;
        }catch (NullPointerException ne){
            System.err.println("NullPointerException error in setBlockStatus method :"+ne.getMessage());
            manager.getTransaction().rollback();
        }finally {
            System.out.println("user block status updated :");
            manager.close();
        }
        return isUpdate;
    }


    // for validation ---------

    @Override
    public List<UserEntity> nameIsPresentOrNot() {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        Query fetchedQuery = manager.createNamedQuery("nameIsPresentOrNot");
        List list = fetchedQuery.getResultList();
        manager.getTransaction().commit();
        manager.close();
        return list;
    }

    @Override
    public List<UserEntity> mailIsPresentOrNot() {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        Query fetchedQuery = manager.createNamedQuery("mailIsPresentOrNot");
        List list = fetchedQuery.getResultList();
        manager.getTransaction().commit();
        manager.close();
        return list;
    }

    @Override
    public List<UserEntity> aadhaarNBIsPresentOrNot() {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        Query fetchedQuery = manager.createNamedQuery("aadhaarNBIsPresentOrNot");
        List list = fetchedQuery.getResultList();
        manager.getTransaction().commit();
        manager.close();
        return list;
    }

    @Override
    public List<UserEntity> pancardNBIsPresentOrNot() {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        Query fetchedQuery = manager.createNamedQuery("pancardNBIsPresentOrNot");
        List list = fetchedQuery.getResultList();
        manager.getTransaction().getClass();
        manager.close();
        return list;
    }

    @Override
    public List<UserEntity> phoneNBIsPresentOrNot() {
        EntityManager manager = factory.createEntityManager();
        manager.getTransaction().begin();
        Query fetchedQuery = manager.createNamedQuery("phoneNBIsPresentOrNot");
        List list = fetchedQuery.getResultList();
        manager.getTransaction().commit();
        manager.close();
        return list;
    }



}
