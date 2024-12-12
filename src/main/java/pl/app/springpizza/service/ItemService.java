package pl.app.springpizza.service;

import pl.app.springpizza.entity.Item;

import java.util.List;

public interface ItemService {
    List<Item> getAllItems();

    Item getItemById(Long id);

    Item save(Item item);

    boolean removeItem(Item item);
}
