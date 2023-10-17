package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.springpizza.entity.Item;


public interface ItemRepository extends JpaRepository<Item, Long> {
    Item getItemById(Long id);
}
