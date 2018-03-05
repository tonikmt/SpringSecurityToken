package ru.ivan.springsecurity.web;

import com.google.common.collect.ImmutableList;
import java.time.LocalDateTime;
import ru.ivan.springsecurity.domain.Role;
import ru.ivan.springsecurity.domain.User;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import static java.util.stream.Collectors.joining;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import ru.ivan.springsecurity.services.TokenHandler;
import ru.ivan.springsecurity.services.UserService;

@CrossOrigin
@Controller
public class MainController {

    @Autowired
    UserService userService;

    @Autowired
    private TokenHandler tokenHandler;

    @RequestMapping("/")
    public String getMainPage(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = (User) authentication.getPrincipal();
        
        user.getAuthorities().forEach((role) -> {
            System.out.println(role.getAuthority());
        });
        
        model.addAttribute("username", user.getUsername());
        model.addAttribute("roles", user.getAuthorities().stream().map(Role::getAuthority).collect(joining(",")));
        return "index";
    }
       @RequestMapping(value = "/login")
    public String getLogin(HttpServletResponse response, HttpServletRequest request,
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout,
            Model model) {
        if (logout != null) {
            response.addCookie(new Cookie("X-Auth-Token", ""));
        }
        model.addAttribute("error", error != null);
        model.addAttribute("logout", logout != null);
        return "login";
    }

    @RequestMapping("/in")
    public String in(HttpServletResponse response, HttpServletRequest request) {
        if (request.getParameter("username") != null && request.getParameter("password") != null) {
            if (new BCryptPasswordEncoder().matches(request.getParameter("password"), ((User) userService.loadUserByUsername(request.getParameter("username"))).getPassword())) {
                Cookie cookie = new Cookie("X-Auth-Token", tokenHandler.generateAccessToken(((User) userService.loadUserByUsername(request.getParameter("username"))).getId(), LocalDateTime.now().plusMinutes(1)));
                cookie.setHttpOnly(true);
                cookie.setMaxAge(120);
                cookie.setPath("/");
                cookie.setSecure(true);
                response.addCookie(cookie);
                return "redirect:/";
            } else {
                return "login?error";
            }
        } else {
            return "login?error";
        }
    }

    @RequestMapping("/addUser")
    public String addUser(HttpServletResponse response) {
        return "addUser";
    }

    @RequestMapping("/addNewUser")
    public String addNewUser(HttpServletRequest request, HttpServletResponse response,
            Model model) {

        userService.saveUser(User.builder()
                .username(request.getParameter("username"))
                .authorities(ImmutableList.of(request.getParameter("role").equals("ADMIN")? Role.ADMIN : Role.USER))
                .password(new BCryptPasswordEncoder().encode(request.getParameter("password")))
                .name(request.getParameter("name"))
                .email(request.getParameter("email"))
                .accountNonExpired(true)
                .accountNonLocked(true)
                .credentialsNonExpired(true)
                .enabled(true)
                .build());
        return "addUser";
    }
}
