package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.springpizza.entity.Status;


public interface StatusRepository extends JpaRepository<Status, Long> {

    Status getStatusById(Long Id);

}
