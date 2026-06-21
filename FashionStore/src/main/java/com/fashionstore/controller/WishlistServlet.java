package com.fashionstore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fashionstore.dao.ProductDAO;
import com.fashionstore.dao.impl.ProductDAOImpl;
import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final ProductDAO productDAO = new ProductDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idsParam = request.getParameter("ids");
        List<Product> wishlistProducts = new ArrayList<>();

        if (idsParam != null && !idsParam.trim().isEmpty()) {
            String[] ids = idsParam.split(",");
            for (String idStr : ids) {
                try {
                    int productId = Integer.parseInt(idStr.trim());
                    Product p = productDAO.getProductById(productId);
                    if (p != null) {
                        wishlistProducts.add(p);
                    }
                } catch (NumberFormatException e) {
                    // Ignore invalid IDs
                }
            }
        }

        request.setAttribute("wishlistProducts", wishlistProducts);
        request.getRequestDispatcher("/WEB-INF/views/wishlist.jsp").forward(request, response);
    }
}
