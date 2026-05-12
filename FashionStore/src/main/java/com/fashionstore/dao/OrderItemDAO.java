package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.OrderItem;

public interface OrderItemDAO {

    // Add item to order
    void addOrderItem(OrderItem orderItem);

    // Get all items for a specific order
    List<OrderItem> getOrderItemsByOrderId(int orderId);
}