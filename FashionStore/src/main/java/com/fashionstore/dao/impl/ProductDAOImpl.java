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
	            p.setCategoryId(rs.getInt("category_id"));
	            p.setProductName(rs.getString("product_name"));
	            p.setBrand(rs.getString("brand"));
	            p.setDescription(rs.getString("description"));
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
	public List<Product> getProductsByPriceRange(double minPrice, double maxPrice) {

	    List<Product> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();
	        String sql = "SELECT * FROM products WHERE price >= ? AND price <= ? ORDER BY price ASC";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setDouble(1, minPrice);
	        ps.setDouble(2, maxPrice);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Product p = new Product();
	            p.setProductId(rs.getInt("product_id"));
	            p.setCategoryId(rs.getInt("category_id"));
	            p.setProductName(rs.getString("product_name"));
	            p.setBrand(rs.getString("brand"));
	            p.setDescription(rs.getString("description"));
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
	public List<Product> getProductsByFilters(Integer categoryId, Double minPrice, Double maxPrice, String keyword) {

	    List<Product> list = new ArrayList<>();

	    try {
	        Connection con = DBConnection.getConnection();

	        StringBuilder sql = new StringBuilder("SELECT * FROM products WHERE 1=1");

	        if (categoryId != null) {
	            sql.append(" AND category_id = ?");
	        }
	        if (minPrice != null) {
	            sql.append(" AND price >= ?");
	        }
	        if (maxPrice != null) {
	            sql.append(" AND price <= ?");
	        }
	        if (keyword != null && !keyword.trim().isEmpty()) {
	            sql.append(" AND (product_name LIKE ? OR description LIKE ?)");
	        }
	        sql.append(" ORDER BY price ASC");

	        PreparedStatement ps = con.prepareStatement(sql.toString());
	        int idx = 1;

	        if (categoryId != null) ps.setInt(idx++, categoryId);
	        if (minPrice   != null) ps.setDouble(idx++, minPrice);
	        if (maxPrice   != null) ps.setDouble(idx++, maxPrice);
	        if (keyword != null && !keyword.trim().isEmpty()) {
	            String like = "%" + keyword.trim() + "%";
	            ps.setString(idx++, like);
	            ps.setString(idx++, like);
	        }

	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Product p = new Product();
	            p.setProductId(rs.getInt("product_id"));
	            p.setCategoryId(rs.getInt("category_id"));
	            p.setProductName(rs.getString("product_name"));
	            p.setBrand(rs.getString("brand"));
	            p.setDescription(rs.getString("description"));
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
	public List<Product> getProductsSortedByPriceAsc() {

	    List<Product> list = new ArrayList<>();
	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM products ORDER BY price ASC");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Product p = new Product();
	            p.setProductId(rs.getInt("product_id"));
	            p.setCategoryId(rs.getInt("category_id"));
	            p.setProductName(rs.getString("product_name"));
	            p.setBrand(rs.getString("brand"));
	            p.setDescription(rs.getString("description"));
	            p.setPrice(rs.getDouble("price"));
	            p.setImageUrl(rs.getString("image_url"));
	            list.add(p);
	        }
	    } catch (Exception e) { e.printStackTrace(); }
	    return list;
	}

	@Override
	public List<Product> getProductsSortedByPriceDesc() {

	    List<Product> list = new ArrayList<>();
	    try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM products ORDER BY price DESC");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Product p = new Product();
	            p.setProductId(rs.getInt("product_id"));
	            p.setCategoryId(rs.getInt("category_id"));
	            p.setProductName(rs.getString("product_name"));
	            p.setBrand(rs.getString("brand"));
	            p.setDescription(rs.getString("description"));
	            p.setPrice(rs.getDouble("price"));
	            p.setImageUrl(rs.getString("image_url"));
	            list.add(p);
	        }
	    } catch (Exception e) { e.printStackTrace(); }
	    return list;
	}

	@Override
	public List<Product> getActiveProducts() {
		return getAllProducts();
	}
	@Override
	public List<Product> getProductsByCategoryId(int categoryId){

	    List<Product> products =
	    new ArrayList<>();

	    String query =
	    "SELECT * FROM products WHERE category_id=?";

	    try{

	        Connection con =
	        DBConnection.getConnection();

	        PreparedStatement ps =
	        con.prepareStatement(query);

	        ps.setInt(1, categoryId);

	        ResultSet rs =
	        ps.executeQuery();

	        while(rs.next()){

	            Product p =
	            new Product();

	            p.setProductId(
	            rs.getInt("product_id"));

	            p.setCategoryId(
	            rs.getInt("category_id"));

	            p.setProductName(
	            rs.getString("product_name"));

	            p.setBrand(
	            rs.getString("brand"));

	            p.setDescription(
	            rs.getString("description"));

	            p.setPrice(
	            rs.getDouble("price"));

	            p.setImageUrl(
	            rs.getString("image_url"));

	            products.add(p);
	        }

	    }catch(Exception e){

	        e.printStackTrace();
	    }

	    return products;
	}
	@Override
	public List<Product> searchProducts(String keyword){

	    List<Product> products =
	            new ArrayList<>();

	    String query =
	            "SELECT * FROM products WHERE product_name LIKE ?";

	    try{

	        Connection con =
	                DBConnection.getConnection();

	        PreparedStatement ps =
	                con.prepareStatement(query);

	        ps.setString(1, "%" + keyword + "%");

	        ResultSet rs =
	                ps.executeQuery();

	        while(rs.next()){

	            Product p =
	                    new Product();

	            p.setProductId(
	                    rs.getInt("product_id"));

	            p.setCategoryId(
	                    rs.getInt("category_id"));

	            p.setProductName(
	                    rs.getString("product_name"));

	            p.setBrand(
	                    rs.getString("brand"));

	            p.setDescription(
	                    rs.getString("description"));

	            p.setPrice(
	                    rs.getDouble("price"));

	            p.setImageUrl(
	                    rs.getString("image_url"));

	            products.add(p);
	        }

	    }catch(Exception e){

	        e.printStackTrace();
	    }

	    return products;
	}
}