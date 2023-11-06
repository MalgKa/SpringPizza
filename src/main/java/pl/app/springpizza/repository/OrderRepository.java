package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Long> {
    Order getOrderById(Long id);
    List<Order> findAllByStatusId(Long StatusId);
    List<Order> findAllByItemListContains(Item item);
}
