package ru.ivan.springsecurity.persistence;

import com.google.common.collect.ImmutableList;
import com.mongodb.DBObject;
import com.mongodb.WriteResult;
import java.util.List;
import java.util.Map;
import ru.ivan.springsecurity.domain.User;
import ru.ivan.springsecurity.domain.UserField;
import lombok.NonNull;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;

import java.util.Optional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;

@Component
public class UserDao {
    private final Logger logger = LoggerFactory.getLogger(UserDao.class);
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
    
    public User deletUser (@NonNull String username) {
        return (User) mongoTemplate.findAndRemove(query (where(UserField.USER_NAME.field()).is(username)), User.class);
    }
    public boolean updateUser (@NonNull String userName, @NonNull Map <String, Object> newUserUpdate) {
        Update update = new Update();
        for (String str : newUserUpdate.keySet()) {
            update.set(str, newUserUpdate.get(str));
        }
        WriteResult result = mongoTemplate.updateFirst(query (where(UserField.USER_NAME.field()).is(userName)), update, User.class);
        if (result.getN()!=0 && result.isUpdateOfExisting())
            return true;
        else
            return false;
    }
}
