package pl.app.springpizza;

import pl.app.springpizza.entity.Item;
import pl.app.springpizza.entity.Order;
import pl.app.springpizza.entity.Place;
import pl.app.springpizza.entity.Status;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class TestFixtures {
    public static Item item() {
        return Item.builder()
                .name("Sample Item")
                .shortDescription("Short description")
                .description("This is a sample item with a long description.")
                .type("Sample Type")
                .price(BigDecimal.valueOf(29.99))
                .imgUrl("/img/sample_image.jpg").build();
    }

    public static Place place() {
        return Place.builder()
                .color("salmon").build();
    }

    public static Status status() {
        return Status.builder()
                .name("new")
                .description("order placed").build();
    }

    public static Order orderWithItem(Item item) {
        return Order.builder()
                .itemList(new ArrayList<>(List.of(item)))
                .orderTime(LocalDateTime.now()).build();
    }

    public static Order orderWithMultipleItems(List<Item> items) {
        return Order.builder()
                .itemList(new ArrayList<>(items))
                .orderTime(LocalDateTime.now()).build();
    }

    public static Order orderWithStatusAndPlace(Status status, Place place) {
        return Order.builder()
                .orderTime(LocalDateTime.now())
                .sum(BigDecimal.valueOf(29.99))
                .place(place).build();
    }

    public static Order orderWithItemAndStatusAndPlace(Item item, Status status, Place place) {
        return Order.builder()
                .itemList(new ArrayList<>(List.of(item)))
                .orderTime(LocalDateTime.now())
                .sum(BigDecimal.valueOf(29.99))
                .status(status)
                .place(place).build();
    }
}

