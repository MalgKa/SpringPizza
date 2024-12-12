package pl.app.springpizza.service;

import com.google.common.collect.Multimap;
import pl.app.springpizza.entity.Item;

import java.util.List;
import java.util.Optional;

public interface ItemService {
    Multimap<String, Item> getAvailableItemsGroupedByType();

    int getNumberOfItemsInCart();

    List<Item> getAllItems();

    Item getItemById(Long id);

    Optional<Item> findById(Long id);

    Item save(Item item);

    boolean removeItem(Item item);
}
