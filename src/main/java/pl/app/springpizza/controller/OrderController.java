package pl.app.springpizza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.entity.Place;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;
import pl.app.springpizza.repository.PlaceRepository;
import pl.app.springpizza.repository.StatusRepository;
import pl.app.springpizza.sessionComponent.Cart;

import java.util.*;

@Controller
public class OrderController {
    private final Cart cart;

    private final ItemRepository itemRepository;

    private final OrderRepository orderRepository;

    private final PlaceRepository placeRepository;
    private final StatusRepository statusRepository;

    public OrderController(Cart cart, ItemRepository itemRepository, OrderRepository orderRepository, PlaceRepository placeRepository, StatusRepository statusRepository) {
        this.cart = cart;
        this.itemRepository = itemRepository;
        this.orderRepository = orderRepository;
        this.placeRepository = placeRepository;
        this.statusRepository = statusRepository;
    }

    @GetMapping("/addToCart")
    public String addItemToCart(@RequestParam Long itemId) {
        Optional<Item> item = itemRepository.findById(itemId);
        item.ifPresent(cart::add);
//        Message message;
//        if (item.isPresent()) {
//            message = new Message("Added", item.get().getName() + " added to the order");
//        } else {
//            message = new Message("not added", " incorrect order ID provided: " + itemId);
//        }
//        model.addAttribute("message", message);
//        System.out.println(cart.getOrder().toString());
//        return "message";

        return "redirect:/home";

    }

    @GetMapping("/cart")
    public String getCurrentOrder(Model model) {
        List<Place> placeList = placeRepository.findAll();
        double sum = cart
                .getOrder()
                .getItemList().stream()
                .mapToDouble(Item::getPrice)
                .sum();
        List<Item> sortedItemList = new ArrayList<>(cart.getOrder().getItemList());
        sortedItemList.sort(Comparator.comparingInt(item -> item.getId().intValue()));
        model.addAttribute("placeList", placeList);
        model.addAttribute("sortedItemList", sortedItemList);
        model.addAttribute("cart", cart.getOrder());
        model.addAttribute("sum", Math.floor(sum * 100) / 100);
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
    public String proceedOrder(@RequestParam Long placeId, @RequestParam Double sum, Model model) {
        Order order = cart.getOrder();
        order.setPlace(placeRepository.getById(placeId));
        order.setSum(sum);
        order.setStatus(statusRepository.getStatusById(Long.parseLong("1")));
        orderRepository.save(order);
        cart.clear();
        model.addAttribute("message", new Message("Thank you", "Your order has been processed"));
        return "message";
    }
}
