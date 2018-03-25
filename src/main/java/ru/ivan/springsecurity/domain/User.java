package ru.ivan.springsecurity.domain;

import com.google.common.collect.ImmutableList;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.List;
import javax.validation.constraints.*;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Document(collection = "users")
public class User implements UserDetails {

    private static final long serialVersionUID = -6319038172906820788L;
    @Id
    private ObjectId id;
    
    @Indexed(unique = true)
    @NotBlank (message = "Поле Login не заполненно!")
    @Size (min = 8, max = 32, message = "Login должен быть от 8 до 32 символов!")
    private String username;
    
    @NotNull
    private List<Role> authorities;
    
    @NotBlank (message = "Поле Password не заполненно!")
    private String password;
        
    private boolean accountNonExpired;
    private boolean accountNonLocked;
    private boolean credentialsNonExpired;
    private boolean enabled;
    
    @NotBlank (message = "Поле name не заполненно!")
    @Size (min = 1, max = 32, message = "Имя должно быть от 1 до 32 символов!")
    private String name;
    
    @NotBlank (message = "Поле email не заполненно!")
    @Email (message = "Не корректный email!")
    private String email;

    public void setAuthorities(String role) {
        this.authorities = ImmutableList.of(Role.valueOf((role)));
    }
    
    public void setPassword (String password) {
        this.password = new BCryptPasswordEncoder().encode(password);
    }
}
