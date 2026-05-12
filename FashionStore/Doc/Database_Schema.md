# FashionStore Database Schema

This document details the database schema for the FashionStore project, including table structures, relationships, and their corresponding Java Model classes.

## 1. Entity Relationship Diagram (ERD)

The following diagram illustrates the relationships between the various tables in the database.

```mermaid
erDiagram
    USERS ||--o{ ORDERS : places
    USERS ||--o| CARTS : owns
    CATEGORIES ||--o{ PRODUCTS : contains
    PRODUCTS ||--o{ PRODUCT_VARIANTS : has
    ORDERS ||--o{ ORDER_ITEMS : contains
    CARTS ||--o{ CART_ITEMS : contains
    PRODUCT_VARIANTS ||--o{ ORDER_ITEMS : included_in
    PRODUCT_VARIANTS ||--o{ CART_ITEMS : included_in

    USERS {
        int user_id PK
        string full_name
        string email
        string password
        string phone
        string address_line1
        string address_line2
        string city
        string state
        string pincode
        string country
        timestamp created_at
    }

    PRODUCTS {
        int product_id PK
        int category_id FK
        string product_name
        string description
        double price
        string image_url
    }

    CATEGORIES {
        int category_id PK
        string category_name
        string description
    }

    PRODUCT_VARIANTS {
        int variant_id PK
        int product_id FK
        string size
        string color
        int stock_quantity
    }

    ORDERS {
        int order_id PK
        int user_id FK
        double total_amount
        string status
        string shipping_address
        timestamp order_date
    }

    ORDER_ITEMS {
        int order_item_id PK
        int order_id FK
        int variant_id FK
        int quantity
        double price
    }

    CARTS {
        int cart_id PK
        int user_id FK
    }

    CART_ITEMS {
        int cart_item_id PK
        int cart_id FK
        int variant_id FK
        int quantity
    }
```

---

## 2. Table Definitions & Class Mappings

### 2.1 Table: `users`
Stores all registered customer information.
- **Java Model Class**: `com.fashionstore.model.User`
- **Columns**:
  - `user_id` (INT, Primary Key, Auto Increment)
  - `full_name` (VARCHAR)
  - `email` (VARCHAR, Unique)
  - `phone` (VARCHAR, Unique)
  - `password` (VARCHAR)
  - `address_line1` (VARCHAR)
  - `address_line2` (VARCHAR)
  - `city` (VARCHAR)
  - `state` (VARCHAR)
  - `pincode` (VARCHAR)
  - `country` (VARCHAR)
  - `created_at` (TIMESTAMP)

### 2.2 Table: `categories`
Stores product categories (e.g., Men, Women, Kids, Accessories).
- **Java Model Class**: `com.fashionstore.model.Category`
- **Columns**:
  - `category_id` (INT, Primary Key, Auto Increment)
  - `category_name` (VARCHAR)
  - `description` (TEXT)

### 2.3 Table: `products`
Stores the main product details.
- **Java Model Class**: `com.fashionstore.model.Product`
- **Columns**:
  - `product_id` (INT, Primary Key, Auto Increment)
  - `category_id` (INT, Foreign Key referencing `categories.category_id`)
  - `product_name` (VARCHAR)
  - `description` (TEXT)
  - `price` (DOUBLE)
  - `image_url` (VARCHAR)

### 2.4 Table: `product_variants`
Stores specific variations of a product, such as size and color combinations, along with stock.
- **Java Model Class**: `com.fashionstore.model.ProductVariant`
- **Columns**:
  - `variant_id` (INT, Primary Key, Auto Increment)
  - `product_id` (INT, Foreign Key referencing `products.product_id`)
  - `size` (VARCHAR)
  - `color` (VARCHAR)
  - `stock_quantity` (INT)

### 2.5 Table: `orders`
Stores order headers placed by users.
- **Java Model Class**: `com.fashionstore.model.Order`
- **Columns**:
  - `order_id` (INT, Primary Key, Auto Increment)
  - `user_id` (INT, Foreign Key referencing `users.user_id`)
  - `total_amount` (DOUBLE)
  - `status` (VARCHAR) - e.g., 'PENDING', 'SHIPPED', 'DELIVERED'
  - `shipping_address` (TEXT)
  - `order_date` (TIMESTAMP)

### 2.6 Table: `order_items`
Stores the individual items (variants) purchased within an order.
- **Java Model Class**: `com.fashionstore.model.OrderItem`
- **Columns**:
  - `order_item_id` (INT, Primary Key, Auto Increment)
  - `order_id` (INT, Foreign Key referencing `orders.order_id`)
  - `variant_id` (INT, Foreign Key referencing `product_variants.variant_id`)
  - `quantity` (INT)
  - `price` (DOUBLE) - Price at the time of purchase.

### 2.7 Table: `carts`
Stores active shopping cart sessions for users.
- **Java Model Class**: `com.fashionstore.model.Cart`
- **Columns**:
  - `cart_id` (INT, Primary Key, Auto Increment)
  - `user_id` (INT, Foreign Key referencing `users.user_id`)

### 2.8 Table: `cart_items`
Stores the specific product variants added to a shopping cart.
- **Java Model Class**: `com.fashionstore.model.CartItem`
- **Columns**:
  - `cart_item_id` (INT, Primary Key, Auto Increment)
  - `cart_id` (INT, Foreign Key referencing `carts.cart_id`)
  - `variant_id` (INT, Foreign Key referencing `product_variants.variant_id`)
  - `quantity` (INT)
