package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.app.springpizza.entity.Item;

import java.util.List;


public interface ItemRepository extends JpaRepository<Item, Long> {
    Item getItemById(Long id);
    @Query("SELECT o.itemList FROM Order o WHERE o.id = :orderId")
    List<Item> findItemsByOrderId(Long orderId);
}
