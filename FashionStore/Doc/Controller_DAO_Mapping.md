# Controller to DAO Mapping

This document outlines the dependencies between the Servlets (Controllers) and the Data Access Objects (DAOs) in the FashionStore application. Understanding these mappings is crucial for tracking data flow from the user interface down to the database layer.

## Overview of Controllers

The controllers in this application are implemented as Java Servlets, residing in the `com.fashionstore.controller` package. They handle HTTP requests, coordinate with DAOs for data manipulation, and forward results to the View layer (JSP).

---

### 1. `LoginServlet`
Manages user authentication and registration.
- **Invokes DAO**: `UserDAO`
- **Key Operations**:
  - `UserDAO.login(email, password)`: Validates user credentials.
  - `UserDAO.registerUser(User)`: Creates a new user account.

### 2. `HomeServlet`
Handles requests for the landing page, loading initial data to display.
- **Invokes DAOs**: `ProductDAO`, `CategoryDAO`
- **Key Operations**:
  - `ProductDAO.getLatestProducts(limit)`: Fetches new arrivals.
  - `CategoryDAO.getAllCategories()`: Loads categories for the navigation menu.

### 3. `ProductServlet`
Manages the product listing pages, including category filtering and searching.
- **Invokes DAOs**: `ProductDAO`, `CategoryDAO`
- **Key Operations**:
  - `ProductDAO.getAllProducts()`: Retrieves all available products.
  - `ProductDAO.getProductsByCategory(categoryId)`: Retrieves products for a specific category.
  - `CategoryDAO.getAllCategories()`: Required to populate sidebar filters.

### 4. `ProductDetailsServlet`
Displays the detailed view of a single product, including its variants (size, color).
- **Invokes DAOs**: `ProductDAO`, `ProductVariantDAO`
- **Key Operations**:
  - `ProductDAO.getProductById(productId)`: Fetches the core product information.
  - `ProductVariantDAO.getVariantsByProductId(productId)`: Fetches the specific variants available (e.g., sizes, colors, stock availability).

### 5. `CartServlet`
Handles adding items to the user's shopping cart and viewing the cart.
- **Invokes DAOs**: `CartDAO`, `CartItemDAO`, `ProductVariantDAO`
- **Key Operations**:
  - `CartDAO.getCartByUserId(userId)`: Finds the active session cart.
  - `CartDAO.createCart(userId)`: Creates a cart if none exists.
  - `CartItemDAO.addCartItem(cartId, variantId, quantity)`: Inserts a variant into the cart.
  - `CartItemDAO.getCartItems(cartId)`: Retrieves all items currently in the cart.

### 6. `RemoveCartServlet`
Handles the removal or quantity decrement of items from the shopping cart.
- **Invokes DAO**: `CartItemDAO`
- **Key Operations**:
  - `CartItemDAO.removeCartItem(cartItemId)`: Deletes the item from the database.
  - `CartItemDAO.updateQuantity(cartItemId, newQuantity)`: Updates the item count.

### 7. `CheckoutServlet`
Handles the final checkout process, converting a shopping cart into an actual order.
- **Invokes DAOs**: `OrderDAO`, `OrderItemDAO`, `CartItemDAO`
- **Key Operations**:
  - `CartItemDAO.getCartItems(cartId)`: Fetches items being purchased.
  - `OrderDAO.createOrder(Order)`: Saves the main order details (shipping, total).
  - `OrderItemDAO.addOrderItem(orderId, OrderItem)`: Copies cart items to the final order items log.
  - `CartItemDAO.clearCart(cartId)`: Empties the user's cart post-purchase.

### 8. `OrderSuccessServlet`
Displays the confirmation page after a successful checkout.
- **Invokes DAO**: `OrderDAO` (Optional)
- **Key Operations**:
  - Usually, it just renders a success view based on session attributes. It may call `OrderDAO.getOrderById(orderId)` if detailed confirmation data needs to be fetched fresh from the DB.
