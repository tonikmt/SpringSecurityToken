package ru.ivan.springsecurity.services;

import ru.ivan.springsecurity.web.UserAuthentication;
import lombok.NonNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;
import org.springframework.security.authentication.AuthenticationServiceException;

import org.springframework.web.util.WebUtils;
import ru.ivan.springsecurity.domain.User;

@Component
public class TokenAuthService {

    private static final String AUTH_HEADER_NAME = "X-Auth-Token";

    @Autowired
    private TokenHandler tokenHandler;
    @Autowired
    private UserService userService;

    public Optional<Authentication> getAuthentication(@NonNull HttpServletRequest request) {
        return Optional
            .ofNullable((WebUtils.getCookie(request, AUTH_HEADER_NAME))!= null ? (WebUtils.getCookie(request, AUTH_HEADER_NAME)).getValue():null)
            .flatMap(tokenHandler::extractUserId)
            .flatMap(userService::findById)
            .map(UserAuthentication::new);
    }
}
