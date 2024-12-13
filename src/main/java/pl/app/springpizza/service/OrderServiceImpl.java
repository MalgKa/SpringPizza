package pl.app.springpizza.service;

import org.springframework.stereotype.Service;
import pl.app.springpizza.entity.*;
import pl.app.springpizza.repository.*;
import pl.app.springpizza.sessionComponent.Cart;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService {
    private final OrderRepository orderRepository;
    private final ItemRepository itemRepository;
    private final PlaceRepository placeRepository;
    private final UserRepository userRepository;
    private final StatusRepository statusRepository;
    private final Cart cart;

    public OrderServiceImpl(OrderRepository orderRepository, ItemRepository itemRepository, PlaceRepository placeRepository, UserRepository userRepository, StatusRepository statusRepository, Cart cart) {
        this.orderRepository = orderRepository;
        this.itemRepository = itemRepository;
        this.placeRepository = placeRepository;
        this.userRepository = userRepository;
        this.statusRepository = statusRepository;
        this.cart = cart;
    }

    @Override
    public void addItemToCart(Long id) {
        Optional<Item> item = itemRepository.findById(id);
        item.ifPresent(cart::add);
    }

    @Override
    public List<Place> getAllPlaces() {
        return placeRepository.findAll();
    }

    @Override
    public BigDecimal calculateOrderSum(Cart cart) {
        List<Item> itemList = cart.getOrder().getItemList();
        return itemList.stream().map(Item::getPrice).reduce(BigDecimal.ZERO,
                BigDecimal::add);
    }

    @Override
    public List<Item> getSortedItemList(Cart cart) {
        List<Item> itemList = new ArrayList<>(cart.getOrder().getItemList());
        itemList.sort(Comparator.comparing(Item::getId));
        return itemList;
    }

    @Override
    public User getAuthenticatedUser(String username) {
        return userRepository.getWithOrderByUsername(username);
    }

    @Override
    public void removeItemFromCart(Long itemId) {
        List<Item> itemsInCart = cart.getOrder().getItemList();
        itemsInCart.stream()
                .filter(itemInCart -> itemInCart.getId().equals(itemId))
                .findFirst().ifPresent(itemsInCart::remove);
    }

    @Override
    public Order getOrder(Cart cart) {
        return cart.getOrder();
    }

    @Override
    public void clearCart() {
        cart.clear();
    }

    @Override
    public Message processOrder(String username, Long placeId, BigDecimal sum) {
        Order order = cart.getOrder();
        order.setPlace(placeRepository.getById(placeId));
        order.setSum(sum);
        order.setStatus(statusRepository.getStatusById(1L));
        orderRepository.save(order);
        if (username != null) {
            User user = userRepository.getWithOrderByUsername(username);
            user.getUserOrders().add(order);
            userRepository.save(user);
        }
        cart.clear();
        return new Message("Thank you", "Your order has been received for processing");
    }
}

