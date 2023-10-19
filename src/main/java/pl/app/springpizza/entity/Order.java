package pl.app.springpizza.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "order_item",
            joinColumns = @JoinColumn(name = "order_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "item_id", referencedColumnName = "id")
    )
    private List<Item> itemList = new ArrayList<>();

    @Column(name = "order_time")
    private LocalDateTime orderTime;

    private Double sum;

    @ManyToOne
    @JoinColumn(name = "place_id")
    private Place place;


    @ManyToOne
    @JoinColumn(name = "status_id")
    private Status status;


    @PrePersist
    public void prePersist() {
        orderTime = LocalDateTime.now();
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Item> getItemList() {
        return itemList;
    }

    public void setItemList(List<Item> itemList) {
        this.itemList = itemList;
    }

    public LocalDateTime getOrderTime() {
        return orderTime;
    }

    public String getOrderTimeFormatted() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        return formatter.format(getOrderTime());
    }

    public void setOrderTime(LocalDateTime orderTime) {
        this.orderTime = orderTime;
    }

    public Double getSum() {
        return sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public Place getPlace() {
        return place;
    }

    public void setPlace(Place place) {
        this.place = place;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", itemList=" + itemList +
                ", orderTime=" + orderTime +
                ", sum=" + sum +
                ", place=" + place +
                ", status=" + status +
                '}';
    }
}
