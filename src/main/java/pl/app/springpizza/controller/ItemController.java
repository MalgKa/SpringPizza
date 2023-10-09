package pl.app.springpizza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.repository.ItemRepository;


@Controller
@RequestMapping("/admin")
public class ItemController {

    private final ItemRepository itemRepository;

    public ItemController(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

    @GetMapping("/addItem")
    public String addItemView(Model model) {
        model.addAttribute("item", new Item());
        return "add-item";
    }

    @PostMapping("/addItem")
    public String addItem(Item item) {
        itemRepository.save(item);
        return "redirect:/admin/addItem";
    }

}
