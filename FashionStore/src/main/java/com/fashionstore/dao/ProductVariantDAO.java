package com.fashionstore.dao;

import java.util.List;
import com.fashionstore.model.ProductVariant;

public interface ProductVariantDAO {

    // Create
    void addVariant(ProductVariant variant);

    // Read
    ProductVariant getVariantById(int variantId);
    List<ProductVariant> getVariantsByProductId(int productId);

    // Update
    void updateVariant(ProductVariant variant);

    // Delete
    void deleteVariant(int variantId);
}