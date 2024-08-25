package com.xworkz.real.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import javax.persistence.*;
import java.time.LocalTime;
import java.util.List;

@Entity
@Data
@Table(name = "estate_user")
@AllArgsConstructor
@RequiredArgsConstructor

@NamedQueries(
        {
            @NamedQuery(name = "getUserByEmail", query = "select us from UserEntity us where us.userEmailId=:email"),
            @NamedQuery(name = "getUserById", query = "select us from UserEntity us where us.userId=:id"),
//            @NamedQuery(name = "updateUserDetails", query = "update UserEntity us set us.userName=:Name," +
//                    "us.userEmailId=:Email,us.phoneNumber=:PhoneNum where us.userId=:Id"),
            @NamedQuery(name = "nameIsPresentOrNot" ,query = "select us.userName from UserEntity us"),
            @NamedQuery(name = "mailIsPresentOrNot", query = "select us.userEmailId from UserEntity us"),
            @NamedQuery(name = "aadhaarNBIsPresentOrNot" ,query = "select us.aadhaarNumber from UserEntity us"),
            @NamedQuery(name = "pancardNBIsPresentOrNot", query = "select us.pancardNumber from UserEntity us"),
            @NamedQuery(name = "phoneNBIsPresentOrNot" ,query = "select us.phoneNumber from UserEntity us")

        }
)


public class UserEntity {

    public UserEntity(int userId){
        this.userId=userId;
    }

    public UserEntity(String email){
        this.userEmailId=email;
    }

    public UserEntity(String userEmailId,String userOtp){
        this.userEmailId=userEmailId;
        this.userOtp=userOtp;
    }


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userId;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "user_emailId")
    private String userEmailId;

    @Column(name = "user_aadhaarNumber")
    private Long aadhaarNumber;

    @Column(name = "user_pancardNumber")
    private String pancardNumber;

    @Column(name = "user_phoneNumber")
    private Long phoneNumber;

    @Column(name = "user_address")
    private String address;

    @Column(name = "user_password")
    private String password;

    @Column(name = "user_otp")
    private String userOtp;

    @Column(name = "user_otp_generated_time")
    private LocalTime otpGeneratedTime;

    @Column(name = "user_otp_entered_time")
    private LocalTime otpEnteredTime;

    @Column(name = "user_wrong_otp_count")
    private int wrongOtpCount;

    @Column(name = "user_blockStatus")
    private String blockStatus;

    @OneToMany(mappedBy = "userEntity")
    private List<PropertyEntity> propertyEntity;

    @OneToMany(mappedBy = "userEntities")
    private List<BidEntity> bidEntities;


}
