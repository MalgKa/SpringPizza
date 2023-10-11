package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.app.springpizza.entity.Item;
import java.util.List;

public interface ItemRepository extends JpaRepository<Item ,Long> {
    @Query("SELECT i FROM Item i WHERE i.availability='Y' AND i.type=:type")
    List<Item> findAllAvailableByType(String type);
}
