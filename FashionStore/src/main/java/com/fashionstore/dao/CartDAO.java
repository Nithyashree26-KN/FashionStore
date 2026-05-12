package com.fashionstore.dao;

import com.fashionstore.model.Cart;

public interface CartDAO {

    // Create
    void createCart(int userId);

    // Read
    Cart getCartByUserId(int userId);

    // Clear cart (remove all items)
    void clearCart(int cartId);

    // Optional: update timestamps
    void updateCart(int cartId);
}