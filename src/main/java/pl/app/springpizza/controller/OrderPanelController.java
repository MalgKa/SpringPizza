package pl.app.springpizza.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.entity.Status;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;
import pl.app.springpizza.repository.PlaceRepository;
import pl.app.springpizza.repository.StatusRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Comparator;
import java.util.List;

@Controller
public class OrderPanelController {
    private final OrderRepository orderRepository;
    private final StatusRepository statusRepository;
    private final PlaceRepository placeRepository;
    private final ItemRepository itemRepository;

    public OrderPanelController(OrderRepository orderRepository, StatusRepository statusRepository, PlaceRepository placeRepository, ItemRepository itemRepository) {
        this.orderRepository = orderRepository;
        this.statusRepository = statusRepository;
        this.placeRepository = placeRepository;
        this.itemRepository = itemRepository;
    }
    @GetMapping("order/panel")
    public String allOrders(Model model, @RequestParam(required = false) Long orderToEditId, @RequestParam(required = false) Long statusId) {
        if (orderToEditId != null) {
            Order orderToEdit = orderRepository.getOrderById(orderToEditId);
            model.addAttribute("orderToedit", orderToEdit);
        }

        if (statusId != null) {
            model.addAttribute("orderList", orderRepository.findAllByStatusId(statusId));
            System.out.println(orderRepository.findAllByStatusId(statusId));
        } else {
            model.addAttribute("orderList", orderRepository.findAll());
        }
        model.addAttribute("placeList", placeRepository.findAll());
        model.addAttribute("statusList", statusRepository.findAll());
        return "order-panel";
    }
    @PostMapping(value = "/order/panel", params = "edit")
    public String editOrder(Order order) {
        orderRepository.save(order);
        return "redirect:/order/panel";

    }
    @GetMapping("/order/items")
    public String findItemsByOrderId(@RequestParam Long orderId, Model model) {
        List<Item> items = itemRepository.findItemsByOrderId(orderId);
        //bez method reference
//        items.sort((item1,item2)-> Math.toIntExact(item1.getId() - item2.getId()));
        items.sort(Comparator.comparing(Item::getId));
        model.addAttribute("items", items);
        model.addAttribute("orderId", orderId);
        return "items-in-order";
    }
    @GetMapping("/order/removeItem")
    public String removeItemFromOrder(@RequestParam Long orderId, @RequestParam Long itemId){
        Order order = orderRepository.getOrderById(orderId);
        List<Item> listOfItemsInOrder = itemRepository.findItemsByOrderId(orderId);
        Item itemToRemove = listOfItemsInOrder.stream()
                .filter(item->item.getId().equals(itemId)).findFirst().orElse(null);
        double sumAfterRemove = order.getSum();
        if(itemToRemove != null){
            listOfItemsInOrder.remove(itemToRemove);
            sumAfterRemove = BigDecimal.valueOf(order.getSum() - itemToRemove.getPrice()).setScale(2, RoundingMode.HALF_UP).doubleValue() ;
        }
        order.setItemList(listOfItemsInOrder);
        order.setSum(sumAfterRemove);
        orderRepository.save(order);
        return "redirect:/order/items?orderId=" + orderId;
    }
    @GetMapping("/order/changeStatus")
    public String changeStatus(@RequestParam Long statusId, @RequestParam Long orderId) {
        Status statusAfterChange = statusRepository.getStatusById(statusId);
        Order order = orderRepository.getOrderById(orderId);
        order.setStatus(statusAfterChange);
        orderRepository.save(order);
        return "redirect:/order/panel";
    }
    @GetMapping("/order/discount")
    public String discount(@RequestParam Long orderId, @RequestParam double sumOfOrder) {
        Order order = orderRepository.getOrderById(orderId);
        double sum = (sumOfOrder - (sumOfOrder * 0.1));
        double roundedSum = Math.round(sum * 100.0) / 100.0;
        order.setSum(roundedSum);
        orderRepository.save(order);
        return "redirect:/order/panel";
    }
}
