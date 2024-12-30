package pl.app.springpizza.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "users")
@ToString(exclude = "userOrders")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    @Size(min = 3, message = "Nickname must be at least 3 characters long")
    @Pattern(regexp = "^\\S+$", message = "Nickname cannot contain spaces")
    private String username;

    @Column(nullable = false)
    @Pattern(regexp = "^(?=.*[A-Z])(?=.*[^\\w\\s])\\S{8,}$", message = "Password must contain at least one uppercase letter, one special character, and be at least 8 characters long without spaces.")
    private String password;

    @Column(name = "first_name")
    @Size(min = 2, message = "First name must be at least 2 characters long")
    @Pattern(regexp = "^\\S+$", message = "First name cannot contain spaces")
    private String firstName;

    @Column(name = "last_name")
    @Size(min = 3, message = "Username must be at least 3 characters long")
    @Pattern(regexp = "^\\S+$", message = "Last name cannot contain spaces")
    private String lastName;

    @Column(nullable = false)
    private String role;

    @Column(nullable = false)
    private Boolean active = false;

    @OneToMany
    @JoinTable(name = "user_order",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "order_id", referencedColumnName = "id"))
    private Set<Order> userOrders = new LinkedHashSet<>();
}
