package com.xworkz.real.service.mailService;

import com.xworkz.real.configuration.MailConfiguration;
import com.xworkz.real.dto.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;


@Service
public class MailServiceImpl implements MailService {

    @Autowired
    MailConfiguration configuration;

    @Override
    public void welcomeMail(UserEntity userEntity) {
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setTo(userEntity.getUserEmailId());
        mailMessage.setSubject("Registration successful");
        mailMessage.setText("You have successfully registered in Real Estate Application \n" +
                "For any queries contact: sachinom2001@gmail.com");
        configuration.mailConfig().send(mailMessage);
    }

}