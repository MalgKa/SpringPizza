package pl.app.springpizza.sessionComponent;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;

@Component
@SessionScope
public class Cart {

    private Order order;

    public Cart() {
        clear();
    }
   public Order getOrder() {
        return order;
    }


    public void add(Item item) {
        order.getItemList().add(item);
    }

    public void clear() {
        order = new Order();
    }
}
