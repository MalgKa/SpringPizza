package pl.app.springpizza.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.app.springpizza.entity.Place;

public interface PlaceRepository extends JpaRepository<Place, Long> {

    Place getById(Long id);
}
