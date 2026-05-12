package com.fashionstore.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductVariantDAO;
import com.fashionstore.model.ProductVariant;
import com.fashionstore.util.DBConnection;

public class ProductVariantDAOImpl implements ProductVariantDAO {

    @Override
    public List<ProductVariant> getVariantsByProductId(int productId) {

        List<ProductVariant> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM product_variants WHERE product_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, productId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                ProductVariant variant = new ProductVariant();

                variant.setVariantId(rs.getInt("variant_id"));
                variant.setProductId(rs.getInt("product_id"));
                variant.setSize(rs.getString("size_label"));
                variant.setStockQuantity(rs.getInt("stock_quantity"));

                list.add(variant);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public void addVariant(ProductVariant variant) {
    }

    @Override
    public ProductVariant getVariantById(int variantId) {
        return null;
    }

    @Override
    public void updateVariant(ProductVariant variant) {
    }

    @Override
    public void deleteVariant(int variantId) {
    }
}