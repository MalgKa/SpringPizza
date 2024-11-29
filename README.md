# SpringPizza - Pizza Ordering Application

This is the repository of the Spring Pizza project, which is an example of a web application based on the Spring
Framework.

## Project description

SpringPizza is a modern web application that combines the convenience and simplicity of ordering pizza in a restaurant.
The project is built on the Spring Framework technologies, providing both customers and restaurant staff with tools to
streamline the ordering process and menu management.

view for Customers:

https://github.com/MalgKa/SpringPizza/assets/102424519/282bff59-6398-4e0d-bcf7-487297d18af9

view for staff:

https://github.com/MalgKa/SpringPizza/assets/102424519/445dc002-0cc6-45ca-b118-565c085f090c

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

- **Java 11**: Programming language and runtime environment used to build the application.
- **Spring Boot 2.7.16**: For building fast and reliable Java applications.
- **Spring MVC**: For creating the user interface and handling HTTP requests.
- **Spring Data JPA**: For easy data access and database management.
- **Spring Security**: To provide authentication and authorization for users.
- **MySQL**: As the database management system.
- **HTML, CSS, JavaScript** and **Bootstrap library**: For creating an attractive user interface.

## Secure User Authentication

- Access Control: Access to different parts of the application is controlled based authentication.

## How to Run the Application

To run the SpringPizza application on your local environment, follow these steps:

### Step 1. Clone this Repository to your computer

```bash
git clone git@github.com:MalgKa/SpringPizza.git
```

### Step 2. Check Java Version

The application requires Java 11 or newer to run. Make sure you have the correct version installed by running:

```bash
java -version
```

If Java is not installed or the version is lower than 11, follow the instructions below:

**Windows:**

1. Download the Java JDK 11 installer
   from [Oracle](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html).
2. Run the installer and follow the instructions.
3. Add the Java `bin` directory to your system `PATH` (if not done automatically).

**Linux:**

Run the following commands:

```bash
sudo apt update
sudo apt install openjdk-11-jdk
```

### Step 3. Install MySQL

Check if MySQL is installed by running:

```bash
mysql --version
```

If MySQL is not installed, follow the instructions below:

**Windows:**

1. Download the MySQL installer from the [MySQL Community Server website](https://dev.mysql.com/downloads/mysql)
2. Run the installer and follow the setup wizard. Choose "Developer Default" or "Server Only" setup.
3. Set up a root password during installation and note it down.

**Linux:**  
Run the following commands:

```bash
sudo apt update
sudo apt install mysql-server
```

Secure your installation:

```bash
sudo mysql_secure_installation
```

Set up the root user and password during the process.

### Step 4. Import the provided database dump

The dump file `springpizza_dump.sql` is located in the `src/db` folder of the project.  
Run the following command to import the dump into your MySQL database:

```bash
mysql -u your_username -p SpringPizza < path/to/springpizza_dump.sql
```

- Replace `path/to/springpizza_dump.sql` with the actual path to the `springpizza_dump.sql` file on your
  machine.
- Replace `[your_username]` with your MySQL username.
- You will be prompted for your MySQL password.

***Note:*** *The provided database dump contains sample data. These are fictional entries
meant to demonstrate how the application works. Now, you can add your own data or create a completely new database from
scratch.*

### Step 5. Configure the Application

1. Open the `src/main/resources/application.properties` file.
2. Update the database connection settings:

    * `spring.datasource.url=jdbc:mysql://localhost:3306/SpringPizza?serverTimezone=UTC`
    * `spring.datasource.username=[your_username]`
    * `spring.datasource.password=[your_password]`

Replace `[your_username]` and `[your_password]` with your MySQL credentials.

### Step 6. Install Maven

If Maven is not already installed, download it from [Maven Downloads](https://maven.apache.org/download.cgi) or use your
package manager.

Verify Maven installation:

```bash
mvn -version
```

### Step 7. Build the Application

Run the following command to compile the project and resolve all dependencies:

```bash
./mvnw clean install
```

### Step 8. Run the Application

Start the application using:

```bash
./mvnw spring-boot:run
```

### Step 9. Access the Application

Once the application starts successfully, it will be accessible at the following URLs:

* **Customer Portal**: [http://localhost:8080/home](http://localhost:8080/home)
  or  [http://localhost:8080](http://localhost:8080)  
  You can access these endpoints as a ***regular user*** without logging in or as a ***logged-in user*** using the
  following credentials:
    - **Username**: `user`
    - **Password**: `user`


* **Staff Portal**: [http://localhost:8080/order/panel](http://localhost:8080/order/panel)  
  You can access this endpoint only as an ***administrator***. Log in with the following credentials:
    - **Username**: `admin`
    - **Password**: `admin`

## Future Improvements

Here are some enhancements and features planned for future updates to the SpringPizza application:

- **Upgrade Java and Spring Boot Version**: Update the application to Java 17 (or higher) and Spring Boot 3 for improved
    performance and enhanced security.
- **User Account Activation**: Implement functionality to send confirmation emails for account activation.
- **Unit and Integration Tests**: Add comprehensive unit and integration tests to ensure code quality and reliability.
- **Improved User Interface**: Refine the UI for a better user experience, including more responsive design elements.
- **Loyalty Program Discounts**: Introduce a loyalty program where users can earn points on their purchases, which can
  be
  used for discounts.
- **Dynamic Discounts**: Automatically calculate and apply discounts based on the loyalty program or promotional offers.
- **Additional Features**: Expand the application with features like user reviews and ratings.

## Contributions

I warmly welcome contributions from the community. If you have ideas for improving the application, bug fixes, or new
features, please use the Pull Request feature and join in the project's development.
