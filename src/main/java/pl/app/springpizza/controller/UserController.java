package pl.app.springpizza.controller;

import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.app.springpizza.entity.User;
import pl.app.springpizza.service.UserService;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "registration-form";
    }

    @PostMapping("/register")
    public String register(@Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "registration-form";
        }
        userService.registerUser(user);
        return "redirect:/home";
    }
}
