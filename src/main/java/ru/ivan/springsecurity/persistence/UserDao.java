package ru.ivan.springsecurity.persistence;

import com.google.common.collect.ImmutableList;
import java.util.List;
import ru.ivan.springsecurity.domain.User;
import ru.ivan.springsecurity.domain.UserField;
import lombok.NonNull;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import java.util.Optional;

import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;

@Component
public class UserDao {
    @Autowired
    private MongoTemplate mongoTemplate;

    public Optional<User> findByUsername(@NonNull String username) {
        return Optional.ofNullable(
                mongoTemplate.findOne(
                        query(
                                where(UserField.USER_NAME.field()).is(username))

                        , User.class));
    }

    public void save(@NonNull User user) {
        mongoTemplate.save(user);
    }

    public Optional<User> findById(@NonNull ObjectId id) {
        return Optional.ofNullable(mongoTemplate.findById(id, User.class));
    }
    public  Optional<List<User>> getAllUsers () {
        return Optional.ofNullable(ImmutableList.copyOf(mongoTemplate.findAll(User.class)));
    }
    
    public void deletUser (String username) {
        mongoTemplate.findAndRemove(query (where(UserField.USER_NAME.field()).is(username)), User.class);
    }
}
