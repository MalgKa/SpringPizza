package pl.app.springpizza.service;

import org.springframework.stereotype.Service;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    private final ItemRepository itemRepository;
    private final OrderRepository orderRepository;

    public ItemServiceImpl(ItemRepository itemRepository, OrderRepository orderRepository) {
        this.itemRepository = itemRepository;
        this.orderRepository = orderRepository;
    }

    @Transactional
    @Override
    public boolean removeItem(Item item) {
        if (item == null) {
            throw new IllegalArgumentException("Item cannot be null");
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
                        orderRepository.delete(order);
                    } else {
                        double totalPriceReduction = item.getPrice() * itemCount;
                        double totalPrice = order.getSum();
                        double newTotalPrice = BigDecimal.valueOf(totalPrice - totalPriceReduction).setScale(2, RoundingMode.HALF_UP).doubleValue();
                        order.setSum(newTotalPrice);
                        orderRepository.save(order);
                    }
                });

        itemRepository.delete(item);
        return true;
    }
}
