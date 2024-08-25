package com.xworkz.real.configuration;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class UserWebInit extends AbstractAnnotationConfigDispatcherServletInitializer {  // Spring Config Class

    public UserWebInit(){
        System.out.println("UserWebInit is done");
    }

    @Override
    protected Class<?>[] getRootConfigClasses() {
        System.out.println("getRootConfigClasses method done");
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        System.out.println("getServletConfigClasses method done ");
        return new Class[]{UserConfiguration.class};
    }

    @Override
    protected String[] getServletMappings() {
        System.out.println("getServletMappings method done");
        return new String[]{"/"};
    }

}
