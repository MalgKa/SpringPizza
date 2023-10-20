# SpringPizza - Pizza Ordering Application

This is the repository of the Spring Pizza project, which is an example of a web application based on the Spring
Framework.

## Project description

SpringPizza is a modern web application that combines the convenience and simplicity of ordering pizza in a restaurant.
The project is built on the Spring Framework technologies, providing both customers and restaurant staff with tools to
streamline the ordering process and menu management.

## Application Features

#### For Customers

- Table Selection: Customers can choose an available table in the restaurant, enabling a personalized and comfortable
  dining experience.
- Menu Browsing: Access to an extensive menu with various pizza options, beverages, and pasta.
- Pizza Ordering: Customers can add selected items to their cart, place orders, and also remove items
  from their cart. Additionally, they have the option to view a more detailed product description from the menu, along
  with a product image.

#### For Employees

- Menu Management: Staff can add, update, and remove pizza, beverage, and pasta items from the menu.
- Order Taking: Accept and relay orders to the kitchen, and mark them as received, being prepared, out for delivery or
  paid.
- Order Fulfillment: Staff can filter orders by order status, making it easier to track orders from acceptance through
  delivery to the table, all the way to payment.
- Managing the Reservation System: Employees have the ability to modify table selection, pricing, and grant discounts.
- Order Timestamp Color Change: After 40 minutes from placing an order, the order timestamp changes to red for easy
  identification and timely service performance.

## Technologies Used in the Application

The SpringPizza application leverages several modern technologies, including:

- Java: Programming Language
- Spring Boot: For building fast and reliable Java applications.
- Spring MVC: For creating the user interface and handling HTTP requests.
- Spring Data JPA: For easy data access and database management.
- Spring Security: To provide authentication and authorization for users.
- MySQL: As the database management system.
- HTML, CSS, JavaScript and Bootstrap library: For creating an attractive user interface.

## Secure User Authentication

- Access Control: Access to different parts of the application is controlled based authentication.

## How to Run the Application

To run the SpringPizza application on your local environment, follow these steps:

1. Clone this repository to your computer.
2. Install MySQL and create a database.
3. Configure the database connection in the application.properties file.
4. Run the application using the command ./mvnw spring-boot:run.
5. The application will be accessible at:
    - for Customers http://localhost:8080/home
    - for Staff http://localhost:8080/order/panel

## Contributions

I warmly welcome contributions from the community. If you have ideas for improving the application, bug fixes, or new
features, please use the Pull Request feature and join in the project's development.