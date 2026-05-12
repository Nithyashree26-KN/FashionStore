package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.CartItem;

public interface CartItemDAO {

    // Add item to cart
    void addCartItem(CartItem cartItem);

    // Update quantity
    void updateCartItem(CartItem cartItem);

    // Remove item
    void removeCartItem(int cartItemId);

    // Get all items in a cart
    List<CartItem> getCartItemsByCartId(int cartId);

    // Get specific item (used to check if already exists)
    CartItem getCartItemByVariant(int cartId, int variantId);
}