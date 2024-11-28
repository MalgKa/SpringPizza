package pl.app.springpizza.security;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import pl.app.springpizza.sessionComponent.Cart;

@Controller
public class LoginController {

    private final Cart cart;

    public LoginController(Cart cart) {
        this.cart = cart;
    }

    @GetMapping("/login")
    String loginform() {
        cart.clear();
        return "login-form";
    }
}
