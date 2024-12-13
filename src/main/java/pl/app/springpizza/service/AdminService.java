package pl.app.springpizza.service;

import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.entity.Place;
import pl.app.springpizza.entity.Status;

import java.math.BigDecimal;
import java.util.List;

public interface AdminService {
    Order getOrderToEdit(Long orderToEditId);

    List<Order> getOrdersByStatus(Long statusId);

    List<Place> getAllPlaces();

    List<Status> getAllStatuses();

    void saveOrder(Order order);

    List<Item> getSortedItemsByOrderId(Long orderId);

    void removeItemFromOrder(Long orderId, Long itemId);

    void changeOrderStatus(Long orderId, Long statusId);

    void applyDiscount(Long orderId, BigDecimal sumOfOrder);
}
