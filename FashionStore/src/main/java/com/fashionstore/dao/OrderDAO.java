package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Order;

public interface OrderDAO {

    // Create order (returns generated orderId)
    int createOrder(Order order);

    // Read
    Order getOrderById(int orderId);
    List<Order> getOrdersByUserId(int userId);

    // Update order status
    void updateOrderStatus(int orderId, String status);
}