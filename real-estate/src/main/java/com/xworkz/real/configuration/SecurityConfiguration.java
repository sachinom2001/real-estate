//package com.xworkz.real.configuration;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
//
//    public SecurityConfiguration(){
//        System.out.println("SecurityConfiguration initialized :");
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//                .authorizeRequests()
//                    .anyRequest().authenticated()
//                    .and()
//                .formLogin()
//                    .permitAll()
//                    .and()
//                .logout()
//                    .logoutUrl("/userLogout")
//                    .logoutSuccessUrl("/")
//                    .invalidateHttpSession(true)
//                    .permitAll();
//
//        System.out.println("SecurityConfiguration work done :");
//    }
//
//
//
//}
