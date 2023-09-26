package pl.app.springpizza.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.repository.OrderRepository;

import java.util.List;

@Controller
public class OrderPanelController {

    private final OrderRepository orderRepository;

    public OrderPanelController(OrderRepository orderRepository) {
        this.orderRepository = orderRepository;
    }

    @GetMapping("order/panel")
    public String allOrders(Model model, @RequestParam(required = false) Long orderId){
        if(orderId != null){
            Order orderToEdit = orderRepository.getOrderById(orderId);
            model.addAttribute("orderToedit", orderToEdit);
        }
        List<Order> ordersList = orderRepository.findAll();
        model.addAttribute("orderList", ordersList);
        return "order-panel";
    }

    @GetMapping("/items/order")
    public String findItemsByOrderId(@RequestParam Long orderId, Model model) {
        List<Item> items = orderRepository.findItemsByOrderId(orderId);
        model.addAttribute("items", items);
        return "items-in-order";
    }

}
