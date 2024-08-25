package com.xworkz.real.otp;

import lombok.NonNull;
import lombok.ToString;
import org.springframework.stereotype.Component;

import java.util.Random;

@Component
public class OTPGenerator {
    @NonNull
    public static String generateOtp() {
        Random random = new Random();
        StringBuilder otp = new StringBuilder();
        for (int i = 0; i < 6 ; i++) {
            otp.append(random.nextInt(10));
        }
        return otp.toString();
    }
}
