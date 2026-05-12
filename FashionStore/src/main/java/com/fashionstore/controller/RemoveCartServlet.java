package com.fashionstore.controller;

import java.io.IOException;
import java.util.List;

import com.fashionstore.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove-cart")
public class RemoveCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int productId =
                Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();

        List<Product> cart =
                (List<Product>) session.getAttribute("cart");

        if(cart != null){

            cart.removeIf(
                p -> p.getProductId() == productId
            );

            session.setAttribute("cart", cart);
        }

        response.sendRedirect(
            request.getContextPath() + "/cart"
        );
    }
}