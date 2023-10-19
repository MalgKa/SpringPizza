package pl.app.springpizza.item;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;
import pl.app.springpizza.TestFixtures;
import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.repository.ItemRepository;
import pl.app.springpizza.repository.OrderRepository;
import pl.app.springpizza.service.ItemServiceImpl;

import java.util.ArrayList;
import java.util.List;

@ExtendWith(MockitoExtension.class)
public class ItemServiceImplTest {

    @Mock
    private OrderRepository mockOrderRepository;

    @Mock
    private ItemRepository mockItemRepository;

    @InjectMocks
    private ItemServiceImpl itemService;

    @Test
    public void givenNullItem_whenRemove_throwException() {
        IllegalArgumentException exception = Assertions.assertThrows(IllegalArgumentException.class, () -> itemService.removeItem(null));
        Assertions.assertEquals("Item cannot be null", exception.getMessage());
    }

    @Test
    public void givenNonExistingItem_whenRemove_throwException() {
        Item item = Item.builder().id(1L).build();

        IllegalArgumentException exception = Assertions.assertThrows(IllegalArgumentException.class, () -> itemService.removeItem(item));
        Assertions.assertEquals("Item with 1 does not exist", exception.getMessage());

    }

    @Test
    public void givenItemWithoutRelatedOrder_whenRemove_shouldRemove() {
        Item item = Item.builder().id(1L).price(12.99).build();

        Mockito.when(mockItemRepository.existsById(1L)).thenReturn(true);
        Mockito.when(mockOrderRepository.findAllByItemListContains(item)).thenReturn(List.of());

        boolean removed = itemService.removeItem(item);

        Assertions.assertTrue(removed);

    }

    @Test
    public void givenItemWithRelatedOrder_whenRemove_shouldRemoveItem() {
        Item item = Item.builder().id(1L).price(29.99).build();
        Order order = TestFixtures.orderWithItem(item);

        Mockito.when(mockItemRepository.existsById(item.getId())).thenReturn(true);
        Mockito.when(mockOrderRepository.findAllByItemListContains(item)).thenReturn(List.of(order));

        boolean removed = itemService.removeItem(item);

        Assertions.assertTrue(removed);
        Assertions.assertTrue(order.getItemList().isEmpty());


    }

    @Test
    public void givenOrderWithLastRelatedItem_whenRemoveItem_shouldDeleteOrder() {
        Item item = Item.builder().id(1L).price(29.99).build();
        Order order = TestFixtures.orderWithItem(item);

        Mockito.when(mockItemRepository.existsById(item.getId())).thenReturn(true);
        Mockito.when(mockOrderRepository.findAllByItemListContains(item)).thenReturn(List.of(order));

        boolean removed = itemService.removeItem(item);
        Assertions.assertTrue(removed);

        Mockito.verify(mockOrderRepository).delete(order);
    }

    @Test
    public void givenTheSameItemsWithRelatedOrder_whenRemoveTheSameItems_shouldUpdateTotalPrice() {
        Item item1 = Item.builder().id(1L).price(15.00).build();
        Item item2 = Item.builder().id(2L).price(10.00).build();
        Order order = Order.builder().id(1L)
                .itemList(new ArrayList<>(List.of(item1, item1, item2)))
                .sum(40.00).build();

        Mockito.when(mockItemRepository.existsById(1L)).thenReturn(true);

        Mockito.when(mockOrderRepository.findAllByItemListContains(item1)).thenReturn(List.of(order));

        boolean removed = itemService.removeItem(item1);
        Assertions.assertTrue(removed);

        Assertions.assertEquals(10.00, order.getSum());

    }

    @Test
    public void givenOrderWithMultipleItems_whenRemoveItem_shouldUpdateTotalPrice() {
        Item item1 = Item.builder().id(1L).price(10.00).build();
        Item item2 = Item.builder().id(2L).price(15.00).build();
        Item item3 = Item.builder().id(3L).price(15.00).build();

        Order order = Order.builder()
                .id(1L)
                .itemList(new ArrayList<>(List.of(item1, item2, item3)))
                .sum(40.00)
                .build();

        Mockito.when(mockItemRepository.existsById(item1.getId())).thenReturn(true);

        Mockito.when(mockOrderRepository.findAllByItemListContains(item1)).thenReturn(List.of(order));

        boolean removed = itemService.removeItem(item1);

        Assertions.assertTrue(removed);

        Assertions.assertEquals(30.00, order.getSum());
    }

    @Test
    public void givenItemWithMultipleRelatedOrders_whenRemove_shouldUpdateTotalPrice() {
        Item item1 = Item.builder().id(1L).price(10.00).build();
        Item item2 = Item.builder().id(2L).price(20.00).build();
        Order order1 = Order.builder().id(1L)
                .itemList(new ArrayList<>(List.of(item1, item2)))
                .sum(30.00).build();
        Order order2 = Order.builder().id(2L)
                .itemList(new ArrayList<>(List.of(item1)))
                .sum(10.00).build();

        Mockito.when(mockItemRepository.existsById(item1.getId())).thenReturn(true);
        Mockito.when(mockOrderRepository.findAllByItemListContains(item1)).thenReturn(List.of(order1, order2));

        boolean removed = itemService.removeItem(item1);
        Assertions.assertTrue(removed);

        Assertions.assertEquals(20.00, order1.getSum());
        Mockito.verify(mockOrderRepository).delete(order2);

    }
}

