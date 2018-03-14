package ru.ivan.springsecurity.web;

import ru.ivan.springsecurity.domain.User;
import lombok.NonNull;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

public class UserAuthentication implements Authentication {

    private static final long serialVersionUID = 5449784006405061639L;
    private final User user;
    private boolean authenticated = true;

    public UserAuthentication(@NonNull User user) {
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return user.getAuthorities();
    }

    @Override
    public Object getCredentials() {
        return user.getPassword();
    }

    @Override
    public Object getDetails() {
        return user;
    }

    @Override
    public Object getPrincipal() {
        return user;
    }

    @Override
    public boolean isAuthenticated() {
        return authenticated;
    }

    @Override
    public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {
        this.authenticated = isAuthenticated;
    }

    @Override
    public String getName() {
        return user.getUsername();
    }
}
