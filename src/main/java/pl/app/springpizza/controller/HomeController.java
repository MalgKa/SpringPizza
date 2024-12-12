package pl.app.springpizza.controller;

import com.google.common.collect.Multimap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.service.ItemService;

import java.util.Optional;

@Controller
public class HomeController {
    private final ItemService itemService;

    public HomeController(ItemService itemService) {
        this.itemService = itemService;
    }

    @GetMapping({"/home", "/"})
    public String home(Model model) {
        Multimap<String, Item> mapOfDishes = itemService.getAvailableItemsGroupedByType();
        int numberOfItems = itemService.getNumberOfItemsInCart();
        model.addAttribute("numberOfItems", numberOfItems);
        model.addAttribute("mapOfDishes", mapOfDishes);
        return "home";
    }

    @GetMapping("/item/details")
    public String details(@RequestParam Long itemId, Model model) {
        Optional<Item> itemFromDb = itemService.findById(itemId);
        itemFromDb.ifPresent(foundItem -> model.addAttribute("item", foundItem));
        return itemFromDb.map(foundItem -> "item-details").orElse("redirect:/home");
    }
}
