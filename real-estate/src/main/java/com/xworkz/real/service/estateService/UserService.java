package com.xworkz.real.service.estateService;

import com.xworkz.real.dto.UserEntity;

import java.time.LocalTime;

public interface UserService {

    // create/register page
    boolean validateAndSave(UserEntity userEntity);

    // read/get operation
    UserEntity getUserById(int userId);

    UserEntity getUserByEmailId(String userEmailId);

    // update operation
    boolean updateUserDetails(UserEntity userEntity);


    // for set (update)
    boolean setOtp(int userId, String userOtp);

    boolean setOtpGeneratedTime(int userId, LocalTime otpGeneratedTime);

    boolean setOtpEnteredTime(int userId, LocalTime otpEnteredTime);

    boolean setWrongOtpCount(int userId, int wrongOtpCount);

    boolean setBlockStatus(int userId, String blockStatus);


    // for validation
    boolean validateName(String name);

    boolean validateEmail(String mail);

    boolean validateAadhaarNum(long aadhaarNum);

    boolean validatePanCardNum(String pancardNumber);

    boolean validatePhoneNum(long phoneNum);


}
