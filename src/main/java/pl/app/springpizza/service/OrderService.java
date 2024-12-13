package pl.app.springpizza.service;

import pl.app.springpizza.entity.*;
import pl.app.springpizza.sessionComponent.Cart;

import java.math.BigDecimal;
import java.util.List;

public interface OrderService {
    void addItemToCart(Long id);

    List<Place> getAllPlaces();

    BigDecimal calculateOrderSum(Cart cart);

    List<Item> getSortedItemList(Cart cart);

    User getAuthenticatedUser(String username);

    void removeItemFromCart(Long itemId);

    Order getOrder(Cart cart);

    void clearCart();

    Message processOrder(String username, Long placeId, BigDecimal sum);
}
