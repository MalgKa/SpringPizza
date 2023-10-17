package pl.app.springpizza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping("/itemList")
    public String ListOfItemsView(Model model) {
        model.addAttribute("items", itemRepository.findAll());
        return "item-list";
    }

    @GetMapping("/delete")
    public String deleteItemView(Model model, @RequestParam Long id) {
        model.addAttribute("item", itemRepository.getItemById(id));
        return "/delete-item";
    }

    @PostMapping("/delete")
    public String deleteItem(@RequestParam Long itemId) {
        Item item = itemRepository.getItemById(itemId);
        itemRepository.delete(item);
        return "redirect:/admin/itemList";
    }

    @GetMapping("/update")
    public String updateItemView(Model model, @RequestParam Long id) {
        model.addAttribute("item", itemRepository.getItemById(id));
        return "/update-item";
    }

    @PostMapping("/update")
    public String updateItem(Item item) {
        itemRepository.save(item);
        return "redirect:/admin/itemList";
    }

}
