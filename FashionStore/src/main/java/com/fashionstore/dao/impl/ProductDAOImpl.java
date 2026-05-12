package com.fashionstore.dao.impl;

import java.sql.*;
import java.util.*;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.model.Product;
import com.fashionstore.util.DBConnection;

public class ProductDAOImpl implements ProductDAO {

    @Override
    public List<Product> getLatestProducts(int limit) {

        List<Product> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM products ORDER BY product_id DESC LIMIT ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, limit);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();

                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setImageUrl(rs.getString("image_url"));

                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

	@Override
	public void addProduct(Product product) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Product getProductById(int productId) {

	    Product product = null;

	    try {

	        Connection con = DBConnection.getConnection();

	        String sql = "SELECT * FROM products WHERE product_id = ?";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setInt(1, productId);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            product = new Product();

	            product.setProductId(rs.getInt("product_id"));
	            product.setProductName(rs.getString("product_name"));
	            product.setPrice(rs.getDouble("price"));
	            product.setDescription(rs.getString("description"));
	            product.setImageUrl(rs.getString("image_url"));

	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return product;
	}
	@Override
	public List<Product> getAllProducts() {

	    List<Product> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();

	        String sql = "SELECT * FROM products";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            Product p = new Product();

	            p.setProductId(rs.getInt("product_id"));
	            p.setProductName(rs.getString("product_name"));
	            p.setPrice(rs.getDouble("price"));

	            list.add(p);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}

	@Override
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProduct(int productId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Product> getProductsByCategory(int categoryId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> searchProducts(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductsByFilters(Integer categoryId, Double minPrice, Double maxPrice, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductsSortedByPriceAsc() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getProductsSortedByPriceDesc() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> getActiveProducts() {
		// TODO Auto-generated method stub
		return null;
	}
}