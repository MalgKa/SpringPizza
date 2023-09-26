package pl.app.springpizza.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    public String allOrders(Model model){
        List<Order> ordersList = orderRepository.findAll();
        model.addAttribute("orderList", ordersList);
        return "order-panel";
    }

}
