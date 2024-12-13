package pl.app.springpizza.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.service.AdminService;

import java.math.BigDecimal;
import java.util.List;

@Controller
public class AdminController {

    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping("order/panel")
    public String allOrders(Model model, @RequestParam(required = false) Long orderToEditId, @RequestParam(required = false) Long statusId) {
        model.addAttribute("orderToEdit", adminService.getOrderToEdit(orderToEditId));
        model.addAttribute("orderList", adminService.getOrdersByStatus(statusId));
        model.addAttribute("placeList", adminService.getAllPlaces());
        model.addAttribute("statusList", adminService.getAllStatuses());
        return "order-panel";
    }

    @PostMapping(value = "/order/panel", params = "edit")
    public String editOrder(Order order) {
        adminService.saveOrder(order);
        return "redirect:/order/panel";
    }

    @GetMapping("/order/items")
    public String findItemsByOrderId(@RequestParam Long orderId, Model model) {
        List<Item> items = adminService.getSortedItemsByOrderId(orderId);
        model.addAttribute("items", items);
        model.addAttribute("orderId", orderId);
        return "items-in-order";
    }

    @GetMapping("/order/removeItem")
    public String removeItemFromOrder(@RequestParam Long orderId, @RequestParam Long itemId) {
        adminService.removeItemFromOrder(orderId, itemId);
        return "redirect:/order/items?orderId=" + orderId;
    }

    @GetMapping("/order/changeStatus")
    public String changeStatus(@RequestParam Long statusId, @RequestParam Long orderId) {
        adminService.changeOrderStatus(orderId, statusId);
        return "redirect:/order/panel";
    }

    @GetMapping("/order/discount")
    public String discount(@RequestParam Long orderId, @RequestParam BigDecimal sumOfOrder) {
        adminService.applyDiscount(orderId, sumOfOrder);
        return "redirect:/order/panel";
    }
}
