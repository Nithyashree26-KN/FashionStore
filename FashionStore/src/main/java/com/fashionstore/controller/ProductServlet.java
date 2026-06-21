package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String categoryParam = request.getParameter("category");
        String keyword       = request.getParameter("keyword");
        String minPriceParam = request.getParameter("minPrice");
        String maxPriceParam = request.getParameter("maxPrice");
        String sort          = request.getParameter("sort");

        // Parse optional filter values
        Integer categoryId = null;
        Double  minPrice   = null;
        Double  maxPrice   = null;

        if (categoryParam != null && !categoryParam.trim().isEmpty()) {
            try { categoryId = Integer.parseInt(categoryParam); } catch (NumberFormatException ignored) {}
        }
        if (minPriceParam != null && !minPriceParam.trim().isEmpty()) {
            try { minPrice = Double.parseDouble(minPriceParam); } catch (NumberFormatException ignored) {}
        }
        if (maxPriceParam != null && !maxPriceParam.trim().isEmpty()) {
            try { maxPrice = Double.parseDouble(maxPriceParam); } catch (NumberFormatException ignored) {}
        }

        List<Product> products;

        boolean hasFilters = (categoryId != null)
                          || (minPrice != null)
                          || (maxPrice != null)
                          || (keyword  != null && !keyword.trim().isEmpty());

        if (hasFilters) {
            // Use the combined filter query
            products = productDAO.getProductsByFilters(categoryId, minPrice, maxPrice, keyword);

            // Apply sort on top of filtered results if requested
            if ("price_desc".equals(sort)) {
                products.sort((a, b) -> Double.compare(b.getPrice(), a.getPrice()));
            }
            // Default from getProductsByFilters is already price ASC
            // If user explicitly chose price_asc, no extra work needed

        } else if ("price_asc".equals(sort)) {
            products = productDAO.getProductsSortedByPriceAsc();

        } else if ("price_desc".equals(sort)) {
            products = productDAO.getProductsSortedByPriceDesc();

        } else {
            products = productDAO.getAllProducts();
        }

        // Pass current filter values back to JSP so the form retains its state
        request.setAttribute("products",    products);
        request.setAttribute("selCategory", categoryParam  != null ? categoryParam  : "");
        request.setAttribute("selMin",      minPriceParam  != null ? minPriceParam  : "");
        request.setAttribute("selMax",      maxPriceParam  != null ? maxPriceParam  : "");
        request.setAttribute("selSort",     sort           != null ? sort           : "");
        request.setAttribute("selKeyword",  keyword        != null ? keyword        : "");

        request.getRequestDispatcher("/WEB-INF/views/products.jsp")
               .forward(request, response);
    }
}