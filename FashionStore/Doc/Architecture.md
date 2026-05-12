# FashionStore Architecture

The FashionStore application is built using a classic Model-View-Controller (MVC) architecture implemented with Java Servlets, JSP (assumed for views), and JDBC for database access.

## 1. MVC Design Pattern

The application strictly separates concerns into three distinct layers:

- **Model (Entities & DAOs)**: Located in `com.fashionstore.model` and `com.fashionstore.dao`. This layer represents the data structures (e.g., `User`, `Product`, `Order`) and the Data Access Objects (DAOs) responsible for interacting with the MySQL database using JDBC.
- **View (JSP/HTML)**: Handles the presentation logic. It receives data from the controllers and renders it to the user.
- **Controller (Servlets)**: Located in `com.fashionstore.controller`. Servlets like `LoginServlet`, `ProductServlet`, and `CheckoutServlet` act as the orchestrators. They intercept HTTP requests, process user input, interact with the DAOs to manipulate data, and forward the response to the appropriate View.

---

## 2. Class Diagram

The following diagram illustrates the relationships between the core entity classes and their corresponding Data Access Objects.

```mermaid
classDiagram
    class User {
        -int userId
        -String fullName
        -String email
        -String password
        -String phone
        -String addressLine1
        -String city
        -String state
        -String pincode
        -String country
    }

    class Product {
        -int productId
        -int categoryId
        -String name
        -String description
        -double price
        -String imageUrl
    }
    
    class Category {
        -int categoryId
        -String name
        -String description
    }

    class ProductVariant {
        -int variantId
        -int productId
        -String size
        -String color
        -int stockQuantity
    }

    class Order {
        -int orderId
        -int userId
        -double totalAmount
        -String status
        -String shippingAddress
        -Timestamp orderDate
    }

    class OrderItem {
        -int orderItemId
        -int orderId
        -int variantId
        -int quantity
        -double price
    }

    class Cart {
        -int cartId
        -int userId
    }

    class CartItem {
        -int cartItemId
        -int cartId
        -int variantId
        -int quantity
    }

    User "1" -- "*" Order : places
    User "1" -- "1" Cart : owns
    Category "1" -- "*" Product : contains
    Product "1" -- "*" ProductVariant : has
    Order "1" -- "*" OrderItem : contains
    Cart "1" -- "*" CartItem : contains
    ProductVariant "1" -- "*" OrderItem : included in
    ProductVariant "1" -- "*" CartItem : included in
    
    class UserDAO {
        <<interface>>
        +registerUser(User)
        +login(email, password)
        +getUserById(id)
    }
    
    class ProductDAO {
        <<interface>>
        +getAllProducts()
        +getProductById(id)
        +getProductsByCategory(categoryId)
    }
    
    UserDAO ..> User : manages
    ProductDAO ..> Product : manages
```

---

## 3. Sequence Diagrams

### 3.1 User Login Flow
This diagram shows the process when a user attempts to log in.

```mermaid
sequenceDiagram
    actor Client
    participant LoginServlet as LoginServlet (Controller)
    participant UserDAO as UserDAOImpl (Model)
    participant Database as Database

    Client->>LoginServlet: POST /login (email, password)
    LoginServlet->>UserDAO: login(email, password)
    UserDAO->>Database: SELECT * FROM users WHERE email=? AND password=?
    Database-->>UserDAO: ResultSet
    
    alt valid credentials
        UserDAO-->>LoginServlet: User object
        LoginServlet->>LoginServlet: Create HttpSession & set User
        LoginServlet-->>Client: Redirect to /home
    else invalid credentials
        UserDAO-->>LoginServlet: null
        LoginServlet-->>Client: Forward to login.jsp with Error
    end
```

### 3.2 Add to Cart Flow
This diagram illustrates the flow when a user adds a specific product variant to their shopping cart.

```mermaid
sequenceDiagram
    actor Client
    participant CartServlet as CartServlet (Controller)
    participant CartDAO as CartDAOImpl (Model)
    participant CartItemDAO as CartItemDAOImpl (Model)
    participant Database as Database

    Client->>CartServlet: POST /cart (action=add, variantId, qty)
    
    alt Cart does not exist for User
        CartServlet->>CartDAO: createCart(userId)
        CartDAO->>Database: INSERT INTO carts
        Database-->>CartDAO: auto-generated cartId
    end
    
    CartServlet->>CartItemDAO: addCartItem(cartId, variantId, qty)
    CartItemDAO->>Database: INSERT INTO cart_items or UPDATE qty
    Database-->>CartItemDAO: Success
    CartItemDAO-->>CartServlet: true
    
    CartServlet-->>Client: Redirect to /cart (view cart)
```

### 3.3 Checkout & Order Placement Flow
This diagram shows the process of checking out and converting a cart into an order.

```mermaid
sequenceDiagram
    actor Client
    participant CheckoutServlet as CheckoutServlet (Controller)
    participant CartItemDAO as CartItemDAOImpl (Model)
    participant OrderDAO as OrderDAOImpl (Model)
    participant OrderItemDAO as OrderItemDAOImpl (Model)
    participant Database as Database

    Client->>CheckoutServlet: POST /checkout (shipping details)
    CheckoutServlet->>CartItemDAO: getCartItems(cartId)
    CartItemDAO-->>CheckoutServlet: List<CartItem>
    
    CheckoutServlet->>OrderDAO: createOrder(Order)
    OrderDAO->>Database: INSERT INTO orders
    Database-->>OrderDAO: generated orderId
    
    loop For each CartItem
        CheckoutServlet->>OrderItemDAO: addOrderItem(orderId, CartItem details)
        OrderItemDAO->>Database: INSERT INTO order_items
    end
    
    CheckoutServlet->>CartItemDAO: clearCart(cartId)
    CartItemDAO->>Database: DELETE FROM cart_items WHERE cartId=?
    
    CheckoutServlet-->>Client: Redirect to /orderSuccess
```
