package pl.app.springpizza.service;

import org.springframework.stereotype.Service;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.entity.Place;
import pl.app.springpizza.entity.Status;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;
import pl.app.springpizza.repository.PlaceRepository;
import pl.app.springpizza.repository.StatusRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Comparator;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    private final OrderRepository orderRepository;
    private final ItemRepository itemRepository;
    private final PlaceRepository placeRepository;
    private final StatusRepository statusRepository;

    public AdminServiceImpl(OrderRepository orderRepository, ItemRepository itemRepository, PlaceRepository placeRepository, StatusRepository statusRepository) {
        this.orderRepository = orderRepository;
        this.itemRepository = itemRepository;
        this.placeRepository = placeRepository;
        this.statusRepository = statusRepository;
    }

    @Override
    public Order getOrderToEdit(Long orderToEditId) {
        return orderToEditId != null ? orderRepository.getOrderById(orderToEditId) : null;
    }

    @Override
    public List<Order> getOrdersByStatus(Long statusId) {
        return statusId != null ? orderRepository.findAllByStatusId(statusId) : orderRepository.findAll();
    }

    @Override
    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }

    @Override
    public List<Status> getAllStatuses() {
        return statusRepository.findAll();
    }

    @Override
    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    @Override
    public List<Item> getSortedItemsByOrderId(Long orderId) {
        List<Item> items = itemRepository.findItemsByOrderId(orderId);
        items.sort(Comparator.comparing(Item::getId));
        return items;
    }

    @Override
    public void removeItemFromOrder(Long orderId, Long itemId) {
        Order order = orderRepository.getOrderById(orderId);
        List<Item> listOfItemsInOrder = itemRepository.findItemsByOrderId(orderId);
        Item itemToRemove = listOfItemsInOrder.stream()
                .filter(item -> item.getId().equals(itemId))
                .findFirst()
                .orElse(null);
        if (itemToRemove != null) {
            listOfItemsInOrder.remove(itemToRemove);
            BigDecimal updatedSum = order.getSum().subtract(itemToRemove.getPrice()).setScale(2,
                    RoundingMode.HALF_UP);
            order.setSum(updatedSum);
            order.setItemList(listOfItemsInOrder);
            orderRepository.save(order);
        }
    }

    @Override
    public void changeOrderStatus(Long orderId, Long statusId) {
        Status statusUpdated = statusRepository.getStatusById(statusId);
        Order order = orderRepository.getOrderById(orderId);
        order.setStatus(statusUpdated);
        orderRepository.save(order);
    }

    @Override
    public void applyDiscount(Long orderId, BigDecimal sumOfOrder) {
        Order order = orderRepository.getOrderById(orderId);
        BigDecimal discount = sumOfOrder.multiply(BigDecimal.valueOf(0.1));
        BigDecimal sumAfterDiscount = sumOfOrder.subtract(discount).setScale(2, RoundingMode.HALF_UP);
        order.setSum(sumAfterDiscount);
        orderRepository.save(order);
    }
}

