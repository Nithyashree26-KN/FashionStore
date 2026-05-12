
package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.Product;

public interface ProductDAO {

    // Basic CRUD
    void addProduct(Product product);
    Product getProductById(int productId);
    List<Product> getAllProducts();
    
    void updateProduct(Product product);
    void deleteProduct(int productId);

    // Filters & Search
    
    List<Product> getLatestProducts(int limit);
    List<Product> getProductsByCategory(int categoryId);
    List<Product> searchProducts(String keyword);
    List<Product> getProductsByPriceRange(double minPrice, double maxPrice);
    List<Product> getProductsByFilters(Integer categoryId, Double minPrice, Double maxPrice, String keyword);

    // Sorting
    List<Product> getProductsSortedByPriceAsc();
    List<Product> getProductsSortedByPriceDesc();

    // Status
    List<Product> getActiveProducts();
}