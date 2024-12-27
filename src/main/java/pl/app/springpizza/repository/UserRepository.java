package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.app.springpizza.entity.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {

    User getByUsername(String username);

    @EntityGraph(type = EntityGraph.EntityGraphType.LOAD, attributePaths = {"userOrders"})
    User getWithOrderByUsername(String username);

    @Query("SELECT u FROM User u JOIN u.userOrders o where o.id = :orderId")
    User getUserByOrderId(Long orderId);

    Optional<User> findByUsername(String username);
}