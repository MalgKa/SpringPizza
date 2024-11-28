package pl.app.springpizza.controller;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.sessionComponent.Cart;

import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {

    private final ItemRepository itemRepository;
    private final Cart cart;

    public HomeController(ItemRepository itemRepository, Cart cart) {
        this.itemRepository = itemRepository;
        this.cart = cart;
    }

    @GetMapping({"/home", "/"})
    public String home(Model model) {
        List<Item> items = itemRepository.findAll();
        Multimap<String, Item> mapOfDishes = ArrayListMultimap.create();
        items.stream()
                .filter(i -> i.getAvailability().equals("Y"))
                .forEach(i -> mapOfDishes.put(i.getType(), i));
        model.addAttribute("numberOfItems", cart.getOrder().getItemList().size());
        model.addAttribute("mapOfDishes", mapOfDishes);
        return "home";
    }

    @GetMapping("/item/details")
    public String details(@RequestParam Long itemId, Model model) {
        Optional<Item> item = itemRepository.findById(itemId);
        item.ifPresent(i -> model.addAttribute("item", i));
        return item.map(i -> "item-details").orElse("redirect:/home");
    }
}
