package pl.app.springpizza.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Message;
import pl.app.springpizza.entity.User;
import pl.app.springpizza.service.OrderService;
import pl.app.springpizza.sessionComponent.Cart;

import java.math.BigDecimal;

@Controller
public class OrderController {

    private final OrderService orderService;
    private final Cart cart;

    public OrderController(OrderService orderService, Cart cart) {
        this.orderService = orderService;
        this.cart = cart;
    }

    @GetMapping("/addToCart")
    public String addItemToCart(@RequestParam Long itemId) {
        orderService.addItemToCart(itemId);
        return "redirect:/home";
    }

    @GetMapping("/cart")
    public String getCurrentOrder(@AuthenticationPrincipal UserDetails authenticatedUser, Model model) {
        boolean isCartEmpty = orderService.isCartEmpty();
        if (authenticatedUser != null) {
            User loggedUser = orderService.getAuthenticatedUser(authenticatedUser.getUsername());
            model.addAttribute("loggedUser", loggedUser);
        }
        model.addAttribute("isCartEmpty", isCartEmpty);
        model.addAttribute("placeList", orderService.getAllPlaces());
        model.addAttribute("sortedItemList", orderService.getSortedItemList(cart));
        model.addAttribute("cart", orderService.getOrder(cart));
        model.addAttribute("sum", orderService.calculateOrderSum(cart));
        return "cart";
    }

    @GetMapping("/removeFromCart")
    public String removeItemFromCart(@RequestParam Long itemId) {
        orderService.removeItemFromCart(itemId);
        return "redirect:/cart";
    }

    @GetMapping("/removeAllFromCart")
    public String removeAllItemsFromCart() {
        orderService.clearCart();
        return "redirect:/cart";
    }

    @PostMapping("/cart/agreed")
    public String proceedOrder(@AuthenticationPrincipal UserDetails authenticatedUser, @RequestParam Long placeId,
                               @RequestParam BigDecimal sum, Model model) {
        String username = authenticatedUser != null ? authenticatedUser.getUsername() : null;
        Message message = orderService.processOrder(username, placeId, sum);
        model.addAttribute("message", message);
        return "message";
    }
}
