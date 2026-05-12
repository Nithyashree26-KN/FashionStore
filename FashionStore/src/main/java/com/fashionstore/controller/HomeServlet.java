package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.CategoryDAO;
import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.CategoryDAOImpl;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Category;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // CATEGORY DAO
        CategoryDAO categoryDAO =
                new CategoryDAOImpl();

        // PRODUCT DAO
        ProductDAO productDAO =
                new ProductDAOImpl();

        // GET DATA
        List<Category> categories =
                categoryDAO.getAllCategories();

        List<Product> latestProducts =
                productDAO.getLatestProducts(0);

        // SEND TO JSP
        request.setAttribute(
                "categories",
                categories);

        request.setAttribute(
                "latestProducts",
                latestProducts);

        // OPEN HOME PAGE
        request.getRequestDispatcher(
                "/WEB-INF/views/main.jsp")
                .forward(request, response);
    }
}