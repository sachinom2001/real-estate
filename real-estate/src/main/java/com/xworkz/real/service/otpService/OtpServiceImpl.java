package com.xworkz.real.service.otpService;

import com.xworkz.real.configuration.MailConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

@Service
public class OtpServiceImpl implements OtpService{

    @Autowired
    MailConfiguration configuration;

    @Override
    public boolean sendOtpForUserByEmail(String userEmailId, String userOtp) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(userEmailId);
        mailMessage.setSubject("OTP for login");
        mailMessage.setText("Your otp for user login is: "+userOtp);
        configuration.mailConfig().send(mailMessage);
        return true;
    }

}
