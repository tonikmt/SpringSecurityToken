/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.ivan.springsecurity.utils;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import ru.ivan.springsecurity.domain.User;

/**
 *
 * @author ivan
 */
@Component
public class UserValidator  implements Validator{

    @Override
    public boolean supports(Class<?> type) {
        return User.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;
    }
    
}
