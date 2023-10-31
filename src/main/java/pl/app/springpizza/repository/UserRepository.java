package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.springpizza.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User getByUsername(String username);
}