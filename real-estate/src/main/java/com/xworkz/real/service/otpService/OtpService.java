package com.xworkz.real.service.otpService;

public interface OtpService {
    boolean sendOtpForUserByEmail(String userEmailId, String userOtp);


}
