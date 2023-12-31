package pl.app.springpizza.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.entity.Place;
import pl.app.springpizza.entity.User;
import pl.app.springpizza.repository.*;
import pl.app.springpizza.sessionComponent.Cart;

import java.math.BigDecimal;
import java.util.*;

@Controller
public class OrderController {
    private final Cart cart;

    private final ItemRepository itemRepository;

    private final OrderRepository orderRepository;

    private final PlaceRepository placeRepository;
    private final StatusRepository statusRepository;
    private final UserRepository userRepository;

    public OrderController(Cart cart, ItemRepository itemRepository, OrderRepository orderRepository, PlaceRepository placeRepository, StatusRepository statusRepository, UserRepository userRepository) {
        this.cart = cart;
        this.itemRepository = itemRepository;
        this.orderRepository = orderRepository;
        this.placeRepository = placeRepository;
        this.statusRepository = statusRepository;
        this.userRepository = userRepository;
    }

    @GetMapping("/addToCart")
    public String addItemToCart(@RequestParam Long itemId) {
        Optional<Item> item = itemRepository.findById(itemId);
        item.ifPresent(cart::add);
        return "redirect:/home";
    }

    @GetMapping("/cart")
    public String getCurrentOrder(@AuthenticationPrincipal UserDetails authenticatedUser, Model model) {
        List<Place> placeList = placeRepository.findAll();
        BigDecimal sum = cart
                .getOrder()
                .getItemList().stream()
                .map(item -> BigDecimal.valueOf(item.getPrice()))
                .reduce(BigDecimal.ZERO, (accumulator, price) -> accumulator.add(price));
        List<Item> sortedItemList = new ArrayList<>(cart.getOrder().getItemList());
        sortedItemList.sort(Comparator.comparingInt(item -> item.getId().intValue()));
        if (authenticatedUser != null) {
            User loggedUser = userRepository.getWithOrderByUsername(authenticatedUser.getUsername());
            model.addAttribute("loggedUser", loggedUser);
        }
        model.addAttribute("placeList", placeList);
        model.addAttribute("sortedItemList", sortedItemList);
        model.addAttribute("cart", cart.getOrder());
        model.addAttribute("sum", sum);
        return "cart";
    }

    @GetMapping("/removeFromCart")
    public String removeItemFromCart(@RequestParam Long itemId) {
        List<Item> itemsInCart = cart.getOrder().getItemList();
        itemsInCart.stream()
                .filter(i -> i.getId().equals(itemId))
                .findFirst().ifPresent(itemsInCart::remove);
        return "redirect:/cart";
    }

    @GetMapping("/removeAllFromCart")
    public String removeAllItemsFromCart() {
        cart.clear();
        return "redirect:/cart";
    }

    @PostMapping("/cart/agreed")
    public String proceedOrder(@AuthenticationPrincipal UserDetails authenticatedUser, @RequestParam Long placeId, @RequestParam Double sum, Model model) {
        Order order = cart.getOrder();
        order.setPlace(placeRepository.getById(placeId));
        order.setSum(sum);
        order.setStatus(statusRepository.getStatusById(Long.parseLong("1")));
        orderRepository.save(order);
        if (authenticatedUser != null) {
            User user = userRepository.getWithOrderByUsername(authenticatedUser.getUsername());
            user.getUserOrders().add(order);
            userRepository.save(user);
        }
        cart.clear();
        model.addAttribute("message", new Message("Thank you", "Your order has been received for processing"));
        return "message";
    }
}
