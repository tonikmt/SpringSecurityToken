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
    private User userDB;
    private User userRenewed;
    private Map<String, Object> userMapUpdate;

    public UserToMap(@NonNull User userDB, @NonNull User userRenewed) {
        this.userDB = userDB;
        this.userRenewed = userRenewed;
    }

    public Map<String, Object> getMapUser() {
        this.userMapUpdate = new HashMap();
        if (!this.userDB.getUsername().equals(this.userRenewed.getUsername())) {
            this.userMapUpdate.put("username", this.userRenewed.getUsername());
        }
        if (!this.userDB.getName().equals(this.userRenewed.getName())) {
            this.userMapUpdate.put("name", this.userRenewed.getName());
        }
        if (!this.userDB.getEmail().equals(this.userRenewed.getEmail())) {
            this.userMapUpdate.put("email", this.userRenewed.getEmail());
        }
        if (!this.userDB.getAuthorities().equals(this.userRenewed.getAuthorities())) {
            this.userMapUpdate.put("authorities", this.userRenewed.getAuthorities());
        }
        if (this.userDB.isEnabled() != this.userRenewed.isEnabled()) {
            this.userMapUpdate.put("enabled", this.userRenewed.isEnabled());
        }
        if (this.userDB.isAccountNonExpired() != this.userRenewed.isAccountNonExpired()) {
            this.userMapUpdate.put("accountNonExpired", this.userRenewed.isAccountNonExpired());
        }
        if (this.userDB.isAccountNonLocked() != this.userRenewed.isAccountNonLocked()) {
            this.userMapUpdate.put("accountNonLocked", this.userRenewed.isAccountNonLocked());
        }
        if (this.userDB.isCredentialsNonExpired() != this.userRenewed.isCredentialsNonExpired()) {
            this.userMapUpdate.put("credentialsNonExpired", this.userRenewed.isCredentialsNonExpired());
        }
        this.userMapUpdate.put("password", this.userRenewed.getPassword());
        return this.userMapUpdate;
    }

}
