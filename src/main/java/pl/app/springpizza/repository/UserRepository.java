package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.springpizza.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User getByUsername(String username);

    @EntityGraph(type = EntityGraph.EntityGraphType.LOAD, attributePaths = {"userOrders"})
    User getWithOrderByUsername(String username);

}