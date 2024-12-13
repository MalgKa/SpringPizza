package pl.app.springpizza.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.math.BigDecimal;

@Data
@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "enter name")
    private String name;

    @NotBlank(message = "enter short description")
    @Column(name = "short_description")
    private String shortDescription;

    @NotBlank(message = "enter description")
    @Column(length = 1024)
    private String description;

    @NotBlank(message = "enter type")
    private String type;

    @NotNull(message = "enter price")
    private BigDecimal price;

    @Column(name = "img_url")
    private String imgUrl;

    private String availability;
}
