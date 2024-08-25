package com.xworkz.real.service.estateService;

import com.xworkz.real.dto.UserEntity;
import com.xworkz.real.repository.userRepo.UserRepository;
import com.xworkz.real.service.mailService.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository repository;
    @Autowired
    MailService mailService;


    // validate and save user details ------
    @Override
    public boolean validateAndSave(UserEntity userEntity) {
        Boolean output = false;
        if (repository.saveUser(userEntity) == true){
            mailService.welcomeMail(userEntity);      // to send welcome message for user registration
            output = true;
        }else {
            output = false;
        }
        return output;
    }

    // read/get user details
    @Override
    public UserEntity getUserById(int userId) {
        return repository.getUserById(userId);
    }

    @Override
    public UserEntity getUserByEmailId(String userEmailId) {
       return repository.getUserByEmail(userEmailId);
    }

    // update user details
    @Override
    public boolean updateUserDetails(UserEntity userEntity) {
        Boolean output = false;

        if (repository.updateUserDetails(userEntity) == true){
            output = true;
        }else {
            output = false;
        }
        return output;
    }

    // set user details ---------

    @Override
    public boolean setOtp(int userId, String userOtp) {
        Boolean isUpdate = false;
        if (repository.setOtp(userId,userOtp) == true){
            isUpdate = true;
        }else {
            isUpdate = false;
        }
        return isUpdate;
    }

    @Override
    public boolean setOtpGeneratedTime(int userId, LocalTime otpGeneratedTime) {
        Boolean isUpdate = false;
        if (repository.setOtpGeneratedTime(userId,otpGeneratedTime)){
            isUpdate = true;
        }else {
            isUpdate = false;
        }
        return isUpdate;
    }

    @Override
    public boolean setOtpEnteredTime(int userId, LocalTime otpEnteredTime) {
        Boolean isUpdate = false;
        if (repository.setOtpEnteredTime(userId,otpEnteredTime) == true){
            isUpdate = true;
        }else {
            isUpdate = false;
        }
        return isUpdate;
    }

    @Override
    public boolean setWrongOtpCount(int userId, int wrongOtpCount) {
        Boolean isUpdate = false;
        if (repository.setWrongOtpCount(userId,wrongOtpCount) == true){
            isUpdate = true;
        }else {
            isUpdate = false;
        }
        return isUpdate;
    }

    @Override
    public boolean setBlockStatus(int userId, String blockStatus) {
        Boolean isUpdate = false;

        if (repository.setBlockStatus(userId, blockStatus) == true){
            isUpdate = true;
        }else {
            isUpdate = false;
        }
        return isUpdate;
    }


    // for validation -----------
    // validate email
    @Override
    public boolean validateEmail(String mail) {
        Boolean isCheck = false;
        List list = repository.mailIsPresentOrNot();
        for(Object obj : list){
            String string = (String) obj;
            if (string.equals(mail)){
                isCheck = true;
                break;
            }
            else {
                isCheck = false;
            }
        }
        return isCheck;
    }

    // validate name
    @Override
    public boolean validateName(String name) {
        Boolean isCheck = false;
        List list = repository.nameIsPresentOrNot();
        for (Object obj : list){
            String string = (String) obj;
            if (string.equals(name)){
                isCheck =  true;
                break;
            }else {
                isCheck = false;
            }
        }
        return isCheck;
    }

    // validate aadhaar number
    @Override
    public boolean validateAadhaarNum(long aadhaarNum) {
        Boolean isCheck = false;
        List list = repository.aadhaarNBIsPresentOrNot();
        for (Object obj : list){
            long lng = (long) obj;
            if (lng == aadhaarNum){
                isCheck = true;
                break;
            }else {
                isCheck = false;
            }
        }
        return isCheck;
    }

    // validate panCard number
    @Override
    public boolean validatePanCardNum(String pancardNumber) {
        Boolean isCheck = false;
        List list = repository.pancardNBIsPresentOrNot();
        for (Object obj : list){
            String string = (String) obj;
            if (string.equals(pancardNumber)){
                isCheck = true;
            }else {
                isCheck = false;
            }
        }
        return isCheck;
    }

    // validate phone number
    @Override
    public boolean validatePhoneNum(long phoneNum) {
        Boolean isCheck = false;
        List list = repository.phoneNBIsPresentOrNot();
        for (Object obj : list){
            long lng = (long) obj;
            if (lng == phoneNum){
                isCheck = true;
            }else {
                isCheck = false;
            }
        }
        return isCheck;
    }




}
