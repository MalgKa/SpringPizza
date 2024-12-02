package pl.app.springpizza.service;

import org.springframework.stereotype.Service;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;
import pl.app.springpizza.repository.UserRepository;

import javax.transaction.Transactional;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    private final ItemRepository itemRepository;
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    public ItemServiceImpl(ItemRepository itemRepository, OrderRepository orderRepository, UserRepository userRepository) {
        this.itemRepository = itemRepository;
        this.orderRepository = orderRepository;
        this.userRepository = userRepository;
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
