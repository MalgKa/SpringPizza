package pl.app.springpizza.item;

import org.hibernate.exception.ConstraintViolationException;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.ActiveProfiles;
import pl.app.springpizza.TestFixtures;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.entity.Place;
import pl.app.springpizza.entity.Status;
import pl.app.springpizza.repository.ItemRepository;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@DataJpaTest
@ActiveProfiles("test-db")
public class ItemRepositoryTest {

    @Autowired
    private TestEntityManager testEntityManager;

    @Autowired
    private ItemRepository itemRepository;


    @Test
    public void findNonExistentItem() {

        Item existingItem = TestFixtures.item();
        testEntityManager.persistAndFlush(existingItem);

        Long nonExistentItemId = 99999L;
        Item nonExistentItem = itemRepository.findById(nonExistentItemId).orElse(null);

        assertNull(nonExistentItem);
    }

    @Test
    public void testFindAllItems() {
        Item item1 = TestFixtures.item();
        Item item2 = TestFixtures.item();
        testEntityManager.persistAndFlush(item1);
        testEntityManager.persistAndFlush(item2);

        List<Item> allItems = itemRepository.findAll();

        assertEquals(2, allItems.size());
    }

    @Test
    public void testUpdateItem() {
        Item item = TestFixtures.item();

        item.setName("Updated Item");
        testEntityManager.persistAndFlush(item);

        Item updatedItem = itemRepository.findById(item.getId()).orElse(null);

        assertNotNull(updatedItem);
        assertEquals("Updated Item", updatedItem.getName());
    }


    @Test
    public void givenItemWithoutRelatedOrder_whenDeletingItem_itemShouldBeRemoved() {
        Status status = TestFixtures.status();
        Place place = TestFixtures.place();
        Item item = TestFixtures.item();
        Order order = TestFixtures.orderWithStatusAndPlace(status, place);

        testEntityManager.persist(status);
        testEntityManager.persist(place);
        testEntityManager.persist(order);
        testEntityManager.persist(item);

        itemRepository.delete(item);
        itemRepository.flush();

        boolean exists = itemRepository.existsById(item.getId());
        assertFalse(exists);
    }


    @Test
    public void givenItemWithRelatedOrder_whenDeletingItem_throwException() {
        Status status = TestFixtures.status();
        Place place = TestFixtures.place();
        Item item = TestFixtures.item();
        Order order = TestFixtures.orderWithItemAndStatusAndPlace(item, status, place);

        testEntityManager.persist(status);
        testEntityManager.persist(place);
        testEntityManager.persist(order);
        testEntityManager.persistAndFlush(item);

        Item itemInTest = itemRepository.getItemById(item.getId());
        RuntimeException exception = assertThrows(RuntimeException.class, () -> {
            itemRepository.delete(itemInTest);
            itemRepository.flush();
        });
        assertEquals(ConstraintViolationException.class, exception.getCause().getClass());
    }

}
