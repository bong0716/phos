package com.phos.config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;

public class BindExceptionWithViewName extends BindException {

    private final String viewName;
    private final MessageSource messageSource;
    private final Locale locale;
    
    public BindExceptionWithViewName(
        BindingResult bindingResult, 
        String viewName, 
        MessageSource messageSource,
        Locale locale
    ) {
        super(bindingResult);
        this.viewName = viewName;
        this.messageSource = messageSource;
        this.locale = locale;
    }
    
    public String getViewName() {
        return viewName;
    }
    
    public String getMessage(String field) {
       return messageSource.getMessage(getFieldError(field), locale);
    }
    
    public String getGlobalMessage() {
        return messageSource.getMessage(getGlobalError(), locale);
     }
}