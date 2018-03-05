package ru.ivan.springsecurity.services;

import ru.ivan.springsecurity.domain.User;
import ru.ivan.springsecurity.persistence.UserDao;
import lombok.NonNull;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {
    @Autowired
    private UserDao userDao;

    @Override
    public UserDetails loadUserByUsername(@NonNull String username) throws UsernameNotFoundException {
        return userDao.findByUsername(username).orElseThrow(() ->
                new UsernameNotFoundException("user " + username + " was not found!"));
    }

    public Optional<User> findById(@NonNull ObjectId id) {
        return userDao.findById(id);
    }
    public void saveUser (@NonNull User user) {
        userDao.save(user);
    }
}
