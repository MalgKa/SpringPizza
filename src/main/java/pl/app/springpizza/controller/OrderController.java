package pl.app.springpizza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;
import pl.app.springpizza.sessionComponent.Cart;

import java.util.Optional;

@Controller
public class OrderController {
    private final Cart cart;

    private final ItemRepository itemRepository;

    private final OrderRepository orderRepository;

    public OrderController(Cart cart, ItemRepository itemRepository, OrderRepository orderRepository) {
        this.cart = cart;
        this.itemRepository = itemRepository;
        this.orderRepository = orderRepository;
    }

    @GetMapping("/addToCart")
    public String addItemToCart(@RequestParam Long itemId, Model model) {
        System.out.println(itemId);
        Optional<Item> item = itemRepository.findById(itemId);
        item.ifPresent(cart::add);
        Message message;
        if (item.isPresent()) {
            message = new Message("Added", item.get().getName() + " added to the order");
        } else {
            message = new Message("not added", " incorrect order ID provided: " + itemId);
        }
        model.addAttribute("message", message);
        System.out.println(cart.getOrder().toString());
        return "message";
    }
}
