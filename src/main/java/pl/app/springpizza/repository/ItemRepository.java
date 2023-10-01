package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.springpizza.entity.Item;
import java.util.List;

public interface ItemRepository extends JpaRepository<Item ,Long> {
    List<Item> findAllByType(String type);
}
