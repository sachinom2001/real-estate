package com.xworkz.real.repository.userRepo;

import com.xworkz.real.dto.UserEntity;
import java.time.LocalTime;
import java.util.List;

public interface UserRepository {

    // create operation
    boolean saveUser(UserEntity userEntity);

    // read operation
    UserEntity getUserById(int userId);

    UserEntity getUserByEmail(String userEmailId);

    // update operation
    boolean updateUserDetails(UserEntity userEntity);


    // for set (update)
    boolean setOtp(int userId, String userOtp);

    boolean setOtpGeneratedTime(int userId, LocalTime otpGeneratedTime);

    boolean setOtpEnteredTime(int userId, LocalTime otpEnteredTime);

    boolean setWrongOtpCount(int userId, int wrongOtpCount);

    boolean setBlockStatus(int userId,String blockStatus);


    // for validation
    List<UserEntity> nameIsPresentOrNot();

    List<UserEntity> mailIsPresentOrNot();

    List<UserEntity> aadhaarNBIsPresentOrNot();

    List<UserEntity> pancardNBIsPresentOrNot();

    List<UserEntity> phoneNBIsPresentOrNot();


}
