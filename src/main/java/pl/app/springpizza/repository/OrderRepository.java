package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.springpizza.entity.Order;

public interface OrderRepository extends JpaRepository<Order,Long> {
}
