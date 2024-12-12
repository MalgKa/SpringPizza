package pl.app.springpizza.service;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;
import pl.app.springpizza.repository.UserRepository;
import pl.app.springpizza.sessionComponent.Cart;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;
import java.util.Optional;

@Service
public class ItemServiceImpl implements ItemService {

    private final ItemRepository itemRepository;
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    public final Cart cart;

    Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);

    public ItemServiceImpl(ItemRepository itemRepository, OrderRepository orderRepository, UserRepository userRepository, Cart cart) {
        this.itemRepository = itemRepository;
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
        this.cart = cart;
    }

    @Override
    public Multimap<String, Item> getAvailableItemsGroupedByType() {
        List<Item> items = itemRepository.findAll();
        Multimap<String, Item> multimap = ArrayListMultimap.create();
        items.stream()
                .filter(item -> item.getAvailability().equals("Y"))
                .forEach(item -> multimap.put(item.getType(), item));
        return multimap;
    }

    @Override
    public int getNumberOfItemsInCart() {
        return cart.getOrder().getItemList().size();
    }

    @Override
    public List<Item> getAllItems() {
        return itemRepository.findAll();
    }

    @Override
    public Item getItemById(Long id) {
        return itemRepository.getItemById(id);
    }

    @Override
    public Optional<Item> findById(Long id) {
        Optional<Item> item = itemRepository.findById(id);
        if (item.isEmpty()) {
            logger.error("Item with ID {} not found in database", id);
        }
        return item;
    }

    @Override
    public Item save(Item item) {
        return itemRepository.save(item);
    }

    @Transactional
    @Override
    public boolean removeItem(Item item) {
        if (item == null || item.getId() == null) {
            throw new IllegalArgumentException("Item or item ID cannot be null");
        }
        boolean exists = itemRepository.existsById(item.getId());
        if (!exists) {
            throw new IllegalArgumentException(String.format("Item with %d does not exist", item.getId()));
        }
        List<Order> relatedOrder = orderRepository.findAllByItemListContains(item);
        relatedOrder.forEach(
                order -> {
                    long itemCount = order.getItemList().stream()
                            .filter(orderItem -> orderItem.getId().equals(item.getId()))
                            .count();
                    order.getItemList().removeIf(i -> i.getId().equals(item.getId()));
                    if (order.getItemList().isEmpty()) {
                        userRepository.getUserByOrderId(order.getId()).getUserOrders().remove(order);
                        orderRepository.delete(order);
                    } else {
                        BigDecimal totalPriceReduction = item.getPrice().multiply(BigDecimal.valueOf(itemCount));
                        BigDecimal totalPrice = order.getSum();
                        BigDecimal newTotalPrice = totalPrice.subtract(totalPriceReduction).setScale(2, RoundingMode.HALF_UP);
                        order.setSum(newTotalPrice);
                        orderRepository.save(order);
                    }
                });
        itemRepository.delete(item);
        return true;
    }
}
