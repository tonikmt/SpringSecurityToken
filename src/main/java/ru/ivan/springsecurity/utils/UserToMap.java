/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.ivan.springsecurity.utils;

import java.util.HashMap;
import java.util.Map;

import lombok.Data;
import lombok.NonNull;
import ru.ivan.springsecurity.domain.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author Ivan
 */
@Data
public class UserToMap {
    private final Logger logger = LoggerFactory.getLogger(UserToMap.class);

    public static Map<String, Object> getMapUser(@NonNull User userDB, @NonNull User userRenewed) {
        Map<String, Object> userMapUpdate = new HashMap();
        if (!userDB.getUsername().equals(userRenewed.getUsername())) {
            userMapUpdate.put("username", userRenewed.getUsername());
        }
        if (userDB.getName().equals(userRenewed.getName())) {
            userMapUpdate.put("name", userRenewed.getName());
        }
        if (!userDB.getEmail().equals(userRenewed.getEmail())) {
            userMapUpdate.put("email", userRenewed.getEmail());
        }
        if (!userDB.getAuthorities().equals(userRenewed.getAuthorities())) {
            userMapUpdate.put("authorities", userRenewed.getAuthorities());
        }
        if (userDB.isEnabled() != userRenewed.isEnabled()) {
            userMapUpdate.put("enabled", userRenewed.isEnabled());
        }
        if (userDB.isAccountNonExpired() != userRenewed.isAccountNonExpired()) {
            userMapUpdate.put("accountNonExpired", userRenewed.isAccountNonExpired());
        }
        if (userDB.isAccountNonLocked() != userRenewed.isAccountNonLocked()) {
            userMapUpdate.put("accountNonLocked", userRenewed.isAccountNonLocked());
        }
        if (userDB.isCredentialsNonExpired() != userRenewed.isCredentialsNonExpired()) {
            userMapUpdate.put("credentialsNonExpired", userRenewed.isCredentialsNonExpired());
        }
        userMapUpdate.put("password", userRenewed.getPassword());
        return userMapUpdate;
    }

}
